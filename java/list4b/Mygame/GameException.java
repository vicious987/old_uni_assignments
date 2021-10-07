package Mygame;
/** GameException groups up exception defined for Game and Game.Round classes
 * @author Mateusz Obara */
public class GameException {

	/** InvalidInputLength signals that input (permutation) is expected to longer or shorter*/
	public static class InvalidInputLength extends Exception {
		public InvalidInputLength(){
			super("Given input has invalid length.");
		}
		public InvalidInputLength(String msg){
			super(msg);
		}
	}

	/** InputNotADigit signals that input is not a single dec digit */
	public static class InputNotADigit extends Exception {
		public InputNotADigit(){
			super("Given input is not a digit.");
		}
		public InputNotADigit(String msg){
			super(msg);
		}
	}

	/** InputOutOfBounds signals that given input (digit) is outside of exptected range */
	public static class InputOutOfBounds extends Exception {
		public InputOutOfBounds(){
			super("Given input is outside of exptected bounds.");
		}
		public InputOutOfBounds(String msg){
			super(msg);
		}
	}

	/** UnredableInput signals that given input is either empty, or consist of only white signs*/
	public static class UnreadableInput extends Exception {
		public UnreadableInput(){
			super("Given input is empty or consist of white signs"); 
		}
		public UnreadableInput(String msg){
			super(msg);
		}
	}
}
