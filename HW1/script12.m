filename = 'Dateset2.txt'
Input = csvread(filename,1,0)

n = size(Input,1)
m = 9
Xs = Input * [1;0]
Ys = Input * [0;1]
A = Xs * [1,1,1,1,1,1,1,1,1]

for i=1:n
    for j=1:m
        mu = 0.125 * (j-1)
        tw = 0.125
        c = 1 / ( sqrt(2*pi) * tw )
        
        A(i,j) = c * exp ( -( A(i,j)-mu )^2 / (2*tw^2) ) 
    end
end

xhead = inv(A.'*A)*(A.'*Ys)
disp(xhead)
B = A*xhead - Ys
disp( B.'*B/n )

gX = linspace(-0.2,1.2)';
gY = gX

for i=1:size(gX)
    sum=0
    for j=1:m
        mu = 0.125 * (j-1)
        tw = 0.125
        c = 1 / ( sqrt(2*pi) * tw )
        
        sum = sum + xhead(j) * c * exp ( -( gX(i)-mu )^2 / (2*tw^2) ) 
    end
    gY(i)=sum
end

figure
plot(gX,gY,Xs,Ys,'O')
disp(xhead)
disp( B.'*B/n )