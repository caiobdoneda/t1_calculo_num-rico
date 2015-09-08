function [x, op_soma, op_multi, op_div] = f_retrosubstituicao(A,n, op_soma, op_multi, op_div)
    x(n) = A(n,n+1) / A(n,n); op_div = op_div + 1;
    for i = n-1 : -1: 1

        soma = 0;
        for j = i+1 : n 
            soma += A(i,j) * x(j); op_multi = op_multi + 1; op_soma = op_soma + 1;
        end %for j

        x(i) = (A(i,n+1) - soma) / A(i,i);  op_soma = op_soma + 1; op_div = op_div + 1;
        
    end %for i
end
