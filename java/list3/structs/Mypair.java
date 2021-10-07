package structs;

/** Mypair is a stucture which holds key-value pairs (keys as String, values as double)
 * @author Mateusz Obara
 */
public class Mypair {
	/** pair's indentifier or label*/
	public final String key;
	/** pair's value*/
	private double value;

	/*//
	public Mypair(String k, double v) throws Exception {
		if (!k.isEmpty() && k != null){
			this.key = k;
			this.value = v;
		} else {
			throw new Exception("Mypair key is expected to be non null and non empty");
		}
	}
	*/
	public Mypair(String k, double v) {
		this.key = k;
		this.value = v;
	}

	/** constructor with default value set as 0.0
	 * @param 	k a key of the pair
	 */
	public Mypair(String k){
		this.key = k;
		this.value = 0;
	}

	/** setValue sets the value hold by pair 
	 * @param 	val a double value to set
	 */
	public void setValue(double val){ this.value = val; }

	/** getValue fetches the value hold by pair 
	 * @return 	double representing value hold by pair 
	 */
	public double getValue() { return this.value; }

	/** toString returns colorful representation of Mypair*/
	public String toString(){ 
		String yellow = "\u001B[33m", green = "\u001B[32m", reset = "\u001B[0m";
		String lbracket = green+"["+reset, rbracket = green+"]"+reset;
		return lbracket + yellow + this.key+" "+this.value + reset + rbracket; 
	}

	/** equals checks if given object is the same as compared one 
	 * @param 	o object given for comparision
	 * @return 	boolean value singnalizing if objects are the same
	 */
	public boolean equals(Object o){ 
		if (o == this)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Mypair pair = (Mypair) o;
		return pair.key == this.key; 
	}
}

