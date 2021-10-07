import structs.*;

class Test {
	public static void main(String[] args){
		Mypair a = new Mypair("a", 10);
		Mypair b = new Mypair("b", 11);
		Mypair c = new Mypair("c", 12);
		Mypair d = new Mypair("d", 13);
		Mypair e = new Mypair("e", 14);
		Mypair f = new Mypair("f", 15);

		Mypair[] testpairs = {a,b,c,d,e,f};

		Mypair aa = new Mypair("a", 999);
		Mypair cc = new Mypair("c", 456);
		Mypair ff = new Mypair("f", -999);
		Mypair gg = new Mypair("g", 0);
		Mypair d2 = new Mypair("d", 123);

		MysetTable mst1 = new MysetTable(10);
		int smallsize = 3;
		MysetTable mst2 = new MysetTable(smallsize);
		
		System.out.println(a.equals(aa));
		System.out.println(c.equals(c));
		System.out.println(d.equals(f));
		System.out.println("Testing MysetTable:\n");
		try {
			for (int i = 0; i < testpairs.length; i++)
				mst1.insert(testpairs[i]);
			System.out.println("insert few items into non-full MysetTable:"); System.out.println(mst1);
			System.out.println("size:\t"+mst1.size());

			System.out.println("insert an existing key:\t"); mst1.insert(d2);
			System.out.println(mst1);
			
			System.out.println("read an existing key:\t"+mst1.read("c"));
			//System.out.println("read a non existing key:\t"+mst1.read("zzz"));
			
			System.out.println("search an existing key:\t"+mst1.search("e"));
			//System.out.println("search a non existing key:\t"+mst1.read("zzz"));
			
			System.out.println("updating an existing key:"); mst1.update(ff);
			System.out.println(mst1.toString());

			System.out.println("updating a non existing key:"); mst1.update(gg);
			System.out.println(mst1.toString());

			System.out.println("Empty the MysetTable"); mst1.empty();
			System.out.println(mst1);
			System.out.println("size:\t"+mst1.size());
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		System.out.println("\n");
		try {
			System.out.println("testing with a full MysetTable");
			for(int i = 0; i < smallsize; i++)
				mst2.insert(testpairs[i]);
			System.out.println(mst2.toString());

			System.out.println("size:" +mst2.size() +"\tmaximum size:"+mst2.totalsize());

			System.out.println("search an existing key:\t"+mst2.search("c"));

			//System.out.println("inserting over limit"); mst2.insert(ff);

			System.out.println("updating existing key"); mst2.update(aa);
			System.out.println(mst2);

			//System.out.println("updating non existing key"); mst2.update(ff);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		try {
			System.out.println("testing with a full MysetTable");
			for(int i = 0; i < smallsize; i++)
				mst2.insert(testpairs[i]);
			System.out.println(mst2.toString());

			System.out.println("size:" +mst2.size() +"\tmaximum size:"+mst2.totalsize());

			System.out.println("search an existing key:\t"+mst2.search("c"));

			//System.out.println("inserting over limit"); mst2.insert(ff);

			System.out.println("updating existing key"); mst2.update(aa);
			System.out.println(mst2);

			//System.out.println("updating non existing key"); mst2.update(ff);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		System.out.println("\n");

		MysetDynamic msd = new MysetDynamic();
		try {
			System.out.println("testing a MysetDynamic of totalsize "+msd.totalsize());
			System.out.println(msd);
			System.out.println("adding few elements");
			msd.insert(a); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
			msd.insert(b); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());

			System.out.println("next insert should resize");
			msd.insert(c); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
			msd.insert(d); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
			msd.insert(d); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
			System.out.println("updating existing element");
			msd.update(cc); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
			System.out.println("updating non existing element - should resize");
			msd.update(ff); System.out.println(msd+" size:\t"+msd.size()+" totalsize:\t"+msd.totalsize());
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}



		System.out.print("\n");
	}
}
