package Algorithms;

/*
interface Dict <T extends Comparable<T>>{
	boolean search(T data);
	void insert(T data);
	int size();
	T max() throws Exception;
	T min() throws Exception;
	void remove(T key);
	void clear();
	String toString();
}
*/

public class Bst <T extends Comparable<T>> implements Dict<T> {
	private class Node <T extends Comparable<T>> {
		Node<T> left, right, parent;
		T data;

		Node(T data) { this.data = data; }

		Node(T data, Node<T> parent) {
			this.data = data;
			this.parent = parent;
		}

		boolean isLeaf(){ return this.left == null && this.right == null; }
		
		boolean isSingleParent() { 
			return (this.left == null && this.right != null) || (this.left != null && this.right == null); 
		}

		Node<T> getSingleChild(){ return this.left != null ? this.left : this.right; }

		//wskazuje na prawego lub lewego syna po porownaniu klucza
		Node<T> nextnode(Node<T> node){
			assert(node != null);
			return this.data.compareTo(node.data) > 0 ? this.left : this.right;//!!! porownanie do 0 jest niewygodne
		}

		void insert(Node<T> n){
			assert(root != null);
			if (n == null)
				throw new NullPointerException();
			if(this.data.compareTo(n.data) > 0){
				if (this.left == null) {
					n.parent = this;
					this.left = n;
				} else
					this.left.insert(n);
			} else {
				if (this.right == null) {
					n.parent = this;
					this.right = n;
				} else
					this.right.insert(n);
			}
		}
		//void insert(T newdata) { insert(new Node<T>(newdata)); }

		boolean equals(Node<T> n){ return this.data.equals(n.data); }
		boolean equals(T data){ return this.data.equals(data); }


		Node<T> searchAndGet(Node<T> n){
			if (this.equals(n))
				return this;
			Node<T> next = nextnode(n);
			return next == null ? null : next.searchAndGet(n);
		} 

		boolean search(Node<T> n){
			return searchAndGet(n) != null;
		}

		// lepsze rozwiązanie : jedna funkcja usefulsearch poszukująca node'a, zwracająca parę <boolean, node>
		// oraz funkcje search - zwracająca pierwszą wartość z wezwania usefulsearch
		// i funkcje searchAndGet - zwracającą drugą wartość z pary.

		int size(){
			int l = this.left == null ? 0 : this.left.size();
			int r = this.right == null ? 0 : this.right.size();
			return l + 1 + r;
		}

		Node<T> minNode(){return this.left == null ? this : this.left.minNode(); }

		T minData(){return minNode().data; }

		Node<T> maxNode(){return this.right == null ? this : this.right.maxNode(); }

		T maxData(){return maxNode().data; }

		// void i exception czy boolean?
		// void i exception : wiecej info
		// boolean : ~akceptowalny efekt funkcji?
		void remove(Node<T> n){
			Node<T> child, mom, toRemoveNode, appendPoint;
			if ((toRemoveNode = searchAndGet(n)) == null)
				return ;// nie rob nic czy rzuć wyjątkiem?
			mom = toRemoveNode.parent;
			if (toRemoveNode.isLeaf()) {
				if (mom.left == toRemoveNode)
					mom.left = null;
				else 
					mom.right = null;
			} else if (toRemoveNode.isSingleParent()){
					mom.right = toRemoveNode.getSingleChild();
			} else { // has both children
				if (mom.left == toRemoveNode) {
					mom.left = toRemoveNode.right;			//'replace' removed with it's right subtree
					appendPoint = mom.left.minNode();		//search where should we append left subtree
					appendPoint.left = toRemoveNode.left;	//append left subtree to right subtree
					toRemoveNode.left.parent = appendPoint;	//fix parent
				} else {
					mom.right = toRemoveNode.right;
					appendPoint = mom.left.minNode();
					appendPoint.left = toRemoveNode.left;
					toRemoveNode.left.parent = appendPoint;
				}
			}
			toRemoveNode.parent = null;
		}

		//void remove(T data){ remove(new Node<T>(data)); }
		public String toString(){ return "( " + this.data + " )"; }

		void preorder(StringBuilder sb){
			sb.append(this.toString());
			if (this.left != null)
				this.left.preorder(sb);
			if (this.right != null)
				this.right.preorder(sb);
		}
	}

	private Node<T> root;

	public Bst(T data){ this.root = new Node<T>(data); }

	public boolean isEmpty() { return this.root == null; }

	public void insert(T newdata){  
		if(isEmpty())
			this.root = new Node<T>(newdata);
		else 
			this.root.insert(new Node<T>(newdata));
	}

	public boolean search(T data) { return this.isEmpty() ? false : root.search(new Node<T>(data)); }

	public int size(){ return this.isEmpty() ? 0 : this.root.size(); }

	public T min() throws Exception {
		if (this.isEmpty())
			throw new Exception("Min on empty Bst is an illegal action.");
		else
			return this.root.minData();
	}

	public T max() throws Exception {
		if (this.isEmpty())
			throw new Exception("Max on empty Bst is an illegal action.");
		else
			return this.root.maxData();
	}

	public void clear(){ root = null; }

	public void remove(T data){ 
		this.root.remove(new Node<T>(data));
	}

	public String toString(){
		if (isEmpty())
			return "{}";
		else {
			StringBuilder sbuilder = new StringBuilder("{ ");
			this.root.preorder(sbuilder);
			sbuilder.append(" }");
			return sbuilder.toString();
		}
	}

}
