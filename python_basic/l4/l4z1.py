#Mateusz Obara lista 4 zadanie 1
import turtle
import random


def draw(turtle, a, colors, color_number = 0):  
    if a < 10:
        return
    turtle.fillcolor(colors[color_number % (len(colors) - 1)])
    turtle.begin_fill()
    for x in range(4):
        turtle.fd(a/2)
        turtle.left(90)
        turtle.fd(a/2)
    turtle.end_fill()

    for x in range(4):
        turtle.right(180)
        draw(turtle, a/2, colors, color_number +1)
        turtle.right(180)
        turtle.fd(a/2)
        turtle.left(90)
        turtle.fd(a/2)
    turtle.end_fill()

colorlist = ["red","black","yellow","green","pink","orange","blue","purple","brown","gray"]

franklin = turtle.Turtle()
franklin.pensize(1)
franklin.speed(0)
draw(franklin, 200, colorlist)
input()
