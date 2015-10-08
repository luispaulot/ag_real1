function[pop] = gera_populacao(n_populacao, n, intervalo_xi)
    %n_populacao = 50;
    %n = 2; %dimensão do array / colunas hehe
    %intervalo_xi = 5.12;
    pop = -intervalo_xi + (intervalo_xi+intervalo_xi)*rand(n_populacao,n+2);
    pop(:, n+1) = 0; % zera a coluna do fitness
    pop(:, n+2) = 0; % zera a coluna do flag

end