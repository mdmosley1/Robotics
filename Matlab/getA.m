function A = getA(a, alp, d, t)
    A = [cos(t), -sin(t)*fix(cos(alp)), sin(t)*sin(alp), a*cos(t);
    sin(t), cos(t)*fix(cos(alp)), -cos(t)*sin(alp), a*sin(t);
    0, sin(alp), fix(cos(alp)), d;
    0, 0, 0, 1];
end