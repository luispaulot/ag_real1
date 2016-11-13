function [pop] = cruzamento_novo(pop, n, n_populacao, prob_cruzamento, cr_min, cr_max, ct_min, ct_max, a_min, a_max, x_min, x_max)
	aleatorio = rand();
	quantidade1 = 1-aleatorio;
	quantidade2 = aleatorio;
	new_pop = zeros(n_populacao, n+3);
	j = 1;
	%quantidade1 = n*quantidade1;
	%quantidade2 = n*quantidade2;
	percentual_cruzamento = n_populacao*prob_cruzamento;

	for i=1:percentual_cruzamento
		pai1 = randi(n_populacao);
		pai2 = randi(n_populacao);
		while(pai2 == pai1)             %verifica se os pais são iguais, 
			pai2 = randi(n_populacao);	%se for igual, 
		end								%gera outro pai2
		for j=1:n 																 
			new_pop(i, j) = (quantidade1*pop(pai1,j))+(quantidade2*pop(pai2,j));
		end
		

		if (new_pop(i, 1) > cr_max)												%Penalidade Cr
			new_pop(i, 1) = cr_min + (cr_max-cr_min)*rand(1,1);		
		end
		if (new_pop(i, 2) > ct_max)												%Penalidade Ct
			new_pop(i, 2) = ct_min + (ct_max-ct_min)*rand(1,1);		
		end
		if (new_pop(i, 3) > a_max)												%Penalidade a
			new_pop(i, 3) = a_min + (a_max-a_min)*rand(1,1);		
		end
		if (new_pop(i, 4) > x_max)												%Penalidade x
			new_pop(i, 4) = x_min + (x_max-x_min)*rand(1,1);		
		end

	end
	for i=1:n_populacao									%para copiar new_pop para pop, sem ocupar o lugar dos indivíduos Elite
		if (pop(i, n+3) ~= 1)							%
			pop(i, :) = new_pop(j, :);					%
			j = j+1;									%
		end												%
	end													%