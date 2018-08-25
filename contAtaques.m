%Autor: Denilson Gomes Vaz da Silva

%funcao que retorna um vetor com os ataques dos tabuleiro
function vetAtqs = contAtaques(tabs)
    [k,~,t] = size(tabs); %k recebe a dimensao do tabuleiro e t o numero 
    %de tabuleiros(k na primeira vez e k*k*(k-1) nas outras)
    linha_Rainha = zeros(1,k); %linha_Rainha inicia com k zeros
    %(valor da linha no indice da coluna)
    vetAtqs = zeros(1,t); %Vetor com os ataques dos tabuleiros
    %(Numero de ataques na posição do tabuleiro)
        
    for i=1:1:t %For p/ todos os Sucessores
        Atqs = 0; %Atqs inicia em 0
        %Construir vetor com o valor da linha do indice coluna
        for c=1:1:k %For p/ colunas
            for l=1:1:k %For p/linhas
                %Verifica se a rainha da coluna c esta na linha l
                if tabs(l,c,i) == 1 %Caso esteja
                    linha_Rainha(c) = l;
                    %linha_Rainha na posicao da coluna recebe o valor da linha
                end
            end
        end
    
        %Calcular ataques por linha
        for c1=1:1:k-1 %Primeira rainha a ser comparada
            for c2=c1+1:1:k %Segunda rainha a ser comparada
                %Compara a linha da c1-esima rainha com todas as rainhas
                %que ainda nao foi comparada, de c1+1 ate k. De 1 ate c1 ja foi comparada.
                if linha_Rainha(c1) == linha_Rainha(c2) 
                    %Se a linha da c1-esima rainha for igual a linha da
                    %c2-esima rainha
                    Atqs = Atqs + 1; %Incrementa o ataque
                end
                %No fim deste for a rainha c1 foi comparada com todas as outras
                %rainhas
            end
            %No fim deste for contou os ataques por linha
        end
    
        %Contar os ataques por diagonal
        for c1=1:1:k-1 %Percorre ate a penultima coluna
            for c2=c1+1:1:k %Percorre da coluna atual ate a ultima
                %Verifica se c1 e c2 se atacam por diagonal
                if abs(c1-c2) == abs(linha_Rainha(c1)-linha_Rainha(c2)) %|| abs(c1+c2) == abs(linha_Rainha(c1)+linha_Rainha(c2))
                    Atqs = Atqs + 1;
                    %Caso sim, incrementa Atqs
                end
                %Final deste for ja calculou os ataques de c1
            end
            %Final deste for ja calculou todos os ataques
        end
        vetAtqs(i) = Atqs;
    end
    return
end