function [a_new] = Householder_method (n, a)
q=0;
a_new=a;

for k=1:n-2
    for j= k+1:n
        q=q+a (j,k)^2;
    end
    
    if a(k+1,k)==0
        alpha= -q^.5;
    else
        alpha=(-q^.5*(a(k+1,k)))/abs(a(k+1,k));
    end
    
    RSQ= alpha^2- alpha*a(k+1,k);
    
    for t=1:k
        v(t)=0;
    end
    v(k+1)=a(k+1,k)-alpha;
    for  j=k+2:n
        v(j) = a(j,k);
    end
    
    
    for j=k:n
        s=0;
        for i=k+1:n
            s=s+(a(j,i)*v(i));
        end
        u(j)=(1/RSQ)*s;
        
    end
    
    PROD=0;
    for i=k+1:n
        PROD= PROD + v(i)*u(i);
    end
    
    for j=k:n
        z(j)=u(j)-(PROD/(2*RSQ))*v(j);
    end
    
    for l=k+1:n-1
        for j=l+1:n
            a_new(j,l)=a(j,l)-v(l)*z(j)-v(j)*z(l);
            a_new(l,j)=a_new(j,l);
        end
        
        a_new(l,l)=a(l,l)-2*v(l)*z(l);
    end
    a_new(n,n)=a(n,n)-2*v(n)*z(n);
    
    for j=k+2:n
        a_new(k,j)=0;
        a_new(j,k)=0;
    end
    
    a_new(k+1,k)=a(k+1,k)-v(k+1)*z(k);
    a_new(k,k+1)=a_new(k+1,k);
    
    a=a_new;
    
    
    %
    % for k = 1:n-2
    %
    %     Aold = A
    %     q = 0;
    %     for j = k+1:n
    %         q = q + Aold(j,k) * Aold(j,k);
    %     end
    %     if Aold(k+1,k) == 0
    %         a = q^(1/2);
    %     else
    %         a = -q^(1/2)*Aold(k+1,k)/ abs(Aold(k+1,k));
    %     end
    %
    %     RSQ = a*a - a* Aold(k+1,k);
    %     v = zeros(n, 1);
    %     v(k+1) = Aold(k+1,k) - a;
    %     for j = k+2:n
    %         v(j) = Aold(j,k);
    %     end
    %
    %
    %
    %     for j = k:n
    %         av = 0;
    %         for i = k+1:n
    %             av = av + Aold(j,i)*v(i);
    %         end
    %         u(j) = 1/RSQ * av;
    %     end
    %
    %     PROD = 0;
    %     for i = k+1:n
    %         PROD = PROD + v(i)*u(i);
    %     end
    %
    %     for j = k:n
    %         z(j) = u(j) - PROD/2/RSQ*v(j);
    %     end
    %
    %     for l = k+1:n-1
    %         for j = l+1:n
    %             Anew(j,l) = Aold(j,l) - v(l)*z(j) - v(j)* z(l);
    %             Anew(l,j) = Anew(j,l);
    %         end
    %         Anew(l,l) = Aold(l,l) - 2*v(l)*z(l);
    %     end
    %
    %     Anew(n,n) = Aold(n,n) - 2*v(n)*z(n);
    %
    %     for j = k+2:n
    %         Anew (k,j) = 0;
    %         Anew (j,k) = 0;
    %     end
    %     Anew (k+1, k) = Aold(k+1,k) - v(k+1)*z(k);
    %     Anew (k,k+1) = Anew(k+1, k);
    %
    %     Anew
    %     Aold = Anew;
    %
    % end
    %
    % A = Anew;
    % return;
end