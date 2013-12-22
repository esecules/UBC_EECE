import java.util.ArrayList;

public class MP0c {

   
/**
* Find all prime numbers up to a limit.
*
* @param n
* Largest number to search
* @param printPrimes
* If true, print the primes found to output.
*
* @return number of primes <= n
* @effects If printPrimes is true, prints all primes <= n to output.
*/
    static int findPrimes(int n, boolean printPrimes) {
        boolean isPrime = true;
        int numPrimes = 0;

        for (int i = 2; i <= n; i++) {
            isPrime = true;

            for (int j = 2; j < i; j++) {
                if (i % j == 0) {
                    isPrime = false;
                    break;
                }
            }

            if (isPrime) {
                ++numPrimes;
                if (printPrimes) {
                    System.out.println(i);
                }
            }
        }
        return numPrimes;
    }

/**
* Find all prime numbers up to a limit.
*
* Improves on the original algorithm by limiting the number of values we
* have to check our number against --we only need to check up to the
* square root of the number.
*
* @param n
* Largest number to search
* @param printPrimes
* If true, print the primes found to output.
*
* @return number of primes <= n
* @effects If printPrimes is true, prints all primes <= n to output.
*/
    public static int findPrimesQuickly(int n, boolean printPrimes) {
	 boolean isPrime = true;
	 int numPrimes = 0;
	 double sqrt;
	 for (int i = 2; i <= n; i++) {
            isPrime = true;
	    sqrt = Math.sqrt(i);
	    for (int j = 2; j <= sqrt; j++) {
		if (i % j == 0) {
		    isPrime = false;
		    break;
		}
	    }

            if (isPrime) {
                ++numPrimes;
                if (printPrimes) {
                    System.out.println(i);
                }
            }
        }
        return numPrimes;
    }

    /**
* Find all prime numbers up to a limit.
*
* Improves on the faster algorithm by limiting the number of values we
* have to check our number against --we only need to check PRIMES up to the
* square root of the number.
*
* @param n
* Largest number to search
* @param printPrimes
* If true, print the primes found to output.
*
* @return number of primes <= n
* @effects If printPrimes is true, prints all primes <= n to output.
*/
    public static int findPrimesMoreQuickly(int n, boolean printPrimes) {
       	 boolean isPrime = true;
      	 ArrayList<Integer> primes = new ArrayList<Integer>();
	 double sqrt;
        for (int i = 2; i <= n; i++) {
            isPrime = true;
	    sqrt = Math.sqrt(i);
            for (int prime : primes) {
                if (i % prime == 0) {
                    isPrime = false;
                    break;
                }
		if(prime > sqrt){
		    break;
		}
            }

            if (isPrime) {
                primes.add(i);
                if (printPrimes) {
                    System.out.println(i);
                }
            }
        }
   
        return primes.size();
    }

    
    public static void main(String[] args) {
        int numPrimes;

        // Find and print all primes between 0 and 50.

        System.out.println("Running method findPrimes:");
        numPrimes = findPrimes(50, true);
        System.out.println(numPrimes + " primes <= 50");

        System.out.println("\nRunning method findPrimesQuickly:");
        numPrimes = findPrimesQuickly(50, true);
        System.out.println(numPrimes + " primes <= 50");

        System.out.println("\nRunning method findPrimesMoreQuickly:");
        numPrimes = findPrimesMoreQuickly(50, true);
        System.out.println(numPrimes + " primes <= 50");

        // Time how long it takes to find primes.

        long startTime = 0;
        long endTime = 0;

        System.out.print("\n\nTiming method findPrimes:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimes(40000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 40000");

        System.out.print("\nTiming method findPrimesFaster:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimesQuickly(40000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 40000");

        System.out.print("\nTiming method findPrimesEvenFaster:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimesMoreQuickly(40000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 40000");

        System.out.print("\n\nTiming method findPrimes:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimes(80000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 80000");

        System.out.print("\nTiming method findPrimesFaster:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimesQuickly(80000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 80000");

        System.out.print("\nTiming method findPrimesEvenFaster:");
        startTime = System.currentTimeMillis();
        numPrimes = findPrimesMoreQuickly(80000, false);
        endTime = System.currentTimeMillis();
        System.out.println(" " + (endTime - startTime) + " milliseconds");
        System.out.println(numPrimes + " primes <= 80000");
	
    }

}
