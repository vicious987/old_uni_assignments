import turtle

def zlicz(znak, napis):
  licznik = 0
  for z in napis:
    if z == znak:
      licznik += 1
  return licznik

def square(turtle, n):
    turtle.begin_fill()
    for x in range(4):
        turtle.fd(n)
        turtle.rt(90)
    turtle.end_fill()

def draw_this(turtle, command_seq, color_list):
    r = 0
    b = 0
    g = 0
    current_color = (r,g,b)
    for i, c in enumerate(command_seq):
        if c.isdigit():


    next_color
    for i, c in enumerate(command_seq):
        if c.isdigit():

    N = zlicz('f', command_seq)
    pozycja = 0
    for x in command_seq :
        if x == 'u':
            turtle.penup()
        elif x == 'd':
            turtle.pendown()
        elif x.isdigit():
            turtle.color(color_list[int(x)])# % len(color_list))
        elif x == 's':
            a = pozycja / N
            square(turtle,30)
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
        

colors = [(255,0,0), (0,255,0), (0,0,255)]
frank = turtle.Turtle()
frank.color("red")

sq = 4 * ("0" + 5*"f" + "1" + 5*"f" + "u" + 10*"b" + "r" + "d")

draw_this(frank, "ss", colors)

#square(frank, 50)
