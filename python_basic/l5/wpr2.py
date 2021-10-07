import math
import turtle

def draw_part(turtle, size, sides):
    starting_point = turtle.position()
    beta = ((sides - 2) * 180) / sides
    length_2 = math.sin(math.radians(360/sides/2)) * (size / 2)

    turtle.penup()

    turtle.fd(length_2)
    turtle.pendown()

    turtle.right(90)
    turtle.fd(size/2)
    for x in range(sides - 1):
        #turtle.stamp()
        turtle.right(180 - beta)
        turtle.fd(size)
    turtle.right(180 - beta)
    turtle.fd(size/2)
    turtle.penup()
    turtle.setpos(starting_point)
    turtle.pendown()
    turtle.setheading(0)

def draw_caterpillar(turtle, size, sides,length, space = 100,angle = 30, subpart_length = 5):
    sub_count = 0
    angle_1 = angle
    angle_2 = 360 - angle

    for x in range(length):
        sub_count += 1
        draw_part(turtle, size, sides)
        #turtle.right(angle_1)
        turtle.penup()
        turtle.fd(space)
        turtle.pendown()
        #if sub_count % subpart_length == 0:
        #    angle_1, angle_2 = angle_2, angle_1



donatello = turtle.Turtle()
donatello.left(90)
donatello.speed(1)
draw_part(donatello,100,6)
#draw_caterpillar(donatello,50,5,10,100,30,5)
