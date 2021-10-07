package graphic;
import java.awt.Point;
import java.awt.Color;


public class Line {
	protected final Point start, end;
	public Color color;

	public Line (Point s, Point e, Color c){
		this.start = s;
		this.end = e;
		this.color = c;
	}
	//public Color getColor(){ return this.color; }
}
