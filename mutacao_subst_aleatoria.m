function [pop] = mutacao_subst_aleatoria(pop, n, n_populacao, prob_mutacao, intervalo_xi)
    perc = n_populacao*prob_mutacao;
    %perc+1
    for i=1:perc+1
        numero_aleatorio = -intervalo_xi + (intervalo_xi+intervalo_xi)*rand(1);
        aleatorio = randi(n_populacao,1,1);%gera numero aletório para saber qual indiíviuo será mutado
        aleatorio_dimensao = randi(n,1,1); %gera numero aletorio do tamanho da dimensão para saber qual dimensão será mutada
        pop(aleatorio, aleatorio_dimensao) = numero_aleatorio;
    end
end