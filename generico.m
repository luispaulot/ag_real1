function [pop] = generico(tamanho)
	pop=rand(tamanho,38);
	for i=1:tamanho
		for j=1:36
			if pop(i,j)<=.5
				pop(i,j)=0;
			else 
				pop(i,j)=1;
			end
		end
		pop(i, 38) = 0; %Flag ativo para seleção
	end	
	pop = fitness(pop, tamanho);
