// TO-FIX : 7-9 ? |(PUT IN IN STATIC BLOCK?? BUT Y?)
//import Pair; // ???
//import Pair.*;
//package lista3;

public class Set_of_pair
{
	private final int default_array_length = 10;
	private final int size;
	private int size_used = 0;

	private Pair[] pair_array;

	
	public Set_of_pair(int n) 
	{
		this.size = n;
		pair_array = new Pair[n];
	}
	
	public Set_of_pair() 
	{
		this.size = default_array_length;
		pair_array = new Pair[default_array_length];
	}

	public boolean contains_key(String key) 
	{
		for(Pair element: pair_array)
			if (element.get_key() == key)
				return true;
		return false;
	}

	public void set_value_at(String key, double val) 
	{
		if (contains_key(key)) {
			for(Pair element: pair_array)
				if (element.get_key() == key)
					element.set_value(val);

		} else {
			throw new IllegalArgumentException("such key already exists");
		}

	}

	public void add(String key, double val) throws IllegalArgumentException 
	{
		if (size < size_used)
			throw new IllegalArgumentException("this Set_of_pair is full (try updating/removing an item)!");
		if (contains_key(key)) {
			throw new IllegalArgumentException("such key already exists");
		} else {
			for(Pair element: pair_array) { 
				if (element == null);
					element = new Pair(key,val);
			}
		}
	}

	public void update(String key, double val) 
	{
		if (contains_key(key))
			set_value_at(key, val);
		else
			add(key, val);
	}

	public Pair get_pair_at(String key) 
	{
		for(Pair element: pair_array)
			if (element.get_key() == key)
				return element;
		throw new IllegalArgumentException("such key does not exist");	
	}


	public double get_value_at(String key) throws IllegalArgumentException 
	{
		for(Pair element: pair_array)
			if (element.get_key() == key)
				return element.get_value();
		throw new IllegalArgumentException("such key does not exist");
	}


	public boolean contains_value(double val) 
	{
		for(Pair element: pair_array)
			if (element.get_value() == val)
				return true;
		return false;
	}

	public void remove_at(String key) throws IllegalArgumentException 
	{
		if(!contains_key(key))
			throw new IllegalArgumentException("such key does not exist!");
		for (int i = 0; i < size; i++) {
			if (pair_array[i].get_key() == key)
				pair_array[i] = null;
		}
	}
/*
	public void replace(String key_to_be_replaced, String key, double val) 
	{
		get_pair_at(key_to_be_replaced) = new Pair(key, val);
	}
*/

}
