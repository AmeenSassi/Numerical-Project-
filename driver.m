global L1 L2 L3 x1 x2 y2 gamma p1 p2 p3 plotf;

L1 = 2;
L2 = sqrt(2);
L3 = L2;
x1 = 4;
x2 = 0;
y2 = 4;
gamma = pi/2;
p1 = sqrt(5);
p2 = p1;
p3 = p2;
plotf = false;


%1
disp(f(pi/4));
disp(f(-pi/4));
k = waitforbuttonpress;

%2
ezplot(@f, [-pi pi])
k = waitforbuttonpress;

%3
plotf = true;
clf;
f(pi/4);
plotf = false;
k = waitforbuttonpress;

%4
L1 = 3;
L2 = 3*sqrt(2);
L3 = 3;
x1 = 5;
x2 = 0;
y2 = 6;
gamma = pi/4;
p1 = 5;
p2 = 5;
p3 = 3;
clf;
z1 = fzero(@f, -1);
z2 = fzero(@f, 0);
z3 = fzero(@f, 1);
z4 = fzero(@f, 2);
plotf = true;
f(z1);
k = waitforbuttonpress;
clf;
f(z2);
k = waitforbuttonpress;
clf;
f(z3);
k = waitforbuttonpress;
clf;
f(z4);
plotf = false;
k = waitforbuttonpress;

clf;
plot([z1, z2, z3, z4], [0 0 0 0], 'bo'); hold on
ezplot(@f, [-pi pi]);
k = waitforbuttonpress;
clf;

%5
p2 = 7;
clf;
z1 = fzero(@f, -1);
z2 = fzero(@f, -0.5);
z3 = fzero(@f, 0);
z4 = fzero(@f, 0.5);
z5 = fzero(@f, 1);
z6 = fzero(@f, 3);
plotf = true;
f(z1);
k = waitforbuttonpress;
clf;
f(z2);
k = waitforbuttonpress;
clf;
f(z3);
k = waitforbuttonpress;
clf;
f(z4);
k = waitforbuttonpress;
clf;
f(z5);
k = waitforbuttonpress;
clf;
f(z6);
k = waitforbuttonpress;
clf;
plotf = false;

clf;
plot([z1, z2, z3, z4, z5, z6], [0 0 0 0 0 0], 'bo'); hold on
ezplot(@f, [-pi pi]);
k = waitforbuttonpress;
clf;

%6
p2 = 4;
clf;
ezplot(@f, [-pi pi]); hold on
plot([-5 5], [0 0]);

%7








function out = f(theta)
    global L1 L2 L3 x1 x2 y2 gamma p1 p2 p3 plotf;
    
    A2 = L3*(cos(theta))- x1;
    B2 = L3*(sin(theta));
    A3 = L2*((cos(theta)*cos(gamma)) - (sin(theta)*sin(gamma))) - x2;
    B3 = L2*((cos(theta)*sin(gamma)) + (sin(theta)*cos(gamma))) - y2;

    D = 2*((A2*B3) - (B2*A3));
    N1 = ((B3*(p2^2 - p1^2 - A2^2 - B2^2) - B2*(p3^2 - p1^2 - A3^2 - B3^2)));
    N2 = ((-A3)*(p2^2 -p1^2 - A2^2 - B2^2) + A2*(p3^2 - p1^2 - A3^2 - B3^2));

    x = N1/D;
    y = N2/D;

    p2x = x + (L3*cos(theta));
    p2y = y + (L3*sin(theta));
    p3x = x + (L2*cos(theta + gamma));
    p3y = y + (L2*sin(theta + gamma));


    if plotf
        plot([x p2x p3x x], [y p2y p3y y], 'r'); hold on
        plot([0 x1 x2], [0 0 y2], 'bo');

        %Plot p1
        plot([0 x], [0 y]);
        %Plot p2
        plot([x1 p2x], [0 p2y]);
        %Plot p3
        plot([x2 p3x], [y2 p3y]);
    end

    out = N1^2 + N2^2 - ((p1^2)* (D^2));
end