function [pop] = mutacao_subst_aleatoria(pop, n, n_populacao, prob_mutacao)
    percentual = n_populacao*prob_mutacao;
    %perc+1
    for i=1:percentual+1
        numero_aleatorio = randi(100);
        aleatorio = randi(n_populacao,1,1);%gera numero alet�rio para saber qual indi�viuo ser� mutado
        aleatorio_dimensao = randi(n,1,1); %gera numero aletorio do tamanho da dimens�o para saber qual dimens�o ser� mutada
        pop(aleatorio, aleatorio_dimensao) = numero_aleatorio;
    end
end