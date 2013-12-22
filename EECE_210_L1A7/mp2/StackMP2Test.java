import static org.junit.Assert.*;

import java.util.EmptyStackException;

import org.junit.Test;


public class StackMP2Test {

	@Test
	public void pushPeekTest() {
		StackMP2 testStack = new StackMP2();
		StackMP2 emptyStack = new StackMP2();
		
		Boolean emptyFailed = false;
		HtmlTag garbage  = new HtmlTag("b");
		HtmlTag expect  = new HtmlTag("table");
		
		for(int i = 0; i < 9; i++){
			testStack.push(garbage);
		}
	
		testStack.push(expect);
		try{
			emptyStack.pop();
			}catch(EmptyStackException ex){
				emptyFailed=true;
			}
		
		assertTrue(emptyFailed);
		assertEquals(expect,testStack.peek());
	
	}
	@Test
	public void PushPopTest() {
		StackMP2 testStack = new StackMP2();
		StackMP2 emptyStack = new StackMP2();
	
		Boolean emptyFailed = false;
		HtmlTag garbage  = new HtmlTag("b");
		HtmlTag expect  = new HtmlTag("table");
		HtmlTag expect2 = new HtmlTag("i");
		for(int i = 0; i < 9; i++){
			testStack.push(garbage);
		}
		testStack.push(expect2);
		testStack.push(expect);
		try{
		emptyStack.pop();
		}catch(EmptyStackException ex){
			emptyFailed=true;
		}
		assertTrue(emptyFailed);
		assertEquals(expect,testStack.pop());
		assertEquals(expect2,testStack.peek());
	}

	@Test
	public void testEmpty(){
		StackMP2 emptyStack = new StackMP2();
		assertEquals(emptyStack.isEmpty(),true);
		
		StackMP2 smallStack = new StackMP2();
		HtmlTag tag  = new HtmlTag("b");
		smallStack.push(tag);
		assertEquals(smallStack.isEmpty(),false);
		
		StackMP2 largeStack = new StackMP2();
		for(int i = 0; i < 9; i++){
			largeStack.push(tag);
		}
		assertEquals(largeStack.isEmpty(),false);
	}
}
