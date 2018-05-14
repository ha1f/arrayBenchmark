#coding: utf-8

import sys
import numpy as np
import matplotlib.pyplot as plt
import codecs

sys.stdin = codecs.getreader('utf8')(sys.stdin.detach(), errors="ignore")

array = [item for item in enumerate(map(float, filter(lambda x: len(x) > 0, sys.stdin.readlines())))]
x = np.array([element[0] for element in array])
y = np.array([element[1] for element in array])

print(x)
print(y)

plt.plot(x, y)
plt.show()
