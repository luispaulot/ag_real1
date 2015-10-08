function [pop] = elitismov2(pop, n_populacao, n, n_elite)
	pop(:, n+2) = 0;
    pop_aux = zeros(n_elite, n+2);
	ordenado = sort(pop(:,n+1));
	
	for i=1:n_elite
		menor_valor = 9999;
		for k=1:n_populacao
			if (ordenado(k) < menor_valor)
				menor_valor = ordenado(k);
				pos = k;
			end
		end
		for j = 1:n_populacao
			if (pop(j, n+1)== menor_valor)
				pop(j,n+2) = 1;
				ordenado(pos) = 9999;
			end
		end
	end
	
	