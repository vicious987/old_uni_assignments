import turtle

BOK = 20

def zlicz(znak, napis):
  licznik = 0
  for z in napis:
    if z == znak:
      licznik += 1
  return licznik

#def kwadrat(turtle,bok, kolor):
#  turtle.fillcolor(kolor)
#  #pencolor(kolor)
#  turtle.begin_fill()
#  for i in range(4):
#    turtle.fd(bok)
#    turtle.rt(90)
#  end_fill()  

def kwadrat(turtle,bok):
  turtle.begin_fill()
  for i in range(4):
    turtle.fd(bok)
    turtle.rt(90)
  turtle.end_fill()  



def mieszanina(k1, k2, a):
  #r1,g1,b1 = k1
  r1 = k1[0]
  g1 = k1[1]
  b1 = k1[2]
  
  r2,g2,b2 = k2
  
  r3 = (1-a) * r1 + a * r2
  g3 = (1-a) * g1 + a * g2
  b3 = (1-a) * b1 + a * b2
  
  return (r3,g3,b3)


def draw_this(turtle, command_seq, color_list):
    N = zlicz('f', command_seq)
    pozycja = 0
    for x in command_seq :
        if x == 'u':
            turtle.penup()
        elif x == 'd':
            turtle.pendown()
        elif x.isdigit():
            turtle.color(color_list[int(x)])# % len(color_list))
        elif x == 'f':
            a = pozycja / N
            kwadrat(turtle,BOK)
            pozycja += 1
            turtle.fd(BOK)
        elif x == 'b':
            turtle.bk(1)
        elif x == 'r':
            turtle.rt(90)
            turtle.fd(BOK)
        elif x == 'l':
            turtle.bk(BOK)
            turtle.lt(90)  

colors = ["red","blue","green","yellow","teal","pink","orange","brown","gray","black"]
frank = turtle.Turtle()

sq = 4 * ("0" + 5*"f" + "1" + 5*"f" + "u" + 10*"b" + "r" + "d")

draw_this(frank, sq, colors)
