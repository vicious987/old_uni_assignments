package structs;
import java.util.Arrays;
 /** MysetDynamic is a structure based on arrays which holds only Mypair objects, with a flexible automatic reisizing
 * @author Mateusz Obara
 */
public class MysetDynamic extends MysetTable {
	private int growth = 2;

	public MysetDynamic(){
		super(2);
	}

	// inserts a pair with assumption that a pair with same key does not exist in structure
	@Override
	protected void insertUnique(Mypair p) {
		if (this.currentsize == this.data.length)
			this.data = Arrays.copyOf(this.data, this.data.length * 2);
		this.data[this.currentsize] = p;
		this.currentsize++;
	}

	/** insert adds given Mypair into the structure, if given Mypair is about to exceed structure size, structure is being resized to twice of its previous size (starting from 2)
	 * @param 	p 	Mypair to add
	 * @throws 	Exception when a Mypair with same key already exists
	 */

	@Override
	public void insert(Mypair p) throws Exception {
		try {
			this.search(p.key);
		} catch (Exception e) {
			this.insertUnique(p);
		}

	}
}
