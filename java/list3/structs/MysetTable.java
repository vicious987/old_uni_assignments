package structs;
import java.util.Arrays;
 /** MysetTable is a structure based on arrays which holds only Mypair objects, with a set and final size
 * @author Mateusz Obara
 */
public class MysetTable extends Myset {
	protected Mypair[] data;
	protected int currentsize = 0;

	/**non argument constructor with size of structure set as 2*/
	public MysetTable(){
		this.data = new Mypair[2];
	}

	/** constructor with structure set as 2, if size less than 2 is given, it sets maximum size as 2
	 * @param 	size int defining maximum size of set
	 */
	public MysetTable(int size){
		size = (size < 2) ? 2 : size;
		this.data = new Mypair[size];
	}
	
	/** search returns Mypair if a Mypair with given String key exists. 
	 * @param 	k 	Mypair key as String 
	 * @return	Mypair that exists in this set 
	 * @throws	Exception when Mypair is not found
	 */
	public Mypair search(String k) throws Exception {
		for (int i = 0; i < this.currentsize; i++){
			if (data[i].key == k)
			//if (data[i].equals(k))
				return data[i];
			
		}
		throw new Exception("Item with key "+k+" not found.");
	}


	/** read returns double value of Mypair with given key, if a Mypair with given String key exists. 
	 * @param 	k 	Mypair key as String expected
	 * @return 	double value of Mypair with given key 	
	 * @throws	Exception when Mypair is not found
	 */
	public double read(String k) throws Exception {
		return this.search(k).getValue();
	}

	// inserts a pair with assumption that a pair with same key does not exist in structure
	protected void insertUnique(Mypair p) throws Exception {
			if (this.currentsize == this.data.length){
				throw new Exception("MysetTable at maximum size, can not add more.");
			} else {
				data[this.currentsize] = p;
				this.currentsize++;
			}
	}

	/** insert adds given Mypair into the structure
	 * @param 	p 	Mypair to add
	 * @throws 	Exception when totalsize limit exceeded or a Mypair with same key already exists
	 */
	public void insert(Mypair p) throws Exception {
		try {
			this.search(p.key);
			//throw new Exception("A pair associated with key "+p.key+" already exist.");	// TODO: ZAPYTAJ
		}  catch (Exception e) {
			this.insertUnique(p);
		}
	}

	/** update updates the value of Mypair in structure with same key as given Mypair,
	 * if no such key exists, a new one is added
	 * @param 	p 	Mypair with a key that is to be updated 
	 * @throws 	Exception when totalsize limit exceeded 
	 */
	public void update(Mypair p) throws Exception {
		try {
			this.search(p.key).setValue(p.getValue());
		} catch (Exception e) {
			this.insertUnique(p);
		}
	}

	/** empty removes all element from the structure
	 */
	public void empty(){
		Arrays.fill(this.data, null);
		this.currentsize = 0;
	}

	/** size returns current ammount of objects residing in structure 
	 * @return 	int representing current ammount of objects residing in structure
	 */
	public int size(){
		return this.currentsize;
	}

	/** totalsize returns maximum ammount of objects that structure could hold
	 * @return 	int representing maximum ammount of objects residing in structure
	 */
	public int totalsize(){
		return this.data.length;
	}

	/** toString returns colorful representation of MysetTable*/
	public String toString(){
		String red = "\u001B[31m", reset = "\u001B[0m";
		String t = red+"<"+reset;
		for(int i = 0; i < this.currentsize; i++)
			t += data[i].toString();
		return t+red+">"+reset;
	}
}
