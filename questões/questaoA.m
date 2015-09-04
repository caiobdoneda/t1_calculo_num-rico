clear
clc
% Método Escalonamento de Gauss Otimizado
A = single([
		[2.5 1.0 1.5 0.0 0.0 0.0 0.0 0.0 0.0 0.0 4];
		[0.0 0.52 0.51 0.0 0.1 0.0 0.0 0.0 0.0 0.0 -3];
		[0.9 1.0 2.9 1.0 0.0 0.0 0.0 0.0 0.0 0.0 1];
		[0.0 1.0 0.2 2.2 1.0 0.0 0.0 0.0 0.0 0.0 -1];
		[1.0 0.0 0.0 2.0 4.0 1.0 0.0 0.0 0.0 0.0 -1];
		[0.0 1.0 0.0 0.0 -2.0 4.0 -1.0 0.0 0.0 0.0 0];
		[1.0 0.0 0.0 0.0 0.0 2.0 4.0 1.0 0.0 0.0 -1];
		[0.0 1.0 0.0 0.0 0.0 0.0 1.0 3.0 1.0 0.0 1];
		[0.0 0.0 1.0 0.0 0.0 0.0 0.0 -1.0 -3.0 -1.0 3];
		[0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 1.0 2.0 -2];
           ]);

n = 10;
Aaux = A; %Aaux: matriz original

for k = 1 : n-1
    k
    A = f_pivotacao_parcial(A, n, k);
    for i = k+1 : n
        aux = A(i,k) / A(k,k);
        %otimização para caso j = k = 1
            A(i,k) = 0;
        for j = k+1 : n+1 
            % Li  <-   Li   - (Lik/Lkk * Lk)
            A(i,j) = A(i,j) - aux * A(k,j);
        end %for j
    end %for i
end %for k
A

x = f_retrosubstituicao(A,n)
r_max = f_residuos(Aaux,x,n)
