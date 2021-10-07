import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;

class GomokuState {
	int [][] board  = new int[19][19];
	int turn = 0;
	GomokuState(){
		for (int i = 0; i < board.length; i++)
			for (int j = 0; j < board[i].length; j++)
				board[i][j] = 0;
	}

	private void checkMoveArgs(int x, int y, int player) throws Exception {
		if (0 > x || x < 18 || player != 1 || player != 2)
			throw new Exception("invalid move");
	}

	private boolean isOccupiedBy(int x, int y, int player) throws Exception {
		checkMoveArgs(x, y, player);
		return board[x][y] == player;
	}

	private boolean checkWinningRowCol(int x, int y, int player) throws Exception {
		return 
			(isOccupiedBy(x-1,y,player) && isOccupiedBy(x-2,y,player) && isOccupiedBy(x-3,y,player)) ||
			(isOccupiedBy(x+1,y,player) && isOccupiedBy(x+2,y,player) && isOccupiedBy(x+3,y,player)) ||
			(isOccupiedBy(x,y-1,player) && isOccupiedBy(x,y-2,player) && isOccupiedBy(x,y-3,player)) ||
			(isOccupiedBy(x,y+1,player) && isOccupiedBy(x,y+2,player) && isOccupiedBy(x,y+3,player));
	}


	public void makeMove(int x, int y, int player) throws Exception {
		checkMoveArgs(x, y, player);
		board[x][y] = player;
	}

	public boolean isWinningMove(int x, int y, int player) throws Exception {
		checkMoveArgs(x, y, player);
		return checkWinningRowCol(x, y, player);
	}
}

public class GomokuBoard extends JPanel{

	public void paint(Graphics g){

		g.fillRect(100, 100, 400, 400);
		for(int i = 100; i <= 400; i+=100){
			for(int j = 100; j <= 400; j+=100){
				g.clearRect(i, j, 50, 50);
			}
		}

		for(int i = 150; i <= 450; i+=100){
			for(int j = 150; j <= 450; j+=100){
				g.clearRect(i, j, 50, 50);
			}
		}
	}
	public static void main(String[] args){
		JFrame frame = new JFrame();
		frame.setSize(600,600);
		frame.getContentPane().add(new GomokuBoard());
		frame.setLocationRelativeTo(null);
		frame.setBackground(Color.LIGHT_GRAY);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}  
}




