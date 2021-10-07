def median(l):
    l.sort() #sorted(l)
    index = (len(l)- 1) // 2
    if (len(l) % 2):
        return l[index]
    else:
        return (l[index] + l[index + 1]) / 2.0

def f(n):
    if n % 2 == 0:
        return n / 2
    else:
        return 3 * n + 1

def energy(n):
    energy_counter = 0
    while not n == 1:
        n = f(n)
        energy_counter += 1
    return energy_counter

def analysis_collatz(l,r):
    energy_list = []
    for x in range(l,r+1):
        energy_list.append(energy(x))
    energy_list.sort()
    return sum(energy_list) / len(energy_list), median(energy_list), min(energy_list), max(energy_list) 


print(analysis_collatz(5,10))
