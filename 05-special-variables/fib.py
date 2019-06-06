#!/usr/bin/env python


def fib(n):
    if n == 0: 
        return 0
    if n == 1:
        return 1
    return fib(n - 2) + fib(n - 1)


for i in range(10):
    print("Fib({})={}".format(i, fib(i)))
