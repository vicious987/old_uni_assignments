// T0-FIX:	EQUALS - CHANGE FROM PAIR TO OBJECT
//package lista3;

public class Pair
{
	public final String key;
	private double value;

	public Pair(String key, double value){
		this.key = key;
		this.value = value;
	}

	public Pair(String key)
	{
		this.key = key;
	}
	
	public void set_value(double value) {
		this.value = value;
	}

	public double get_value() {
		return this.value;
	}

	public String get_key() {
		return this.key;
	}

	public boolean equals(Pair other_pair) {
		if (this.key == other_pair.get_key() && this.value == other_pair.get_value())
			return true;
		else		
			return false;
	}

	public String to_string(){
		return "key: " + this.key + " value: " + String.valueOf(this.value);
	}
}

