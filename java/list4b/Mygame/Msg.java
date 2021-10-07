package Mygame;
/** A simgle class that holds constant values of Strings to print */
class Msg {
	public static final String reset = "\u001B[0m";
	public static final String black = "\u001B[30m";
	public static final String red = "\u001B[31m";
	public static final String green = "\u001B[32m";
    public static final String greenBold = "\033[1;32m";  // GREEN
	public static final String yellow = "\u001B[33m";    
	public static final String yellowBold= "\033[1;33m"; // YELLOW
	public static final String blue = "\u001B[34m";
	public static final String purple = "\u001B[35m";
	public static final String cyan = "\u001B[36m";
	public static final String white = "\u001B[37m";
	public static final String RoundWelcome = yellow + "Welcome to the new round, " + blue + "%s" + yellow + "! Try guessing the secret permutation." + reset;
	public static final String RoundHint = yellow + "Example of unmatched values: " + cyan + "%d" + yellow + " should be on the"+red+" %s"+yellow+" of given position." + reset;
	public static final String RoundWin = green + "Congratulations! You guessed the combination! " + greenBold + " You won!" + reset;
	public static final String RoundLost = red + "You used all Your chances. Round Over." + reset;
	public static final String RoundWrongAnswer = red + "Wrong answer." + reset;
	public static final String RoundLasted = yellow + "This round lasted for " + cyan + "%d" + yellow + " seconds." + reset;
	public static final String RoundEnd = yellow + "End of round.\n" + reset;
	public static final String RoundTriesleft = yellow + "This is "+cyan+"%d"+yellow+" out of "+cyan+"%d"+yellow+" tries." + reset;
	public static final String tryagain = yellow + "Please try again." + reset;
	public static final String GameWelcome = yellowBold + "Welcome to the game!" + reset;
	public static final String GameEnd = yellowBold + "End of the game!" + reset;
	public static final String GameRetry = yellow + "Do you want to retry this round? ("+green+"y"+yellow+"/"+red+"n"+ yellow+")" + reset;
	public static final String GameNextround = yellow + "Do you want to start another round? ("+green+"y"+yellow+"/"+red+"n"+ yellow+")" + reset;
	public static final String QuestionName = yellow + "What's your name, player?" + reset;
	public static final String Help = "im helping";
}
