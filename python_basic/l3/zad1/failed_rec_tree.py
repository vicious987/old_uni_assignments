import turtle

def draw_tree(turtle, initial_length = 100, angle = 45):
    if (initial_length < 10):
        return
    turtle.forward(initial_length)
    turtle.right(angle)
    reset_position = turtle.position()
    draw_tree(turtle, initial_length/2, angle)
    turtle.setposition(reset_position)
    #turtle.left(2*angle)
    #draw_tree(turtle, initial_length/2, angle)
    #turtle.setposition(reset_position)
    
donatello = turtle.Turtle()
donatello.speed(1)
donatello.left(90)
draw_tree(donatello,100,30)
input()
