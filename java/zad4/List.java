class Mylist 
{
	private Node head;
	private int list_count;

	public Mylist()
	{
		head = new Node(null);
		listCount = 0;
	}

	public void add(Object data)
	{
		Node temp = new Node(data);
		Node current = head;
		while (Current.getNext() != null)
		{
			Current = Current.getNext();
		}
		Current.setNext(temp);
		list_count++;
	}
}
