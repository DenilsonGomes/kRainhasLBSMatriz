%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computacao
%Inteligencia Computacional

%funcao que cria k tabuleiros aleatorios
function tabs = kRandom(k)
    tabs = zeros(k,k,k);
    for i=1:1:k; % De 1 ate o numero de tabuleiros
        tab = zeros(k); % tab é uma matriz de zeros com dimensao k
        for cont = 1:1: k; % Para cont percorrendo as colunas
            a = randi(k); % a é um numero aleatorio entre 1 e k
            tab(a, cont) = 1; % Elemento tab(a, cont) = 1
        end
        tabs(:,:,i) = tab; % Adiciona o i-esimo tabuleiro ao vetor
    end
    return
end