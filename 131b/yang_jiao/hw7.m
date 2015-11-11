% hw7
M = 10000000;
TOL = 1e-8;

% 2 a)
A1 = [4 -1 -1 0;
    -1 4 0 -1;
    -1 0 4 -1;
    0 -1 -1 4];
[m,n1] = size(A1);
[Tri1] = Householder_method(n1,A1)

% 2 d)
A2 = [2 -1 -1 0 0;
    -1 3 0 -2 0;
    -1 0 4 2 1;
    0 -2 2 8 3;
    0 0 1 3 9];
[m,n2] = size(A2);
[Tri2] = Householder_method(n2,A2)



%4 c)
% A3 = [4 2 0 0 0;
%     2 4 2 0 0;
%     0 2 4 2 0;
%     0 0 2 4 2;
%     0 0 0 2 4];
A3 = [3 1 0; 1 3 1; 0 1 3];
[m,n3] = size(A3);
a3 = diag(A3);
b3(1) = 0;
b3(2:n3)= diag(A3,1);
[result3, message3] = QR_method(n3, a3, b3, M,TOL)


% 4 d)
A4 = [5 -1 0 0 0;
    -1 4.5 0.2 0 0;
    0 0.2 1 -0.4 0;
    0 0 -0.4 3 1;
    0 0 0 1 3];
[m,n4] = size(A4);
a4 = diag(A4);
b4(1) = 0;
b4(2:n4)= diag(A4,1);
[result4, message3] = QR_method(n4, a4, b4, M,TOL)
