clear
clc
x=0.1:1/22:1;
%Desired output vector
T=(1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

w1 = randn(1);
b1 = randn(1);
w2 = randn(1);
b2 = randn(1);
w3 = randn(1);
b3 = randn(1);
w4 = randn(1);
b4 = randn(1);

w11= randn(1);
w22= randn(1);
w33= randn(1);
w44= randn(1);
b11= randn(1);
n=0.1;
for iii = 1:100000
    for i = 1:length(x)
        v = x(i)*w1 + b1;
        y1=1/(1+exp(-v));
        v = x(i)*w2 + b2;
        y2=1/(1+exp(-v));
        v = x(i)*w3 + b3;
        y3=1/(1+exp(-v));
        v = x(i)*w4 + b4;
        y4=1/(1+exp(-v));
        v=y1*w11+y2*w22+y3*w33+y4*w44+b11;
        y=v;
        e=T(i)-y;
        
        w11=w11+n*e*y1;
        w22=w22+n*e*y2;
        w33=w33+n*e*y3;
        w44=w44+n*e*y4;
        b11=b11+n*e;
        
        d1=(y1)*(1-y1)*e*w11;
        w1=w1+n*d1*x(i);
        
        d2=(y2)*(1-y2)*e*w22;
        w2=w2+n*d2*x(i);
        
        d3=(y3)*(1-y3)*e*w33;
        w3=w3+n*d3*x(i);
        
        d4=(y4)*(1-y4)*e*w44;
        w4=w4+n*d4*x(i);
        
        b1 = b1 + n*d1;
        b2 = b2 + n*d2;
        b3 = b3 + n*d3;
        b4 = b4 + n*d4;
    end
end
x2=-1:1/10000:2;
Y=[];
for i = 1:length(x2)
    v = x2(i)*w1 + b1;
    y1=1/(1+exp(-v));
    v = x2(i)*w2 + b2;
    y2=1/(1+exp(-v));
    v = x2(i)*w3 + b3;
    y3=1/(1+exp(-v));
    v = x2(i)*w4 + b4;
    y4=1/(1+exp(-v));
    v=y1*w11+y2*w22+y3*w33+y4*w44+b11;
    y=v;
    Y=[Y,y];
end

figure
plot(x,T,x2,Y)