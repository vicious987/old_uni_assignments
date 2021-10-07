
// wczytaj i wypisz
//4 	32 		256 	2017
//IV 	XXXII 	CCLVI 	MMXVII
public class RomanNumerals
{
	private static String[] roman = {"M", "CM", "D", "CD", "C","XC", "L", "XL", "X", "IX", "V", "IV", "I"};
	private static int[] arabic = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};

	String arabicToRoman(int number) {
		if (number > 3999 || number < 1)
			throw new IllegalArgumentException("Arg expected to be within <1, 3999>, (" + number + " given).");
		String r = "";
		for(int i = 0; i < roman.length && number > 0; i++){
			int times = number / arabic[i];
			number = number - times * arabic[i];
			r = r + roman[i].repeat(times);
		}
		return r;
	}

    public static void main (String[] args) {
		RomanNumerals rn = new RomanNumerals();
		for (int i = 0; i < args.length; i++){
			int num = new Integer(args[i]);
			System.out.println(args[i] + " " + rn.arabicToRoman(num));
		}
	}
}
