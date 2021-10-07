import javax.swing.*;  
import java.awt.*;  

class Drawing extends Canvas { 
	Color bg = Color.BLACK;
	public void changeColor(){
		bg = Color.RED;
	}
	public void paint(Graphics g) {  
		g.drawString("Hello",40,40);  
		setBackground(bg);  
	}  
}


public class GomokuBoard{  

	JMenu menu, submenu;  
	JMenuItem i1, i2, i3, i4, i5;  
	GomokuBoard(){  
		JFrame f = new JFrame("Menu and MenuItem Example");  
		JMenuBar mb = new JMenuBar();  
		menu = new JMenu("Menu");  
		i1 = new JMenuItem("Item 1");  
		i2 = new JMenuItem("Item 2");  
		i3 = new JMenuItem("Item 3");  
		menu.add(i1); menu.add(i2); menu.add(i3);  
		f.setJMenuBar(mb);  
		mb.add(menu);  


		Drawing d1 = new Drawing();
		Drawing d2 = new Drawing();
		Drawing d3 = new Drawing();
		Drawing d4 = new Drawing();

		f.add(d1);f.add(d2);f.add(d3);f.add(d4);
		f.setLayout(new GridLayout(2,2));  

		f.setSize(600,600);  
		f.setVisible(true);  
	}  
	public static void main(String args[])  
	{  
		new GomokuBoard();  
	}
}  

