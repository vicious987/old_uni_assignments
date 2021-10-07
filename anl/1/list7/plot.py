import matplotlib.pyplot as plt
import numpy as np

# 100 linearly spaced numbers
x = np.linspace(-1, 1, 100)

arr1 = [-1, 0, 1]
def p(x, wezly):
    r = 1
    for w in wezly:
        r = r * (x - w)
    return r
# the function, which is y = sin(x) here
y = p(x, arr1)

# setting the axes at the centre
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
ax.spines['left'].set_position('center')
ax.spines['bottom'].set_position('center')
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

# plot the functions
plt.plot(x, y, 'b', label='yeeeboi')

plt.legend(loc='upper left')

# show the plot
plt.show()
