import math
import turtle

def draw_part(turtle, size, sides):
    starting_point = turtle.position()
    angle = 360 / sides
    beta = ((size -2) * 180) / size
    length_2 = math.sin(math.radians(angle/2)) * (size / 2)


    turtle.penup()

    turtle.fd(length_2)
    turtle.pendown()

    turtle.right(90)
    turtle.fd(size/2)
    #for x in range(5):
    #turtle.right(180 - beta)
    turtle.fd(size)
    #turtle.right(180 - beta)
    #turtle.fd(size/2)



        #turtle.right(angle/2)
        #turtle.fd(length_2)
        #turtle.pendown()
        #turtle.right(72)
        ##turtle.right((360-angle)/2)#270 - 3/2 * angle)
        #for x in range(sides):
        #    turtle.fd(size)
        #    turtle.right(180 - angle)

donatello = turtle.Turtle()
donatello.left(90)
donatello.speed(1)
draw_part(donatello,100,5)
