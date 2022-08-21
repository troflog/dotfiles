import numpy as np
import scipy as sc
import matplotlib.pyplot as plt
x = np.random.normal(size=4)
y = sc.rand()
plt.plot(x,x)
#plt.show()
print(y)
g = sc.stats.norm.rvs(size = 31)
