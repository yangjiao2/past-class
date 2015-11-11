function[lamda, message] = QR_method(n, a, b, M,TOL)
lamda = zeros(1, n);
count = 1;
k = 1;
shift = 0;
message = '';
while (k <= M)
    if abs (b(n)) <= TOL
        lamda(count) = a(n) + shift;
        count = count+1;
        n = n-1;
    end
    if abs (b(2)) <= TOL
        lamda(count) = a(1) + shift;
        count = count+1;
        n = n-1;
        a(1) = a(2);
        for j = 2:n
            a(j) = a(j+1);
            b(j) = b(j+1);
        end
    end
    if n == 0
        return;
    end
    
    if n == 1
        lamda(count) = a(1) + shift;
        count = count+1;
        return;
    end

    for j = 3:n-1
        if abs(b(j)) <= TOL
            disp('split into');
            disp(a(1:j-1));
            disp(b(2:j-1));
            disp('and');
            disp(a(j:n));
            disp(b(j+1:n));
            disp(shift);
            
            
            return;
        end
    end
    
    b_var = -(a(n-1) + a(n));
    c_var = a(n) * a(n-1) - b(n) * b(n);
    d_var = (b_var*b_var - 4*c_var) ^ (1/2);
    
    if b > 0
        mu1 = -2*c_var/(b_var+d_var);
        mu2  = -(b_var+d_var)/2;
    else
        mu1 = (d_var-b_var)/2;
        mu2 = 2*c_var/(d_var-b_var);
    end
    
    if n==2
        lamda(count) = mu1 + shift;
        count = count + 1;
        lamda(count) = mu2 + shift;
        count = count + 1;
        return;
    end
    
    if abs(abs(mu1 - a(n))) == min(abs(mu1 - a(n)), abs(mu2 - a(n)))
        sigma = mu1;
    else
        sigma = mu2;
    end
    
    shift = shift + sigma;
    for j = 1:n
        d(j) = a(j) - sigma;
    end
    x(1) = d(1);
    y(1) = b(2);
    for j = 2:n
        z(j-1) = (x(j-1)*x(j-1) + b(j)*b(j))^(1/2);
        c(j) = x(j-1)/z(j-1);
        o(j) = b(j) / z(j-1);
        q(j-1) = c(j)*y(j-1)+ o(j)*d(j);
        x(j) = -o(j) * y(j-1) + c(j) * d(j);
        if j ~= n
            r(j-1) = o(j) *b(j+1);
            y(j) = c(j) * b(j+1);
        end
    end
    
    z(n) = x(n);
    a(1) =  o(2)*q(1) + c(2)*z(1);
    b(2) = o(2)*z(2);
    
    for j = 2:n-1
        a(j) = o(j+1)* q(j) + c(j)*c(j+1)*z(j);
        b(j+1) = o(j+1)*z(j+1);
    end
    
    a(n) = c(n)*z(n);
    k = k+1;

end

message = 'Max iterations exceeded';
return;

end
