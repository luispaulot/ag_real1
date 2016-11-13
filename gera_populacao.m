function[pop] = gera_populacao(cr_min, cr_max, ct_min, ct_max, a_min, a_max, x_min, x_max, n_populacao, n)
    pop(:,1) = cr_min + (cr_max-cr_min)*rand(n_populacao,1);
    pop(:,2) = ct_min + (ct_max-ct_min)*rand(n_populacao,1);
    pop(:,3) = a_min + (a_max-a_min)*rand(n_populacao,1);
    pop(:,4) = x_min + (x_max-x_min)*rand(n_populacao,1);
    
    pop(:, n+1) = 0; % zera a coluna da envergadura
    pop(:, n+2) = 0; % zera a coluna do fitness
end