letras = ['a', 'f', 'g', 'o', 'l'];

contador = 1;

for i = 1:5
    for j = 1:5
        if j == i then continue; end
        for k = 1:5
            if k == i | k == j then continue; end
            for l = 1:5
                if l == i | l == j | l == k then continue; end
                for m = 1:5
                    if m == i | m == j | m == k | m == l then continue; end
                    palabra = string(contador) + ". " + letras(i) + letras(j) + letras(k) + letras(l) + letras(m);
                    disp(palabra);
                    contador = contador + 1;
                end
            end
        end
    end
end
