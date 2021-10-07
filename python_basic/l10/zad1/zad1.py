def spelnialna(F):
  zmienne = set(F) - set("() !+*")
  F = F.replace('+', ' or ')
  F = F.replace('*', ' and ')
  F = F.replace('!', ' not ')
  return  any( eval(F,wart) for wart in wartosciowania(zmienne))

def dict_add(D, k, v):
  D = dict(D)
  D[k] = v
  return D
      
def wartosciowania(Z):
  if len(Z) == 0:
    return [ {} ]
  Z = list(Z)  
  z = Z[0]
  Ws = wartosciowania(Z[1:])
  
  return [ dict_add(d, z, val) for d in Ws for val in [False, True] ]
  
def is_tautology(F):
    zmienne = set(F) - set("() !+*")
    F = F.replace('+', ' or ')
    F = F.replace('*', ' and ')
    F = F.replace('!', ' not ')
    return  all(eval(F,wart) for wart in wartosciowania(zmienne))


    
print (wartosciowania('abc'))
  
print (spelnialna('!(p+q+r) * (r+p+q)'))
