L1 = 2;
L2 = sqrt(2);
L3 = L2;
x1 = 4;
x2 = 0;
y2 = 4;
alpha = pi/2;

p1 = sqrt(5);
p2 = p1;
p3 = p2;

plotf = false;

%1
disp(f(pi/4));
disp(f(-pi/4));
k = waitforbuttonpress;

%2
ezplot(@f, [-pi, pi]);
k = waitforbuttonpress;

%3
plotf = true;
f(pi/4);
plotf = false;
k = waitforbuttonpress;

%4
L1 = 3;
L2 = 3*sqrt(2);
L3 = 3;
alpha = pi/4;
x1 = 5;
x2 = 0;
y2 = 6;
p1 = 5;
p2 = 5;
p3 = 3;
ezplot(@f, [-pi, pi]);
result = fzero(@f,0);
disp(result);
k = waitforbuttonpress;

%5
p2 = 7;
ezplot(@f, [-pi, pi]);
result = fzero(@f,0);
disp(result);
k = waitforbuttonpress;

%6

ezplot(@f, [-pi, pi]);
result = fzero(@f,0);
disp(result);
k = waitforbuttonpress;



function out = f(theta)
    global L1 L2 L3 x1 x2 y2 alpha p1 p2 p3 plotf;

    A2 = L3*(cos(theta))- x1;
    B2 = L3*(sin(theta));
    A3 = L2*((cos(theta)*cos(alpha)) - (sin(theta)*sin(alpha))) - x2;
    B3 = L2*((cos(theta)*sin(alpha)) + (sin(theta)*cos(alpha))) - y2;

    D = 2*((A2*B3) - (B2*A3));
    N1 = ((B3*(p2^2 - p1^2 - A2^2 - B2^2) - B2*(p3^2 - p1^2 - A3^2 - B3^2)));
    N2 = ((-A3)*(p2^2 -p1^2 - A2^2 - B2^2) + A2*(p3^2 - p1^2 - A3^2 - B3^2));

    x = N1/D;
    y = N2/D;

    xL2 = x + (L3*cos(theta));
    yL2 = y + (L3*sin(theta));
    xL3 = x + (L2*cos(theta + alpha));
    yL3 = y + (L2*sin(theta + alpha));

    if plotf
        plot([x xL2 xL3 x], [y yL2 yL3 y], 'r'); hold on
        plot([0 x1 x2], [0 0 y2], 'bo');

        %Plot p1
        plot([0 x], [0 y]);
        %Plot p2
        plot([x1 xL2], [0 yL2]);
        %Plot p3
        plot([x2 xL3], [y2 yL3]);
    end

    out = N1^2 + N2^2 - ((p1^2)* (D^2));
end