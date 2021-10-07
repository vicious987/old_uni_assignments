#Mateusz Obara lista 3 zad 1

import turtle
import math

def draw_figure(turtle, sides = 3, length = 50, triangle_point = 0.5, pensize = 1, colors = ["black"]):
    orginal_pos = turtle.position()
    turtle.pensize(pensize)
    angle = 360/sides
    square_side = 2 * length * math.tan(math.radians(angle/2))
    beta = math.degrees(math.atan(triangle_point * length / (square_side/2))) # triangle angle
    triangle_side = (square_side / 2) / math.cos(math.radians(beta)) 
   
    for x in range(sides):
        turtle.pencolor(colors[x % len(colors)])
        turtle.penup()
        turtle.forward(length)
        turtle.pendown()
        turtle.right(90)
        turtle.forward(square_side/2)
        for x in range(4):
            turtle.left(90)
            turtle.forward(square_side)
        turtle.right(180  - beta)
        turtle.forward(triangle_side)
        turtle.right(2*beta)
        turtle.forward(triangle_side)
        turtle.penup()
        turtle.right(90-beta)
        turtle.setposition(orginal_pos)
        turtle.right(angle)



donatello = turtle.Turtle()
donatello.speed(0)
donatello.left(90)
#donatello.stamp()
draw_figure(donatello, 10, 100, 0.5, 2, ["red","green","blue"])
input()
