clear
clc
cr_min = 0;
cr_max = 60;
ct_min = 0;
ct_max = 50;
a_min = 0;
a_max = 100;
x_min = 0;
x_max = 100;
b_max = 150;

n_populacao = 50; %tamanho da população
n = 4; %dimensão do array 
n_elite = 10;
prob_cruzamento = .8; %probabilidade de cruzamento
prob_mutacao = .025; %probabilidade de mutacao
pop = gera_populacao(cr_min, cr_max, ct_min, ct_max, a_min, a_max, x_min, x_max, n_populacao, n); %gera a população inicial

pop = fitness(pop, n, n_populacao, 100); %calcula o fitness
individuo = zeros(1, 7);
for c = 1 :30
	geracoes = 1;
	while geracoes < 100
			pop = elitismov2(pop, n_populacao, n, n_elite);
			pop = cruzamento_novo(pop, n, n_populacao, prob_cruzamento, cr_min, cr_max, ct_min, ct_max, a_min, a_max, x_min, x_max);
			pop = fitness(pop, n, n_populacao, b_max); %calcula o fitness
			%pop = mutacao_subst_aleatoria(pop, n, n_populacao, prob_mutacao);
			pop = fitness(pop, n, n_populacao, b_max/2); %calcula o fitness
			menores(geracoes) = min(pop(:,n+2));
			medias(geracoes) = mean(pop(:,n+2));
			maiores(geracoes)= max(pop(:,n+2));
			[maior, l] = max(pop(:,n+2));
			if (maior > individuo(1, 6))
				individuo = pop(l, :);	
			end
			geracoes = geracoes+1;
	end
	menores_parcial(c) = min(menores);
	media_parcial(c) = mean(menores);
	maiores_parcial(c) = max(maiores);
end
plot(menores_parcial, 'g--')
hold on
plot(media_parcial, 'b--')
hold on
plot(maiores_parcial, 'r-')
legend('Minimo','Medio', 'Maximo')
media_total = mean(menores_parcial)
maior_total = max(maiores_parcial)
s = max(maiores_parcial) 
individuo
Ar = individuo(1, 5)^2/individuo(1, 6) %Aspect Ratio
lambda = individuo(1, 2)/individuo(1, 1) %Afilamento

% 1ª coluna cr
% 2ª coluna ct
% 3ª coluna a
% 4ª coluna x
% 5ª coluna b
% 6ª coluna S (nos valores em que são 0, são porque não atende a restrição do tamanho da envergadura, b) 
% 7ª não vale nada rsrs (usada somente com aviso)