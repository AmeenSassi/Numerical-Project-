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


%1
disp(f(pi/4));
disp(f(-pi/4));








function out = f(theta)
    global L1 L2 L3 x1 x2 y2 gamma p1 p2 p3;
    
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


    %plot([x p2x p3x x], [y p2y p3y y], 'r'); hold on
    %plot([0 x1 x2], [0 0 y2], 'bo');

    %%Plot p1
    %plot([0 x], [0 y]);
    %%Plot p2
    %plot([x1 p2x], [0 p2y]);
    %%Plot p3
    %plot([x2 p3x], [y2 p3y]);

    out = N1^2 + N2^2 - ((p1^2)* (D^2));
end