#Mateusz Obara lista 3 zadanie 2
import turtle
import random
import sys

def make_sorted_list_rand_int(number_of_bars = 5, maximum_h = 100, minimum_h = 0):
    if maximum_h < minimum_h:
        minimum_h, maximum_h = maximum_h, minimum_h 
    ret = []
    for n in range(number_of_bars):
        ret.append(random.randint(minimum_h, maximum_h))
    ret.sort()
    return ret

def draw_bar(turtle, height = 20, width = 10):
    for x in range(2):
        turtle.forward(width)
        turtle.left(90)
        turtle.forward(height)
        turtle.left(90)

def move_to_next(turtle, width = 10, space = 5):
    turtle.forward(width)
    turtle.penup()
    turtle.forward(space)
    turtle.pendown()


leonardo = turtle.Turtle()
sc = turtle.Screen()

w = 20 # width
s = 10 # space between bars
list_of_bar_h = make_sorted_list_rand_int(10,300,0)

for h in list_of_bar_h:
    draw_bar(leonardo, h, w)
    move_to_next(leonardo, w, s)  

input()
