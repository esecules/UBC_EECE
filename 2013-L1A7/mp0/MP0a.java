/**
 * @author Sathish Gopalakrishnan
 *
 */

/*
 *   Description: Prints the number n then if it is even devides it by 2 or if it is odd it makes it even
 *                by multiplying it by 3 then adding 1. It does this until the number n is 1 or less.
 */
 


public class MP0a {
	static public void main( String[] args ) {
		int n = 1001;
		seqGen(n);
		longSeq(1,2001);
		highNum(1,2001);
		recursiveSeqGen(n);
	}
    static public void seqGen(int n){
		if ( n < 1 ) {
			System.out.println( "Incorrect input. Terminating program." );
			return;
		}
		
		while ( n > 1 ) {
			System.out.print( n + " ");
			if ( n%2 == 0 ) {
				n = n/2;
			}
			else {
				n = 3*n + 1;
			}
		}
		
		System.out.println( n );
    }
    static public void longSeq(int lowerBound, int upperBound){
	int seed = lowerBound;
	int count;
	int highCountSeed = 0;
	int highCount = 0;
	int n;
	while(seed <= upperBound){
    	
	n = seed;
	count = 0;
	    	if ( n < 1 ) {
			System.out.println( "Incorrect input. Terminating program." );
			return;
		}
		
		while ( n > 1 ) {
		    

			if ( n%2 == 0 ) {
				n = n/2;
			}
			else {
				n = 3*n + 1;
			}
			count = count + 1;
		}
		
		count = count + 1;
		if (count > highCount){
		    highCount = count;
		    highCountSeed = seed;
		}
		seed = seed + 1;	
	}
	System.out.println("\nseed with longest string from seed " + lowerBound + " to " + upperBound +": " + highCountSeed + "\n" );

    }
    static public void highNum(int lowerBound, int upperBound){
	int seed = lowerBound;
	int highNum = 0;
	int n;
	while(seed <= upperBound){
    	
	n = seed;

	    	if ( n < 1 ) {
			System.out.println( "Incorrect input. Terminating program." );
			return;
		}
		
		while ( n > 1 ) {
		    

			if ( n%2 == 0 ) {
				n = n/2;
			}
			else {
				n = 3*n + 1;
			}
			if(n > highNum){
			    highNum = n;
			} 
		}
		
		seed = seed + 1;
	}
	System.out.println("\nlargest number in any string from " + lowerBound + " to " + upperBound +": " + highNum + "\n" );

    }
    //recursivly produce the pattern
    static public void recursiveSeqGen(int n){
		if ( n < 1 ) {
		    System.out.println( "Incorrect input. Terminating program." );
		    return;
		}
		
	
		if(n == 1){
		    System.out.println(n);
		}
		else{   
			System.out.print( n + " ");
			if ( n%2 == 0 ) {
			    recursiveSeqGen( n/2 );
			}
			else {
			    recursiveSeqGen( 3*n + 1 );
			}
		}   

		    
		
		
    }
}
