%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computacao
%Inteligencia Computacional

%funcao que retorna os melhores Sucessores
function melhores = melhores(Sucessores) %Recebe o vetAtqs
    [k,~,t] = size(Sucessores); %k recebe a dimensao do tabuleiro e t o numero de tabuleiros
    melhores = zeros(k,k,k); %Inicia melhores como k matrizes de zeros
    b=1; %Variavel para contar os melhores
    MAXATQS = 100;
    
    for a=1:1:MAXATQS %Maximo de ataques (comencando em 1, pois assumimos qua a solucao nao foi gerada)
        for i=1:1:t %Para todos Sucessores
            if contAtqs(Sucessores(:,:,i)) == a %Se tiver a ataques
                melhores(:,:,b) = Sucessores(:,:,i); %Melhor indice b recebe Sucessores indice i
                if b == k %Se b==k, entao ja temos os melhores
                    return %Retornamos os melhores sucessores
                end
                b = b + 1; %Incrementamos b
            end
        end
    end
end