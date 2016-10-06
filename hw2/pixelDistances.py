import numpy as np
import math

M = np.array([1, 1])
N = np.array([3, 1])
A = np.array([2, 2])
B = np.array([2, 3])
C = np.array([2, 4])
D = np.array([3, 2])
x = np.array([3, 3])
E = np.array([3, 4])
F = np.array([4, 2])
G = np.array([4, 3])
H = np.array([4, 4])
L = np.array([5, 3])

def d2(x, y):
	return ((x[0]-y[0])**2 + (x[1]-y[1])**2)**(0.5)

def d1(x, y):
	return (abs(x[0]-y[0]) + abs(x[1]-y[1]))

def d0(x, y):
	return max(abs(x[0]-y[0]), abs(x[1]-y[1]))


print("d2:")
print("\tx and M =", d2(x, M))
print("\tx and L =", d2(x, L))
print("\tF and N =", d2(F, N))
print("\tL and M =", d2(L, M))
print("d1:")
print("\tx and M =", d1(x, M))
print("\tx and L =", d1(x, L))
print("\tF and N =", d1(F, N))
print("\tL and M =", d1(L, M))
print("d0:")
print("\tx and M =", d0(x, M))
print("\tx and L =", d0(x, L))
print("\tF and N =", d0(F, N))
print("\tL and M =", d0(L, M))

