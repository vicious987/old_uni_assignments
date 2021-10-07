import turtle


def draw_pixel(t, location, color, size = 2):
    t.penup()
    t.goto(location)
    t.pendown()
    t.color(color)
    t.begin_fill()
    for x in range(4):
        t.fd(size)
        t.rt(90)
    t.end_fill()

f = open("image.txt")
img_as_txt = []
pixels = []
franklin = turtle.Turtle()
turtle.colormode(255)
franklin.speed(0)

pixel_size = 50
starting_x = 0
starting_y = 0

for line in f:
    img_as_txt.append(line.split())

for verse in img_as_txt:
    l = []
    for pixel_txt in verse:
        pixel_tuple = eval(pixel_txt)
        l.append(pixel_tuple) 
    pixels.append(l)

for y, verse in enumerate(pixels):
    for x, pixel_color in enumerate(verse):
        draw_pixel(franklin, (starting_x + (x * pixel_size), starting_y + -(y * pixel_size)),  pixel_color, pixel_size)  
