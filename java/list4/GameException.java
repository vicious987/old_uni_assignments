public class GameException {

	public static class InvalidInputLength extends Exception {
		public InvalidInputLength(){
			super("Given input has invalid length.");
		}
		public InvalidInputLength(String msg){
			super(msg);
		}
	}

	public static class InputNotADigit extends Exception {
		public InputNotADigit(){
			super("Given input is not a digit.");
		}
		public InputNotADigit(String msg){
			super(msg);
		}
	}

	public static class InputOutOfBounds extends Exception {
		public InputOutOfBounds(){
			super("Given input is outside of exptected bounds.");
		}
		public InputOutOfBounds(String msg){
			super(msg);
		}
	}

	public static class UnreadableInput extends Exception {
		public UnreadableInput(){
			super("Given input is empty or consist of white signs"); 
		}
		public UnreadableInput(String msg){
			super(msg);
		}
	}
}
