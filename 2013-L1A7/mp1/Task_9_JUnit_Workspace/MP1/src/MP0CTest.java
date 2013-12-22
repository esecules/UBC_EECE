import static org.junit.Assert.*;


import org.junit.Test;

public class MP0CTest extends MP0C{
	@Test
	public void test() {
		//test boundary conditions
		singleTest(0,0);
    	singleTest(1,0);
    	singleTest(2,1);
    	singleTest(3,2);
    	//test a large range to see if each method agrees with the others
    	for (int input = 0; input < 10000; input = input + 50){
    		assertEquals(findPrimes(input,false),findPrimesQuickly(input,false));
    		assertEquals(findPrimesMoreQuickly(input,false),findPrimesQuickly(input,false));
    	}
	}
	
	public void singleTest(int input, int expect){
		assertEquals(findPrimesMoreQuickly(input,false),expect);
    	assertEquals(findPrimesQuickly(input,false),expect);
    	assertEquals(findPrimes(input,false),expect);
	}

}
