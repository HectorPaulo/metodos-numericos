import numpy as np

a = 1
b = -6.543
c = -31.975266
d = 179.65217
coeficientes = [a, b, c, d]

def punto_fijo(g, x0, max_iter=100, max_value=1e10):
    for i in range(max_iter):
        x1 = g(x0)
        if abs(x1) > max_value:
            print(f"Valor excesivo alcanzado: x = {x1}. Abandonando la iteración.")
            return None, i+1
        if abs(x1 - x0) < 1e-6:
            return x1, i+1
        x0 = x1
    return None, max_iter

def g_cubica(a, b, c, d):
    return lambda x: x - (a*x**3 + b*x**2 + c*x + d) / (3*a*x**2 + 2*b*x + c)

def main():
    g = g_cubica(a, b, c, d)
    soluciones = []
    valores_iniciales = [-5, 7, 4]

    for x0 in valores_iniciales:
        sol, iteraciones = punto_fijo(g, x0)
        if sol is not None:
            soluciones.append(sol)
        else:
            print(f"El método no convergió para el valor inicial {x0}.")

    if len(soluciones) > 0:
        print(f"Raíces aproximadas: {soluciones}")
    else:
        print("No se encontraron raíces.")

if __name__ == "__main__":
    main()