function x = punto_fijo_cuadratica(b, c, d, x0, tol, max_iter)
    // Definir las funciones g1(x) y g2(x)
    g1 = @(x) sqrt((-c*x - d)/b);
    g2 = @(x) (-b*x^2 - d)/c;
    
    // Elegir una de las funciones para la iteración
    g = g1;  // Puedes cambiar a g2 si es necesario
    
    // Iteración
    for k = 1:max_iter
        x1 = g(x0);  // Calcular el nuevo valor
        if abs(x1 - x0) < tol then
            break;
        end
        x0 = x1;  // Actualizar x0
    end
    x = x1;  // Solución aproximada
end

b = 1;
c = -3;
d = 2;
x0 = 0;  // Valor inicial
tol = 1e-6;  // Tolerancia
max_iter = 100;  // Máximo de iteraciones
x = punto_fijo_cuadratica(b, c, d, x0, tol, max_iter);
disp(x);
