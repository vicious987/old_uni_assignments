package Algorithms;

public class AlgorithmsException {
	public static class EmptyCollection extends Exception {
		public EmptyCollection(){
			super("This action is illegal on empty collection.");
		}

		public EmptyCollection(String msg){
			super(msg);
		}
	}
}
