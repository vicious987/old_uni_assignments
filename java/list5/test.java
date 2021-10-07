import Algorithms.*;
/*								Integer
	boolean search(T data);		v		
	void insert(T data);		v
	int size();					v
	T max() throws Exception;	v
	T min() throws Exception;	v
	void remove(T key);			v
	void clear();				v
	String toString();			v
*/

class Test{
	public static void main(String args[]){
		Bst<Integer> t1 = new Bst<Integer>(20);// = new Bst<Integer>(i1);
		t1.insert(10);
		t1.insert(30);
		t1.insert(50);
		t1.insert(5);
		t1.insert(15);
		

		System.out.println("insert, size, search, min, max test");
		System.out.println(t1.size());
		System.out.println(t1.search(2));
		System.out.println(t1.search(15));
		System.out.println(t1);
		try {
			System.out.println(t1.max());
			System.out.println(t1.min());
		} catch (Exception e){
			;
		}
		System.out.println("\n");
		System.out.println("remove test");

		t1.remove(50);
		
		//t1.remove(30);

		/*
		t1.insert(3);
		t1.insert(6);
		t1.insert(13);
		t1.insert(18);
		t1.remove(10);
		*/
		System.out.println(t1);

		System.out.println("\n");

		System.out.println("clear test");
		t1.clear();
		System.out.println(t1.size());
		System.out.println(t1);
	}
}
