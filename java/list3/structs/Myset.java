package structs;

/** Myset is a virtual class representing set
 * @author Mateusz Obara
 */
public abstract class Myset {
	public abstract Mypair search(String k) throws Exception;
	public abstract void insert(Mypair p) throws Exception;
	public abstract double read(String k) throws Exception;
	public abstract void update(Mypair p) throws Exception;
	public abstract void empty();
	public abstract int size();
}
