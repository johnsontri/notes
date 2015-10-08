# encoding: utf-8

import math
import numpy as np

from scipy.stats import norm


def black_scholes(S, X, T, r, sigma):
    d1 = (np.log(S / X) + (r + (sigma ** 2) / 2) * T) / (sigma * math.sqrt(T))
    d2 = d1 - sigma * math.sqrt(T)
    return norm.cdf(d1) * S - X * (math.e ** (-r * T)) * norm.cdf(d2)


def monte_carlo(S, X, T, r, sigma, N):
    epsilon = np.random.normal()
    mu = r

    return S * math.e ** (
        (mu - 0.5 * sigma ** 2) * (T / N) + epsilon * sigma * math.sqrt(T / N))


if __name__ == '__main__':
    print('black-scholes',
        black_scholes(S=50, X=40, T=2, r=0.08, sigma=0.2))
    print('monte-carlo', 
        monte_carlo(S=50, X=40, T=2, r=0.08, sigma=0.2, N=100))
