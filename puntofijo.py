import math
import numpy as np

coeficientes = [1, 0, -80.5, 132, 374.0625]

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

soluciones = np.roots(coeficientes)
def g_cubica(a, b, c, d):
    return lambda x: x - (a*x**3 + b*x**2 + c*x + d) / (3*a*x**2 + 2*b*x + c)

def main():
    a = 1
    b = 1.11
    c = -19.6282
    d = 20.22744
    g = g_cubica(a, b, c, d)
    
    soluciones = []
    valores_iniciales = [-5.5, 3, 1.5]  
    
    for x0 in valores_iniciales:
        sol, iteraciones = punto_fijo(g, x0)
        if sol is not None:
            soluciones.append(sol)
            print(f"solución aproximada: {sol}")
        else:
            print("El método no convergió.")
    if (len(soluciones) == 0):
        print(f"Raíces aprox: {soluciones}")
print(f"Soluciones: {soluciones}")

if __name__ == "__main__":
    main()