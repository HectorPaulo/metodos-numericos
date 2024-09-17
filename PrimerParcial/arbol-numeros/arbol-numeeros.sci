numeros = [1, 2, 3, 4, 2];
permutaciones = perms(numeros, "unique");

for i = 1:size(permutaciones, 1)
    printf("%d. ", i);
    for j = 1:size(permutaciones, 2)
        printf("%d ", permutaciones(i, j));
    end
    printf("\n");
end
