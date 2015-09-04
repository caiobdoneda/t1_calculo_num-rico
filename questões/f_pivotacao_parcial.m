function A = f_pivotacao_parcial( A, n, k )
     
    v_max = abs(A(k,k)); %v_max: valor máximo da coluna
    i_max = k; %i_max: posição (linha) do v_max

    for i = k+1 : n
        if abs(A(i,k)) > v_max
            v_max = abs(A(i,k));
            i_max = i;
        end %if
    end %for i

    Aaux = A(k,:); %Backup da Linha k
    A(k,:) = A(i_max,:); %Linha k recebendo a i_max
    A(i_max,:) = Aaux; %Linha i-max recebendo a k

end
