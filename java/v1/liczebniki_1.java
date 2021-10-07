class Liczebniki
{
	private static String[] array_0_19 = 	{"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
						 "eleven", "twelve", "thirteen", "fourteen", "fifteen", 
				  		 "sixteen", "seventeen", "eighteen", "nineteen"};
	static String[] array_tens = 	{"","ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"};
	private static String[] array_big_numbers = 	{"thousand", "million", "milliard"};

	private String turn_word_into_wordth(String n)
	{
		if(n.contains("-")) {
			String[] parts = n.split("-");
			return parts[0] + "-" + turn_word_into_wordth(parts[1]);
		}
		switch(n) {
			case "1":
				return "1st";
			case "2":
				return "2nd";
			case "3":
				return "3rd";
			case "one":
				return "first";
			case "two":
				return "second";
			case "three":
				return "third";
			case "five":
				return "fifth";
			case "twelve":
				return "twelfth";
			case "twenty":
				return "twentieth";
			case "thirty":
				return "thirtieth";
			case "forty":
				return "fortieth";
			case "fifty":
				return "fiftieth";
			case "sixty":
				return "sixtieth";
			case "seventy":
				return "seventieth";
			case "eighty":
				return "eightieth";
			case "ninety":
				return "ninetieth";
			default:
				return n.concat("th"); 
		}
	}

	private String turn_s_into_sth(String s)
	{
		if (Character.isDigit(s.charAt(0)))
			s = s.substring(0, s.length()-1) + turn_word_into_wordth(s.substring(s.length() -1));
		else
			s = s.substring(0, s.lastIndexOf(" ")+1) + turn_word_into_wordth(s.substring(s.lastIndexOf(" ") + 1));
		return s;
	}

	private String xxx_into_words(int x)
	{

		if (x > 999 || x < 0)
			throw new IllegalArgumentException("3digits_into_words dostalo wiecej niz 3 cyfry lub liczbe ujemna\n");
		if (x < 20)
			return array_0_19[x]; 
		if (x < 100)
			if (x%10 == 0)
				return array_tens[x/10];
			else
				return array_tens[x/10] + "-" + array_0_19[x%10];
		if (x < 1000)
			if (x%100 == 0)
				return array_0_19[x/100] + " hundred";
			else
				return array_0_19[x/100] + " hundred " + xxx_into_words(x%100);
		return "";
	}

	private String number_into_words(int number)
	{
		int digits = String.valueOf(number).length();	
		if(digits <= 3)
			return xxx_into_words(number);
		else {
			int x = 0;
			int d = 3;
			while (digits > d * 2) {
				d *= 2;
				x += 1;
			}
			int slicer = (int)Math.pow(10, 3 * (int)Math.pow(2,x));
			return  number_into_words(number / slicer) + " " + array_big_numbers[x] + ", " + number_into_words(number % slicer); 
		}
	}


	public static void main(String[] args)
	{
		Liczebniki liczebniki = new Liczebniki();
		System.out.println();
		for (String argument : args)
		{
			int current_number = new Integer(argument);
			if(current_number < 0)
			       throw new IllegalArgumentException("argument jest liczba ujemna\n");	
			String word_form = liczebniki.number_into_words(current_number);

			if(current_number > 99 && current_number % 100 != 0) // add and
				word_form = word_form.substring(0, word_form.lastIndexOf(" ")) + " and" + word_form.substring(word_form.lastIndexOf(" ")); 

			System.out.println(argument);
			System.out.println(liczebniki.turn_s_into_sth(argument));
			System.out.println(liczebniki.turn_s_into_sth(word_form));
			System.out.println();
		}
	}
}
