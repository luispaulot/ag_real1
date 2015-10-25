n_populacao = 30; %tamanho da população
A = 10; %da função fitness 
n = 2; %dimensão do array / colunas hehe
n_elite = 10;
prob_cruzamento = .6; %probabilidade de cruzamento
prob_mutacao = .025; %probabilidade de mutacao
%janela = 15;%janela de melhores fitness/O melhor+janela
intervalo_xi = 5.12;
pop = gera_populacao(n_populacao, n, intervalo_xi);
pop = fitness(pop, n, n_populacao, A);
%roleta_v2(pop, n, n_populacao); %Está errada
for c = 1 :1
	geracoes = 1;
	%'--------------iteração 1----------------------'
	while geracoes < 50
		%pop = torneio(pop, n, n_populacao);
		pop = elitismov2(pop, n_populacao, n, n_elite);
		pop = cruzamento_mediav2(pop, n, n_populacao, prob_cruzamento);
		%pop = cruzamento_media_geometrica(pop, n, n_populacao, prob_cruzamento);
		pop = mutacao_subst_aleatoria(pop, n, n_populacao, prob_mutacao, intervalo_xi);
		pop = fitness(pop, n, n_populacao, A);
		menores(geracoes) = min(pop(:,n+1))';
		medias(geracoes) = mean(pop(:,n+1));
		maiores(geracoes)= max(pop(:,n+1));
		geracoes = geracoes+1;
	end
	%plot(menores)
	%pause
	menores_parcial(c) = min(menores);
	media_parcial(c) = mean(menores);
	maiores_parcial(c) = max(maiores);
	%res = [maiores_parcial(c)' media_parcial(c)' maiores_parcial(c)']
end

plot(menores_parcial, 'g')
hold on
plot(media_parcial, 'b')
hold on
plot(maiores_parcial, 'r')
legend('Minimo','Medio', 'Maximo')
media_total = mean(menores_parcial)
maior_total = max(maiores_parcial)
s = min(menores_parcial) 