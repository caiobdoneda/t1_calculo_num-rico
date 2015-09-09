clear
clc
% Método Escalonamento de Gauss Otimizado
A = double([
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
%operations
op_soma = 0;
op_multi = 0;
op_div = 0;


n = 10;
Aaux = A; %Aaux: matriz original

for k = 1 : n-1
    k
    A = f_pivotacao_parcial(A, n, k);
    for i = k+1 : n
        aux = A(i,k) / A(k,k); op_div = op_div + 1;
        %otimização para caso j = k = 1
            A(i,k) = 0;
        for j = k+1 : n+1 
            % Li  <-   Li   - (Lik/Lkk * Lk)
            A(i,j) = A(i,j) - aux * A(k,j); op_soma = op_soma + 1; op_multi = op_multi + 1; 
        end %for j
    end %for i
end %for k
A

%Calculando determinante
determinante = 1;
for i = 1 : n
    determinante = determinante * A(i,i);
end
determinante

%normalizando
produto = 1;
for i= 1 : n
    somalinha = 0;
    for j = 1 : n
        somalinha = somalinha + Aaux(i,j) * Aaux(i,j);
    end
    valormediolinha = sqrt(somalinha);
    produto = produto * valormediolinha;
end

determinante_norm = determinante/produto
determinante_modulo = abs(determinante_norm)

if (determinante_modulo < 0.1) 
    printf("\nSistema mal condicionado\n");
else
    printf("\nSistema não é mal condicionado\n");
end    

[x, op_soma, op_multi, op_div] = f_retrosubstituicao(A,n, op_soma, op_multi, op_div)
r_max = f_residuos(Aaux,x,n)
