function result = truncate(matrix, keep, tol)
    [V, D] = eig(Hermitian(matrix));
    [eigenvalues, permutation] = sort(diag(D));
    V_permute = V(:, permutation);

    cutOffEnergy = eigenvalues(min(keep, numel(eigenvalues)));
    filter = (eigenvalues < (cutOffEnergy + tol));

    result = {V_permute(:, filter), diag(eigenvalues(filter))};
end
