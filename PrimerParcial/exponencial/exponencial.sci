x = 1;
sumatoria = 0;
n = 0;
error = 1;
tolerancia = 1e-6; 
max_iteraciones = 10000;
while error > tolerancia & n <= max_iteraciones
    sumatoria_anterior = sumatoria;
    
    termino = (x^n) / factorial(n);
   
    sumatoria = sumatoria + termino;
    error = abs(sumatoria - sumatoria_anterior);
    n = n + 1;
end
disp("Valor de e^" + string(x) + ": " + string(sumatoria));
disp("Error final: " + string(error));
