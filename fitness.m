function[pop] = fitness(pop, n, n_populacao, b_max)
	for i = 1:n_populacao
		b = (pop(i, 3)+pop(i, 4))*2;
		pop(i, 5) = b;
		if (b < b_max)
			if (pop(i, 1) == pop(i, 2))
				s = ((pop(i, 1)*pop(i, 3))+(pop(i, 2)*pop(i, 4)))*2;
			else
				s = ((((pop(i, 1)-pop(i, 2))*pop(i,4))/2)+(pop(i, 1)*pop(i, 3)))*2;
			end
			pop(i, 6) = s;
		else
			pop(i, 6) = 0;	
		end
	end
% 1ª coluna cr
% 2ª coluna ct
% 3ª coluna a
% 4ª coluna x
% 5ª coluna b
% 6ª coluna S (nos valores em que são 0, são porque não atende a restrição do tamanho da envergadura, b)
 
