function [pop] = torneio(pop, n, n_populacao)
	pop(:, n+2) = 0;
	Qtde = 30;
	K = 0.75;
	for i = 1: Qtde;
		in = 0;
		while(in == 0)
			individuo1 = randi(n_populacao,1,1); %rand de 1 a tamanho da populacao
			individuo2 = randi(n_populacao,1,1); %rand de 1 a tamanho da população
			if ((pop(individuo1, n+2) == 0) && (pop(individuo2, n+2) == 0))
				in = 1;
			end
		end
		fit1 = pop(individuo1, n+1);
		fit2 = pop(individuo2, n+1);
		if fit1 < fit2 %menor pois queremos minimizar
			melhor = individuo1;
			pior = individuo2;
		else
			melhor = individuo2;
			pior = individuo1;
		end
		r = rand;  %rand entre 0 e 1
		if r < K
			pop(melhor, n+2) = 1;
		else
			pop(pior, n+2) = 1;
		end
	end
		