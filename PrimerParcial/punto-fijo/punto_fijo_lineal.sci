function PuntoFijo(tipoEcuacion, coeficientes, valorInicial, tolerancia, maxIteraciones)
    select tipoEcuacion
        case "lineal"
            coefA = coeficientes(1);
            coefB = coeficientes(2);
            function resultado = funcionIterativa(x)
                resultado = -coefB/coefA;  // Despeje para la solución fija
            endfunction
            disp("Despeje utilizado: x = -b/a");
        
        case "cuadratica"
        coefB = coeficientes(1);
            coefC = coeficientes(2);
            coefD = coeficientes(3);
            function resultado = funcionIterativa1(x)
                resultado = sqrt((coefD - coefC * x) / coefB);  // Despeje adecuado para convergencia
            endfunction
            function resultado = funcionIterativa2(x)
                resultado = -sqrt((coefD - coefC * x) / coefB);
            endfunction
            disp("Despeje utilizado 1: x = sqrt((d - c * x) / b)");
            disp("Despeje utilizado 2: x = -sqrt((d - c * x) / b)");
        
        case "cubica"
            coefA = coeficientes(1);
            coefB = coeficientes(2);
            coefC = coeficientes(3);
            coefD = coeficientes(4);
            function resultado = funcionIterativa1(x)
                resultado = -((coefB * x^2 + coefC * x + coefD) / coefA)^(1/3); 
            endfunction
            function resultado = funcionIterativa2(x)
                resultado = -((coefB * x^2 + coefC * x + coefD) / (coefA * x^2));
            endfunction
            function resultado = funcionIterativa3(x)
                resultado = -((coefC * x + coefD) / (coefA * x^3));
            endfunction
            disp("Despeje utilizado 1: x = -((b * x^2 + c * x + d) / a)^(1/3)");
            disp("Despeje utilizado 2: x = -((b * x^2 + c * x + d) / (a * x^2))");
            disp("Despeje utilizado 3: x = -((c * x + d) / (a * x^3))");
        
        otherwise
            disp("Tipo de ecuación no válido. Usa lineal, cuadratica o cubica.");
            return
    end

    iteracionActual = 0;
    valorActual = valorInicial;

    while iteracionActual < maxIteraciones
        iteracionActual = iteracionActual + 1;
        
        if tipoEcuacion == "lineal" then
            nuevoValor = funcionIterativa(valorActual);
        elseif tipoEcuacion == "cuadratica" then
            nuevoValor1 = funcionIterativa1(valorActual);
            nuevoValor2 = funcionIterativa2(valorActual);
            disp("Iteración " + string(iteracionActual) + ": Xn (g1) = " + string(nuevoValor1) + ", Xn (g2) = " + string(nuevoValor2));
            if abs(nuevoValor1 - valorActual) < tolerancia || abs(nuevoValor2 - valorActual) < tolerancia then
                disp("Convergencia alcanzada en " + string(iteracionActual) + " iteraciones.");
                return
            end
            valorActual = nuevoValor1;
            continue;
        elseif tipoEcuacion == "cubica" then
            nuevoValor1 = funcionIterativa1(valorActual);
            nuevoValor2 = funcionIterativa2(valorActual);
            nuevoValor3 = funcionIterativa3(valorActual);
            disp("Iteración " + string(iteracionActual) + ": Xn (g1) = " + string(nuevoValor1) + ", Xn (g2) = " + string(nuevoValor2) + ", Xn (g3) = " + string(nuevoValor3));
            if abs(nuevoValor1 - valorActual) < tolerancia || abs(nuevoValor2 - valorActual) < tolerancia || abs(nuevoValor3 - valorActual) < tolerancia then
                disp("Convergencia alcanzada en " + string(iteracionActual) + " iteraciones.");
                return
            end
            valorActual = nuevoValor1;
            continue;
        end

        disp("Iteración " + string(iteracionActual) + ": Xn = " + string(nuevoValor));
        
        if abs(nuevoValor - valorActual) < tolerancia then
            disp("Convergencia alcanzada en " + string(iteracionActual) + " iteraciones.");
            return
        end
        
        valorActual = nuevoValor;
    end

    disp("No se alcanzó la convergencia en " + string(maxIteraciones) + " iteraciones.");
endfunction

// Coeficientes ajustados para mejorar la convergencia
PuntoFijo("lineal", [1, 2], 0.5, 0.0001, 50);
PuntoFijo("cuadratica", [1, -4, 4], 1, 0.0001, 50);
PuntoFijo("cubica", [1, -6, 11, -6], 1, 0.01, 50);
