pi_esperado = 3.141592653589793;
sumatoria = 0;
n = 0;
error = 1
tolerancia = 1e-6; // <---- ¿Criterio de Precisiòn?

while error > tolerancia
    termino = (-1)^n / (2*n + 1);
    sumatoria = sumatoria + termino;
    pi_obtenido = 4 * sumatoria;
    error = abs(pi_esperado - pi_obtenido);
    n = n + 1;
end
disp("valor esperado: " + string(pi_esperado));
disp("Valor final de pi obtenido: "+  string(pi_obtenido));
disp("Error: " + string(error));

