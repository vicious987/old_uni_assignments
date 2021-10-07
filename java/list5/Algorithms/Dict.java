package Algorithms;

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

