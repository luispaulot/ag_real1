function [new_pop] = cruzamento_media(pop, n, n_populacao, prob_cruzamento)
    n_pais = sum(pop(:, n+2));%numero de pais selecionados na roleta/elitismo
    pais = rand(n_pais, n+2);		%cria-se uma nova população auxiliar somente com os pais
    cont = 0;
	for i=1:n_populacao
		if (pop(i,n+2) == 1) 		%verifica a ultima coluna do individuo (se 0 ou 1)
			cont = cont+1;
			pais(cont, :) = pop(i, :);
		end
    end
	new_pop = pop; %cria a nova população
	%função para copiar os n melhores para a próxima geração
    ordenado = sort(pais(:,3));
	qtde = 5; %numero de melhores que se deseja copiar para próxima geração
	
	for i=1:qtde
		val = ordenado(i);
		for t =1:n_pais
			if (val == pais(t, n+1))
				pos = t;
				break
			end
		end
		for j = 1:n_populacao
			if (new_pop(j, n+1)== val)
				if (new_pop(j, n+2) ~= 1)
					new_pop(n_populacao-j, :) = pais(pos, :);
				else
					new_pop(j, :) = pais(pos, :);
				end
			end
		end
	end
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