import math 
import numpy as np
import random 

def f(x):
  return 0.5 * (np.transpose(x) @ a  @ x) + np.transpose(x) @ b

def grad(pt):
    return a @ pt + b

def steepest_descent(eps): 
    xk = np.transpose(np.array([[0, 0, 1]], float))
    print(xk, np.shape(xk))   
    for i in range(100):
      q = grad(xk)
      print(a @ xk)
      m = -(np.linalg.norm(q) ** 2) / (np.transpose(q) @ a @ q)
      xl = xk + q @ m
      if abs(f(xk) - f(xl)) <= eps:
        break
      xk = xl
    else:
        print("No appropriate answer was found.")
    return xk

def steepest_coordinate_descent(eps):
  xk = np.transpose(np.array([[0, 0, 1]], float))
  for i in range(100):
    for j in range(3):
      q = [[0 for v in range(3)]]
      q[0][j] = 1
      q = np.transpose(q)
      print(q, np.shape(q), np.shape(grad(xk)))
      m = -q @ grad(xk)/(q @ a @ q)
      xl = xk + q @ m
    if abs(f(xk) - f(xl)) <= eps:
      break
    xk = xl
  else:
    print("No appropriate answer was found.")
  return xk

eps = 0.000001
random.seed()
a = np.array([[random.uniform(-50, 50) for j in range(3)] for i in range(3)])
a = a @ np.transpose(a)
print(a)
b = np.array([[random.uniform(-50, 50) for j in range(3)]])
b = np.transpose(b)
print("Result of steepest descent  algorithm: ")
xmin = steepest_coordinate_descent(eps)
print("xmin: ", xmin)
print("fmin: ", f(xmin))
