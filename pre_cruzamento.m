function [n_pop] = pre_cruzamento(pop, perc_cruzamento)
	n = size(pop,1);				%mede o numero de indivíduos da população
	n_col = size(pop,2);			%mede o numero de colunas da população
	n_pais = sum(pop(:, n_col));	%numero de pais selecionados na roleta/elitismo
	pais = rand(n_pais, n_col);		%cria-se uma nova população auxiliar somente com os pais
	perc = n*perc_cruzamento;		%quantidade de filhos na nova população
	cont = 0;
	for i=1:n
		if (pop(i,n_col) == 1) 		%verifica a ultima coluna do individuo (se 0 ou 1)
			cont = cont+1;
			pais(cont, :) = pop(i, :);
		end
	end
	%função para copiar os n melhores para a próxima geração
	m = 0;
	for i = 1:3	%criado para guardar os n(por exemplo 3) melhores pais, ou copiar o melhor 5 vezes para a próxima geração
		[valor,linha] = max(pop(:, 37)-m);	%Pega o melhor fitness e pega a linha corresponde que ele está na população e subtrai a cada iteração
		if (pop(linha, 38) == 1)			%Verifica se ele está com a flag para o cruzamento marcada 
			pop(linha, 38) = 0;				%Se tiver desmarca, pois não quero que ele cruze e perca a informação
		end
		m = m+1;							%soma mais 1 para subtrair
		aux(i, :) = pop(linha, :);			%guarda esse cara
	end										%
	n_pop = pop;%recebe a população anterior
	n_pop(46:48, :) = aux; %coloca esse cara na população nova
	%%fim da função
	for (i = 1 : 2 : perc)
		[filho1, filho2] = cruzamento_uniforme(pais, n_pais, n_col);
		n_pop(i, :) = filho1;
		n_pop(i+1, :) = filho2;
	end
	

