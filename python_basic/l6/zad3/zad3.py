from turtle import *
import random

BOK = 15
tracer(0,1)
SX = 0
SY = 0

def kwadrat(x, y, kolor):
  fillcolor(kolor)
  pu()
  goto(SX + x * BOK, SY + y * BOK)
  pd()
  begin_fill()
  for i in range(4):
    fd(BOK)
    rt(90)
  end_fill() 

def rysuj(T):
  for y in range(len(T)):
    for x in range(len(T[y])):
      if T[y][x] == '#':
        kolor = 'blue'
      else:
        kolor = 'pink'
      kwadrat(x, y, kolor)
  update()    
      
        
def tablica(M, N):
  T = []
  for i in range(M):
    T.append( N * [0] )
  return T  
  
def sasiedzi(x,y, MX, MY):
  wynik = []
  for dx,dy in [ (-1,-1), (-1,1), (1,1), (1,-1), (1,0), (0,1), (-1,0), (0,-1)]:
    nx = (x+dx) % MX
    ny = (y+dy) % MY
    
    wynik.append( (nx,ny) )
  return wynik
  
def nowe_pokolenie(T):
  MY = len(T)
  MX = len(T[0])
  N = tablica(MY, MX)
  for y in range(MY):
    for x in range(MX):
      liczba_komorek = 0
      for nx,ny in sasiedzi(x,y, MX, MY):
        if T[ny][nx] == '#':
          liczba_komorek += 1
      if T[y][x] == '#' and liczba_komorek in [2,3]:
        N[y][x] = '#'
      elif T[y][x] == '#':
        N[y][x] = '.'
      elif T[y][x] == '.' and liczba_komorek == 3:
        N[y][x] = '#'
      else:
        N[y][x] = '.'
  return N
         
kolonia = """
................
................
.....###........
.......#........
......#.........
................
................
.##.............
................
""".split()[::-1]



kolonia = list(map(list, kolonia))

while True:
  rysuj(kolonia)
  kolonia = nowe_pokolenie(kolonia)


input()
