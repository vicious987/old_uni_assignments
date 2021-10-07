from duze_cyfry import *
import turtle
import random

def draw_box(turtle, cords, n, col1 = "red" , col2 = "black"):
    turtle.penup()
    turtle.goto(cords)
    turtle.pendown()
    turtle.color(col2, col1)
    turtle.begin_fill()
    for x in range(4):
        turtle.fd(n)
        turtle.rt(90)
    turtle.end_fill()

def draw_digit(turtle, start_cord, n, digit_bg_col, digit_col, digit):
    x = start_cord[0]
    y = start_cord[1]

    for c in digit:
        cords = (x,y)
        if c  == "#":
            draw_box(turtle, cords, n, digit_col)
            x = x + n
        elif c == "\n":
            x = start_cord[0]
            y = y - n
        else:
            draw_box(turtle, cords, n, digit_bg_col)
            x = x + n


pallette = ["red","white","green","blue","yellow","orange","pink","teal","gray","brown"]
franklin = turtle.Turtle()
turtle.speed(0)

sx = -100
sy = 100
box_size = 10
digit_size = 5


for x in range(10):
    #franklin.penup()
    #franklin.goto((sx + x * (digit_size + 1) * width, sy))
    cx = sx + x * (digit_size + 1) * box_size 
    #franklin.pendown()
    draw_digit(franklin, (cx,sy), box_size, "black",pallette[random.randint(0,9)], Cyfry[x])

input()
