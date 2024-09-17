s = 2;
sumatoria = 0;
n = 1;
error = 1;
tolerancia = 1e-6;
max_iteraciones = 100; 

while error > tolerancia & n <= max_iteraciones
    sumatoria_anterior = sumatoria;
    termino = 1 / (n^s);
    sumatoria = sumatoria + termino;
    error = abs(sumatoria - sumatoria_anterior);
    n = n + 1;
end

disp("Valor de la función zeta de Riemann: " + string(sumatoria));
disp("Número de iteraciones: " + string(n-1));
disp("Error final: " + string(error));
