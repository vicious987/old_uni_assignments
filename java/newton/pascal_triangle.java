package calc;

public class Pascal_triangle { 
	private final static int MAX = 65; 
	private static long[][] triangle = new long[MAX][MAX];
	
	static {
		for (int i = 0; i < MAX; i++)
			triangle[0][i] = 0;
		for (int i = 0; i < MAX; i++)
			triangle[i][0] = 1;		
		for (int x = 1; x < MAX; x++)
			for (int y = 1; y < MAX; y++)
				triangle[x][y] = triangle[x-1][y] + triangle[x-1][y-1];
	}


	public static long gnv(int n, int k) throws IllegalArgumentException 
	{
		if (n < k || 0 > n || 0 > k)
			throw new IllegalArgumentException(); 
		return triangle[n][k];
	}
	
	
	
	
	// testing if array looks like it supposed to	
/*		
	public static void main(String[] args)
	{
		System.out.println("---");
		for (int i = 0; i < MAX; i++) {
			for (int j = 0; j < MAX; j++){
				System.out.print(Pascal_triangle.triangle[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println("---");
	//	System.out.println(Pascal_triangle.get_newton_value(5,3));
	}
*/	
	//public static void main(String[] args)
	//{ System.out.println("kierwa"); }
	
} 
