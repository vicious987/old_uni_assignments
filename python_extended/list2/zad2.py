#!/usr/bin/env python3

class Color:
   PURPLE = '\033[95m'
   VAR = CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   OP = YELLOW = '\033[93m'
   RED = '\033[91m'
   CONST = BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

class Formula:
    colorEnd = Color.END
    def __init__(self):
        self.vars = []

class Operator1(Formula):
    colorStart = Color.OP
    sign = "_OP1_"

    def __init__(self, a):
        self.arg = a
        self.vars = a.vars

    def __str__(self):
        if isinstance(self.arg, Var) or isinstance(self.arg, Const):
            return self.sign + str(self.arg)
        else:
            return self.sign + "(" + str(self.arg) + ")"

class Operator2(Formula):
    colorStart = Color.OP
    sign = "_OP2_"

    def __init__(self, a1, a2):
        self.argLeft = a1
        self.argRight = a2
        self.vars = a1.vars + a2.vars

    def __str__(self):
        return "(" + str(self.argLeft) + self.sign + str(self.argRight) + ")"

class Const(Formula):
    colorStart = Color.CONST
    sign = "_CONST_"

    def __str__(self):
        me = type(self)
        return self.colorStart + self.sign + self.colorEnd

class Var(Formula):
    colorStart = Color.VAR

    def __init__(self, n):
        self.name = n
        self.vars = [n]

    def __str__(self):
        return Var.colorStart + self.name + Var.colorEnd

    def evaluate(self, evaldict):
        return evaldict[self.name]

class T(Const):
    sign = "T"

    def evaluate(self, evaldict = None):
        return True

class F(Const):
    sign = "F"

    def evaluate(self, evaldict = None):
        return False 

class Neg(Operator1):
    sign = Operator1.colorStart + "¬" + Operator1.colorEnd    

    def evaluate(self, evaldict):
        return not self.arg.evaluate(evaldict)

class And(Operator2):
    sign = Operator2.colorStart + " ∧ " + Operator2.colorEnd

    def evaluate(self, evaldict):
        return self.argLeft.evaluate(evaldict) and self.argRight.evaluate(evaldict)

class Or(Operator2):
    sign = Operator2.colorStart + " ∨ " + Operator2.colorEnd

    def evaluate(self, evaldict):
        return self.argLeft.evaluate(evaldict) or self.argRight.evaluate(evaldict)

class Xor(Operator2):
    sign = Operator2.colorStart + " ⊕ " + Operator2.colorEnd

    def evaluate(self, evaldict):
        return self.argLeft.evaluate(evaldict) or self.argRight.evaluate(evaldict)

class Imp(Operator2):
    sign = Operator2.colorStart + " ⇒ " + Operator2.colorEnd

    def evaluate(self, evaldict):
        return not self.argLeft.evaluate(evaldict) or self.argRight.evaluate(evaldict)

class Iff(Operator2):
    sign = Operator2.colorStart + " ⇔ "+ Operator2.colorEnd

    def evaluate(self, evaldict):
        return self.argLeft.evaluate(evaldict) == self.argRight.evaluate(evaldict)

def makeAllEvalLists(listofvars):
    evals = [[]]
    for x in range(len(listofvars)):
        evals = [[True] + e for e in evals] + [[False] + e for e in evals]
    return evals 

def makeAllEvalDicts(listofvars):
    return [dict(zip(listofvars, e)) for e in makeAllEvalLists(listofvars)]

def isTautology(formula):
    return all([formula.evaluate(e) for e in makeAllEvalDicts(formula.vars)])
    


e = {"x" : False, "z": True}
lov = ["x", "z"]
true, false = T(), F()
zm1 = Var("x")
zm2 = Var("z")
n = Neg(zm1)
disj = And(zm2, true)
#imp = Imp(zm1, disj)
imp = Imp(n, disj)
n2 = Neg(imp)

#print(imp)
#print(imp.evaluate(e))

#print(n2)
#print(n2.evaluate(e))

taut = Or(n2, true)
print(taut)
print([taut.evaluate(x) for x in makeAllEvalDicts(lov)])
print(isTautology(taut))
print([n2.evaluate(x) for x in makeAllEvalDicts(lov)])
print(isTautology(n2))
