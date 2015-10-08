function [new_pop] = cruzamento_media_geometrica(pop, n, n_populacao, prob_cruzamento)
    n_pais = sum(pop(:, n+2));%numero de pais selecionados na roleta/elitismo
    pais = rand(n_pais, n+2);		%cria-se uma nova população auxiliar somente com os pais
    
    cont = 0;
	for i=1:n_populacao
		if (pop(i,n+2) == 1) 		%verifica a ultima coluna do individuo (se 0 ou 1)
			cont = cont+1;
			pais(cont, :) = pop(i, :);
		end
    end
    %função para copiar os n melhores para a próxima geração
    qtde = 2;%quantidade de indivuos que se quer copiar da ultima população (são os melhores)
	new_pop = pop; %cria a nova população
    new_pop(n_populacao-(qtde-1):n_populacao, :) = pais(1:qtde,:);
    %%fim da função
    percentual = prob_cruzamento*n_populacao;
    for i = 1:percentual
        individuo1 = randi(n_pais,1,1); %rand de 1 a tamanho da populacao
        individuo2 = randi(n_pais,1,1); %rand de 1 a tamanho da população
        cara_novo = rand(1, n+2);
        for j = 1:n
            b = rand();
            if (b > .5)
                media = (pais(individuo1, j)+pais(individuo2, j))/2;
            else
                media = (pais(individuo1, j)-pais(individuo2, j))/2;
            end
            cara_novo(1,j) = media;
        end
        new_pop(i,:) = cara_novo(1,:);
    end
end