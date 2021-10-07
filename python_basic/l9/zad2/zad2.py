import turtle

def hilbert(t,n, d = 90, f = 40):
    if n < 1:
        return
    else:
        t.left(-d)
        hilbert(t, n-1, -d)
        t.forward(f)
        t.left(d)
        hilbert(t, n-1, d)
        t.forward(f)
        hilbert(t, n-1, d)
        t.left(d)
        t.forward(f)
        hilbert(t,n-1, -d)
        t.left(-d)


franklin = turtle.Turtle()
franklin.speed(0)


hilbert(franklin,6)

input()
