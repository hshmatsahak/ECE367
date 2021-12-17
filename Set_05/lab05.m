A = [1,0;1,1;1,2;1,3];
x = [0;1;2;3];
y = [4;1;4;2];
alpha = (A' * A)\(A' * y);

xvals = -1:0.01:5;
yvals = alpha(1) + alpha(2) * xvals;
plot(xvals, yvals)
hold on
scatter(x,y, 'filled')

yls = alpha(1) + alpha(2) * x;
r = y - yls;
norm(r)










