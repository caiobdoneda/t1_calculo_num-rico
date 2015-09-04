function x = f_retrosubstituicao(A,n)
    x(n) = A(n,n+1) / A(n,n);
    for i = n-1 : -1: 1

        soma = 0;
        for j = i+1 : n 
            soma += A(i,j) * x(j);
        end %for j

        x(i) = (A(i,n+1) - soma) / A(i,i);
        
    end %for i


end
