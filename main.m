%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computacao
%Inteligencia Computacional
%Resolucao do problema das k Rainhas nao atacantes em tabuleiro k x k

clear %Limpar todas as variaveis
clc %Limpar visor

%Perguntamos o tamanho do tabuleiro
k = input('Digite o tamanho do tabuleiro: '); %Atribuimos o tamanho a k
tabuleiros = kRandom(k); %Geramos k tabuleiros aleatorios

%Exibimos os tabuleiros iniciais
disp('Tabuleiros iniciais\n');
tabuleiros

%Verificar os k tabuleiros aleatorios
for i=1:1:k %For p/ os tabuleiros
    if contAtqs(tabuleiros(:,:,i)) == 0 %Se o tabuleiro nao tiver nenhum ataque
        disp('Tabuleiro Solucao') 
        tabuleiros(:,:,i) %Exibe o tabuleiro solucao
        return %Encerra a execucao
    end
end

%Executar LBS
i = 0;
max = k*k; %Maximo de iteracoes
while i <= max %Enquanto nao extrapolar o numero maximo de iteracoes
    sucessores = Sucessores(tabuleiros); %Gera sucessores
    for j=1:1:k*k*(k-1) %Percorre os sucessores
        if contAtqs(sucessores(:,:,j)) == 0 %Se algum sucessor tiver 0 ataques
            disp('Tabuleiro Solucao')
            sucessores(:,:,j) %Exibe a solucao
            return %Encerra a aplicacao
        end
    end
    tabuleiros = melhores(sucessores); %tabuleiros recebe os melhores sucessores
    i = i + 1; %incrementa i
end

disp('Melhor Tabuleiro')
sucessores(:,:,j) %Exibe o melhor tabuleiro
