function [pop] = elitismo(pop, n_populacao, n, janela)
	pop(:, n+2) = 0;
    mfit = max(pop(:, n+1));
	for i=1:n_populacao
		fit = pop(i, n+1);
		if (fit < mfit)
			mfit = fit;
			individuo = i;
		end
	end
	%individuo
	for i = 1:n_populacao
		if (pop(i, n+1) < (mfit+janela))% menos pois agora é minimizar
			pop(i, n+2) = 1;
		end
	end
	%pop
	%pause