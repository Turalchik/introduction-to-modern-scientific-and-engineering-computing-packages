from math import factorial

def binomial_coefficient(n, k):
    return factorial(n) // (factorial(k) * factorial(n - k))

def berni(n, k):
    def polynomial(x):
        coefficient = binomial_coefficient(n, k)
        term = (x ** k) * ((1 - x) ** (n - k))
        return coefficient * term

    return polynomial
