%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computacao
%Inteligencia Computacional

%funcao que gera os sucessores
function Sucessores = Sucessores(tabs)
    [k,~,~]=size(tabs); %k recebe a dimensao e quantidade de tabuleiros
    Sucessores = zeros(k,k,k*k*(k-1)); %k tabuleiros geram k*(k-1) Sucessores
    a=1; %Variavel para contar os Sucessores
    
    for t=1:1:k %For para os tabuleiros
        %For para fazer com que cada sucessor seja a copia de seu pai, exceto
        %por uma coluna(uma rainha)
        for i=1:1:k %For para colunas
            for q=1:1:k-1 %For para linhas
                Sucessores(:,:,a) = tabs(:,:,t); %Sucessores recebem o pai
                a = a + 1; %Variavel conta Sucessores
            end
        end
    end
            
    a=1; %a volta a contar o primeiro Sucessor
    for i=1:1:k %For para todos os tabuleiros
        %Em cada tabuleiro vou modificar uma rainha de cada vez
        %Colocando a rainha da c-esima coluna em todas as linhas disponiveis
        for c=1:1:k %For para as rainhas (uma em cada coluna)
            for l=1:1:k %For para achar a linha onde a rainha esta
                if tabs(l,c,i) == 1 %Se tiver rainha,
                    linha = l; %Linha onde a rainha estava(para nao colocar mais)
                    break %Para de procurar pela rainha, pois ja achou
                end
                %Tirou a rainha da coluna
            end
            
            %For para criar os Sucessores deste tabuleiro modificando a
            %rainha desta coluna, colocando nas linhas disponiveis
            for l=1:1:k %For para as linhas
                if l ~= linha %Se a rainha nao estava nessa linha
                    Sucessores(:,c,a) = 0; %Zera a coluna onde vai reanjar a rainha
                    Sucessores(l,c,a) = 1; %Colocou a rainha em tab(l,c)
                    a = a + 1; %Incrementa o valor a para criar o proximo tab
                end
            end
        end
    end
end