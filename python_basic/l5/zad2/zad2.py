import turtle

def draw_square(turtle, size, r,g,b):
    
    turtle.fillcolor((r,g,b))
    turtle.begin_fill()
    for x in range(4):
        turtle.fd(size)
        turtle.right(90)
    turtle.end_fill()


def draw_smth(turtle,size):
    for x in range(122):
        draw_square(turtle,size - 2*x, 255-x,255,0+x)
        turtle.right(360/122)
        #turtle.fd(2)
    

franklin = turtle.Turtle()
turtle.colormode(255)
franklin.speed(0)
franklin.left(90)
#draw_square(franklin, 100, 255,200,0)
draw_smth(franklin, 100)
input()
