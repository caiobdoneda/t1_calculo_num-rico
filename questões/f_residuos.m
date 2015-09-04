function r_max = f_residuos(Aaux,x,n)
    
    for i = 1 : n
        soma = 0;
        for j = 1 : n
            soma += Aaux(i,j) * x(j);
        end %for j
        r(i) = abs(soma - Aaux(i,n+1));
    end %for i

    r_max = max(r);

end
