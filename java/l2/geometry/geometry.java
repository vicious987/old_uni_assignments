package geometry;
import static java.lang.Math.*;

//TODO:
//testy 
//opakowac?
class Point {
    private double x, y;
	{
        x = 0;
        y = 0;
    }

	public Point (double x, double y) {
		this.x = x;
		this.y = y;
	}

    public void move(double dx, double dy) {
        x += dx;
        y += dy;
    }

	public void move(Myvector v){
		x += v.dx;
		y += v.dy;
	}

	public void rotate(Point p, double angle){
		double sinus = Math.sin(angle);
		double cosinus = Math.cos(angle);
		// translation
		this.x -= p.x;
		this.y -= p.y;
		//rotate
		this.x = this.x * cosinus - this.y * sinus;
		this.y = this.y * cosinus + this.x * sinus;
		//translate back
		this.x += p.x;
		this.y += p.y;
	}

	public void mirror(Lane mirror){
		double kc = mirror.b * this.x - mirror.a * this.y;
		Lane k = new Lane(mirror.a, -mirror.b, kc);
		Point crosspoint = Lane.intersection(mirror, k);
		this.x += 2 * (crosspoint.x - this.x);
		this.y += 2 * (crosspoint.y - this.y);
	}

    public static double distance(Point a, Point b) {
        double dx = b.x - a.x, dy = b.y - a.y;
        return sqrt(dx * dx + dy * dy);
    }
	public static boolean isEqual(Point a, Point b){
		return a.x == b.x && a.y == b.y;
	}
	public static Lane makeLane(Point a, Point b){
		double z = a.y - b.y / a.x - b.x;
		double c = a.y - z * a.x;
		return new Lane(z, -1, c);
	}
	public boolean onLane(Lane l){
		return 0 == l.a * this.x + l.b * this.y + l.c;
	}

    public String toString () {
        return "("+x+", "+y+")";
    }
}

class Myvector {
	final double dx, dy;

	public Myvector(double a, double b) {
		dx = a;
		dy = b;
	}

	public static Myvector add(Myvector v, Myvector u){
		return new Myvector(v.dx + u.dx, v.dy + u.dy);
	}
	
	public String toString() {
		return "<"+dx+", "+dy+">";
	}

}

class Lane {
	final double a, b, c;

	public Lane(double a, double b, double c) {
		this.a = a;
		this.b = b; 
		this.c = c;
	}

	public static boolean isParalel(Lane l, Lane k){
		return l.a * k.b == k.a * l.a;
	}

	public static boolean isPerpendicular(Lane l, Lane k){
		return l.a * k.b == -k.a * l.a;
	}

	public static Point intersection(Lane l, Lane k){
		double w = k.a * l.b  - l.a * l.b;
		double wx = -l.c * k.b - (-k.c) * l.b;
		double wy = l.a * (-k.c) - k.a * (-l.c);
		return new Point(wx / w, wy / w);
	}

	public String toString(){
		return "["+a+"x + "+b+"y +"+c+"]";
	}
}

//odcinek: przesun obroc odbij
class Segment{
	private Point[] points = new Point[2];

	public Segment(Point end1, Point end2){
		if (Point.isEqual(end1, end2)){
			//throw 
		} 
		points[0] = end1;
		points[1] = end2;
	}

	public void move(Myvector vec){
		for (Point p: points){
			p.move(vec);
		}
	}

	public void rotate(Point rotatepoint, double angle){
		for (Point p: points){
			p.rotate(rotatepoint, angle);
		}
	}

	public void mirror(Lane l){
		for (Point p: points){
			p.mirror(l);
		}
	}

	public String toString(){
		return "Segment: ("+points[0]+", "+points[1]+")";
	}
}

class Triangle{
	private Point[] points = new Point[3];

	public Triangle(Point p1, Point p2, Point p3){
		if (Point.isEqual(p1, p2)){
			//throw 
		} else {
			Lane l = Point.makeLane(p1, p2);
			if (p3.onLane(l)){
				//throw
			}
		}
		points[0] = p1;
		points[1] = p2;
		points[2] = p3;
	}

	public void move(Myvector vec){
		for (Point p: points){
			p.move(vec);
		}
	}

	public void rotate(Point rotatepoint, double angle){
		for (Point p: points){
			p.rotate(rotatepoint, angle);
		}
	}

	public void mirror(Lane l){
		for (Point p: points){
			p.mirror(l);
		}
	}

	public String toString(){
		return "Triangle: ("+points[0]+", "+points[1]+", "+points[1]+")";
	}
}
