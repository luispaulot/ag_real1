function [pop] = elitismov2(pop, n_populacao, n, n_elite)
	pop(:, n+3) = 0;
	ordenado = sort(pop(:,n+2),'descend');
	%marca os indivíduos de maior valor de S
	for i=1:n_elite
		valor = ordenado(i);
		for j = 1:n_populacao
			if (pop(j, n+2)== valor)
				pop(j,n+3) = 1;
			end
		end
	end
	
	