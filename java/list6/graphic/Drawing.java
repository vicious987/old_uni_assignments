package graphic;
import java.awt.*;
import java.awt.event.*;
import java.util.LinkedList;

public class Drawing {
	Frame frame = new Frame("Drawing board");
	private Color currentColor;
	private int width, height = 500; 
	private int startingX, startingY = 500;
	private int canvasWidth, canvasHeight = 200;

	private final LinkedList<Line> lines = new LinkedList<Line>();

	public void addLine(Point s, Point e, Color c){
		lines.add(new Line(s, e, c));
	}

	public void addLine(int sx, int sy, int ex, int ey, Color c){
		addLine(new Point(sx, sy), new Point(ex, ey), c);
	}

	void removeLast(){
		if (!lines.isEmpty()){
			lines.removeLast();
		}
	}

	void removeFirst(){
		if (!lines.isEmpty()){
			lines.removeFirst();
		}
	}

	void removeAll(){ lines.clear(); }

	public void display(){
		frame.setBounds(startingX, startingY, width, height);

		frame.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent windowEvent){
				System.exit(0);
			}
		});

		MouseListener mouselis = new MouseListener();
		KeyListener keylis = new KeyListener();
		MyCanvas canvas = new MyCanvas(canvasWidth, canvasHeight);
		frame.add(canvas, BorderLayout.CENTER);

		canvas.addMouseListener(mouselis);
		canvas.addKeyListener(keylis);

		List palette = new List(1, false);
		palette.add("black");
		palette.add("red");
		palette.add("green");
		palette.add("blue");

		frame.add(palette, BorderLayout.EAST);
		palette.setBackground(Color.gray);
		palette.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e){
				if(null!=palette.getSelectedItem()){
					switch(palette.getSelectedItem()){
						case "black":
							currentColor = Color.black;
							break;
						case "red":
							currentColor = Color.red;
							break;
						case "green":
							currentColor = Color.green;
							break;
						case "blue":
							currentColor = Color.blue;
							break;
					}
				}
			}
		});
		frame.setVisible(true);
	}

	public class MyCanvas extends Canvas {
		public MyCanvas(int width, int height){
			//setBackground(Color.white);
			setSize(width, height);
		}
		@Override
		public void paint (Graphics g){
			super.paint(g);
			for(Line l : lines){
				g.setColor(l.color);
				g.drawLine(l.start.x, l.start.y, l.end.x, l.end.y);
			}
		}
	}

	public class MouseListener extends MouseAdapter {
		int sx, sy, ex, ey = 0;

		@Override
		public void mousePressed(MouseEvent e){
			this.sx = e.getX();
			this.sy = e.getY();
		}

		@Override
		public void mouseReleased(MouseEvent e){
			this.ex = e.getX();
			this.ey = e.getY();
			addLine(sx, sy, ex, ey, currentColor);
			Canvas temp = (Canvas)e.getSource();
			Graphics g = temp.getGraphics();
			temp.paint(g);
		}
	}

	public class KeyListener extends KeyAdapter {
		@Override
		public void keyReleased(KeyEvent e){
			switch(e.getKeyCode()){
				case KeyEvent.VK_BACK_SPACE:
					removeAll();
					break;
				case KeyEvent.VK_B:
				case KeyEvent.VK_L:
					removeLast();
					break;
				case KeyEvent.VK_F:
					removeFirst();
					break;
			}
			Canvas temp = (Canvas)e.getSource();
			Graphics g = temp.getGraphics();
			temp.paint(g);
		}
	}
}
