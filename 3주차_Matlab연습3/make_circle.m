function [xx, yy] = make_circle(x, y, r)
t = linspace(-pi, pi, 360);
xx = r*sin(t) + x;
yy = r*cos(t) + y;
