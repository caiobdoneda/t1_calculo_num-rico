clear
clc
format long
x = [ 0 0 0 0 0 0 0 0 0 0 ]  %Solução Inicial Decidida

dif = 1;
k = 0;
criterio = 1e-4;
f = 1.1; %fator de relaxação

op_soma = 0;
op_div = 0;
op_mult = 0;

while (dif >= criterio)
    ++k
    xaux = x;
    x(1) = (1-f)*x(1) + f*(( (4) -x(2) - ((1.5)*x(3))) / (2.5)); op_soma = op_soma + 4; op_mult = op_mult + 3; op_div = op_div + 1;
	x(2) = (1-f)*x(2) + f*((-(3) -(0.51)*x(3) -(0.1)*x(5))/ (0.52)); op_soma = op_soma + 4; op_mult = op_mult + 4; op_div = op_div + 1;
	x(3) = (1-f)*x(3) + f*(( (1)- ((0.9)*x(1)) - (x(2))-(x(4)))/ (2.9)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(4) = (1-f)*x(4) + f*((-(1) -x(2)- (0.2)*x(3) -x(5))/ (2.2)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(5) = (1-f)*x(5) + f*((- (1)-x(1)- (2)*x(4)-x(6))/ (4)); op_soma = op_soma + 5; op_mult = op_mult + 1; op_div = op_div + 1;
	x(6) = (1-f)*x(6) + f*((-x(2) + (2) * x(5) + x(7))/ (4)); op_soma = op_soma + 4; op_mult = op_mult + 3; op_div = op_div + 1;
	x(7) = (1-f)*x(7) + f*((- (1)-x(1)- (2)*x(6)-x(8))/ (4)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(8) = (1-f)*x(8) + f*(( (1)-x(2)-x(7)-x(9))/ (3)); op_soma = op_soma + 5; op_mult = op_mult + 2; op_div = op_div + 1;
	x(9) = (1-f)*x(9) + f*(( (3)-x(3)+x(8)+x(10))/ (-3)); op_soma = op_soma + 5; op_mult = op_mult + 2; op_div = op_div + 1;
	x(10) = (1-f)*x(10) + f*((- (2)-x(4)-x(9))/ (2)); op_soma = op_soma + 4; op_mult = op_mult + 2; op_div = op_div + 1;
    dif = max(abs((x .- xaux)./x)); op_soma = op_soma + 10; op_div = op_div + 10;
    
    x(1)
    vk(k)=k;
    vx1(k) = x(1);   
end %while
va = x %Valor Aproximado

criterio = criterio * criterio;
while (dif >= criterio)
    ++k
    xaux = x;
    x(1) = (1-f)*x(1) + f*(( (4) -x(2) - ((1.5)*x(3))) / (2.5)); op_soma = op_soma + 4; op_mult = op_mult + 3; op_div = op_div + 1;
	x(2) = (1-f)*x(2) + f*((-(3) -(0.51)*x(3) -(0.1)*x(5))/ (0.52)); op_soma = op_soma + 4; op_mult = op_mult + 4; op_div = op_div + 1;
	x(3) = (1-f)*x(3) + f*(( (1)- ((0.9)*x(1)) - (x(2))-(x(4)))/ (2.9)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(4) = (1-f)*x(4) + f*((-(1) -x(2)- (0.2)*x(3) -x(5))/ (2.2)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(5) = (1-f)*x(5) + f*((- (1)-x(1)- (2)*x(4)-x(6))/ (4)); op_soma = op_soma + 5; op_mult = op_mult + 1; op_div = op_div + 1;
	x(6) = (1-f)*x(6) + f*((-x(2) + (2) * x(5) + x(7))/ (4)); op_soma = op_soma + 4; op_mult = op_mult + 3; op_div = op_div + 1;
	x(7) = (1-f)*x(7) + f*((- (1)-x(1)- (2)*x(6)-x(8))/ (4)); op_soma = op_soma + 5; op_mult = op_mult + 3; op_div = op_div + 1;
	x(8) = (1-f)*x(8) + f*(( (1)-x(2)-x(7)-x(9))/ (3)); op_soma = op_soma + 5; op_mult = op_mult + 2; op_div = op_div + 1;
	x(9) = (1-f)*x(9) + f*(( (3)-x(3)+x(8)+x(10))/ (-3)); op_soma = op_soma + 5; op_mult = op_mult + 2; op_div = op_div + 1;
	x(10) = (1-f)*x(10) + f*((- (2)-x(4)-x(9))/ (2)); op_soma = op_soma + 4; op_mult = op_mult + 2; op_div = op_div + 1;
    dif = max(abs((x .- xaux)./x)); op_soma = op_soma + 10; op_div = op_div + 10;
    
    x(1)
    vk(k)=k;
    vx1(k) = x(1);   
end %while

ve = x %Valor Exato


op_soma
op_div
op_mult


dif

k
x
plot(vk, vx1, 'LineWidth',2);

erro_sim = max(abs(va .- ve))