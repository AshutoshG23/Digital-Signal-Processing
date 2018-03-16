%*Generation of Sine Using Filtering*%

clc;clear all;
n=0:50;

f=input('Enter frequency of sine signal ');
fs=input('Enter Sampling frequency ');

%Impulse%
x=zeros(1,length(n));
x(1)=1;

%System Coefficients%
b=[0 sin(2*pi*(f/fs)) 0];
a=[1 -2*cos(2*pi*(f/fs)) 1];

%Using filter command%
filop=filter(b,a,x);

%Using difference equation%
y1=0; y2=0; x1=0; x2=0; y=zeros(1,length(n));
for i=1:length(n)
    y(i)= -(a(2)*y1)-(a(3)*y2)+(b(1)*x(i))+(b(2)*x1)+(b(3)*x2);
    y2=y1; y1=y(i);
    x2=x1; x1=x(i);
end

%Plots%
subplot(3,1,1);stem(n,x);title('Impulse');xlabel('n');ylabel('V');
subplot(3,1,2);stem(n,y);title('Sine Using Diff Eqt');xlabel('n');ylabel('V');
subplot(3,1,3);stem(n,filop);title('Sine Using Filter Command');xlabel('n');ylabel('V');