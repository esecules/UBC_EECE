public class MP0b {

/**
* Find the first occurrence of x in an array a.
*
* @param x
* value to find
* @param a
* array with values to search from
* @return lowest i such that a[i]==x, or -1 if x not found in a.
*/
    public static int find(int x, int[] a) {
	int result;
	int 
	System.out.println("finding " + x);
	result = recursiveSearch(x,a,start);
	if (result >= 0){
	    System.out.print(x + " was found at position ");
	    return result;
	}
	else{
	    System.out.println("an error occured");
	    return result;
	}
    }

 
    private static int linearSearch(int x, int[] a) {
        // notice the use of the length field wrt the array a
        for (int i = 0; i < a.length; ++i) {
            if (x == a[i]) {
                return i;
            }
        }
        return -1;
    }

    public static void main ( String[] args ) {
        // create an array to search from
        // note the declaration of the array & the initialization
        int  index = 0;
	int[] a = new int[10000];
	int start =  0;
	int stop = 10000;
	    for (int i = start; i < stop; ++i){
		a[i] = i + 1;
	    }
        // call the search function
        System.out.println( find( 5999, a ) );
    }
    public static int recursiveSearch (int x, int[] a,int index) {
       // notice the use of the length field wrt the array a
       	int maxLen = a.length - 1;
	//System.out.println("searching at line " + index);
	if (x != a[index]){
	    index = index + 1;
	   return recursiveSearch(x,a,index);
	}
	if(index > maxLen){
	    System.out.println("Error," + x + " not found in array");
	    return -1;
	}
	if(x == a[index]){
	    return index;
	}
	return -6;
    }

				   
}
