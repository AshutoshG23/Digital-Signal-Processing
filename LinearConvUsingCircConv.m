clc;clear all;
x = [2 3 4 5]; h = [1 2 3];
L = length(x); M = length(h);
N = L+M-1;
n = 0 : N-1;
x1 = [x zeros(1,N-L)];
h1 = [h zeros(1,N-M)];
x2 = [x1(1) fliplr(x1(2:end))];
y = zeros(1,N);
for i=1:N
    y(i) = x2*transpose(h1);
    x2 = [x2(end) x2(1:end-1)];
end
z = cconv(x1,h1,N);
subplot(2,2,1);stem(n,x1);title('Sequence1');xlabel('n');ylabel('x1');
subplot(2,2,2);stem(n,h1);title('Sequence2');xlabel('n');ylabel('h1');
subplot(2,2,3);stem(n,y);title('Linear Convolution');xlabel('n');ylabel('y');
subplot(2,2,4);stem(n,z);title('conv()');xlabel('n');ylabel('y1');