import calc.*;

class Newton
{
	private String format_1(String word, int power)
	{
		if (power == 0)
			return "";
		if (power == 1)
			return word;
		else
			return word + "^" + power;
	}

	private String format_2(String word1, String word2)
	{
		if (word1 == "")
			return word2;
		if (word2 == "")
			return word1;
		else
			return word1 + "*" + word2;
	}

	private String format_x(long x)
	{
		if (x == 1)
			return "";
		else
			return x + "*";
	}

	public static void main(String[] args)
	{
		Newton newton = new Newton();
		String argument = args[0];
		int n = Integer.parseInt(args[1]);

		String sign;
		String ret = "";

		if (argument.contains("+")) 
			sign = "+";
		else
			sign = "-";

		String word1 = argument.substring(0,argument.indexOf(sign));
		String word2 = argument.substring(argument.indexOf(sign) + 1);
		if (n < 0)
			throw new IllegalArgumentException();
		if (n == 0)
			ret = "1";
		else {
			for (int i = 0; i <= n; i++)
			{
				if (i%2 == 0 && sign == "-")
					ret = "- " + newton.format_x(Pascal_triangle.gnv(n,i)) +" "+ newton.format_2(newton.format_1(word2, n-i), newton.format_1(word1, i)) +" "+ ret; 
				else
					ret = "+ " + newton.format_x(Pascal_triangle.gnv(n,i)) +" "+ newton.format_2(newton.format_1(word2, n-i), newton.format_1(word1, i)) +" "+ ret; 

			}
		
		ret = ret.substring(3);
		}
		System.out.println(ret);
	}
}
