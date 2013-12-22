import static org.junit.Assert.*;

import java.util.ArrayDeque;
import java.util.Queue;
import java.util.Scanner;

import org.junit.Test;


public class HtmlValidatorTest {

	@Test
	public void addTagTest() {
		HtmlValidator TestValidator = new HtmlValidator();
		HtmlTag boldTag = new HtmlTag("b");
		HtmlTag tableTag = new HtmlTag("table");
		HtmlTag iTag = new HtmlTag("i");
		Queue<HtmlTag> tags = new ArrayDeque<HtmlTag>();
		boolean addFail =false;		
		
		//add tags to a validator then move them to a Queue using Validator method getTags()
		TestValidator.addTag(tableTag);
		TestValidator.addTag(boldTag);
		TestValidator.addTag(iTag);
		tags = TestValidator.getTags();
		
		//Remove tags in first in last out order (as a queue should work)
		assertEquals(tableTag,tags.remove());			
		assertEquals(boldTag,tags.remove());
		assertEquals(iTag,tags.remove());
			
		try{
			TestValidator.addTag(null);
		}catch(IllegalArgumentException e){
			addFail = true;	
		}
		assertTrue(addFail);
	}
	@Test
	public void getQueueTest(){
		HtmlValidator TestValidator = new HtmlValidator();
		HtmlValidator EmptyValidator = new HtmlValidator();
		HtmlTag boldTag = new HtmlTag("b");
		HtmlTag tableTag = new HtmlTag("table");
		HtmlTag iTag = new HtmlTag("i");
		ArrayDeque<HtmlTag> tags = new ArrayDeque<HtmlTag>();
		ArrayDeque<HtmlTag> empty = new ArrayDeque<HtmlTag>();
		for (int i = 0; i < 10; i++){
			TestValidator.addTag(tableTag);
			TestValidator.addTag(boldTag);
			TestValidator.addTag(iTag);
		}
		
		tags = TestValidator.getTags();
		
		for (int i = 0; i < 10; i++){
			assertEquals(tableTag,tags.poll());			
			assertEquals(boldTag,tags.poll());
			assertEquals(iTag,tags.poll());
		}
		for (int i = 0; i < 10; i++){
			TestValidator.addTag(tableTag);
			TestValidator.addTag(boldTag);
			TestValidator.addTag(iTag);
		}
		TestValidator.removeAll("table");
		tags = TestValidator.getTags();
		
		for (int i = 0; i < 10; i++){	
			assertEquals(boldTag,tags.poll());
			assertEquals(iTag,tags.poll());
		}
		empty = EmptyValidator.getTags();
		assertTrue(empty.isEmpty());
	}
	@Test
	public void removeAllTest(){
		HtmlValidator TestValidator = new HtmlValidator();
		HtmlTag boldTag = new HtmlTag("b");
		HtmlTag tableTag = new HtmlTag("table");
		HtmlTag iTag = new HtmlTag("i");
		HtmlTag closeboldTag = new HtmlTag("b",false);
		HtmlTag closetableTag = new HtmlTag("table",false);
		HtmlTag closeiTag = new HtmlTag("i",false);
		Queue<HtmlTag> tags = new ArrayDeque<HtmlTag>();
		boolean removeFailed = false;
		
		//populate the validator with tags
		for (int i = 0; i < 10; i++){
			TestValidator.addTag(tableTag);
			TestValidator.addTag(boldTag);
			TestValidator.addTag(iTag);
			TestValidator.addTag(closeiTag);
			TestValidator.addTag(closeboldTag);
			TestValidator.addTag(closetableTag);
		}
		
		//try to remove an element not in the validator queue
		TestValidator.removeAll("not in queue");
		tags = TestValidator.getTags();
	
		//test to see that each tag put in is still there (the queue is erased as a result)
		for (int i = 0; i < 10; i++){
			assertEquals(tableTag,tags.poll());			
			assertEquals(boldTag,tags.poll());
			assertEquals(iTag,tags.poll());
			assertEquals(closeiTag,tags.poll());			
			assertEquals(closeboldTag,tags.poll());
			assertEquals(closetableTag,tags.poll());
		}
		//repopulate the validator queue for next test case
		for (int i = 0; i < 10; i++){
			TestValidator.addTag(tableTag);
			TestValidator.addTag(boldTag);
			TestValidator.addTag(iTag);
			TestValidator.addTag(closeiTag);
			TestValidator.addTag(closeboldTag);
			TestValidator.addTag(closetableTag);
		}
		//try to remove an element in the validator queue
		TestValidator.removeAll("table");
		tags = TestValidator.getTags();

		//expect to see that both the open and close tags were removed.
		for (int i = 0; i < 10; i++){	
			assertEquals(boldTag,tags.poll());
			assertEquals(iTag,tags.poll());
			assertEquals(closeiTag,tags.poll());			
			assertEquals(closeboldTag,tags.poll());
		}
		//repopulate the queue 
		for (int i = 0; i < 10; i++){
			TestValidator.addTag(boldTag);
			TestValidator.addTag(iTag);
			TestValidator.addTag(closeiTag);
			TestValidator.addTag(closeboldTag);
		}
		//try to remove an element in the validator queue
		TestValidator.removeAll("b");
		tags = TestValidator.getTags();
		//expect to see that both the open and close tags were removed.
		for (int i = 0; i < 10; i++){ 
			assertEquals(iTag,tags.poll()); 
			assertEquals(closeiTag,tags.poll());
		}
		//try to remove a null element
		try{ TestValidator.removeAll(null);
		}catch(IllegalArgumentException e){ removeFailed = true; }
		
		//should catch the IllegalArgumentError
		assertTrue(removeFailed);
	}
	//
	@Test
	public void validatorTest(){
		Scanner console = new Scanner(System.in);
		Queue<HtmlTag> tags;
		tags = new ArrayDeque<HtmlTag>();
		HtmlTag boldTag = new HtmlTag("b",true);
		HtmlTag tableTag = new HtmlTag("table",true);
		HtmlTag iTag = new HtmlTag("i",true);
		HtmlTag closeboldTag = new HtmlTag("b",false);
		HtmlTag closetableTag = new HtmlTag("table",false);
		HtmlTag closeiTag = new HtmlTag("i",false);
		
		//tags in order
		tags.add(tableTag);
		tags.add(tableTag);
		tags.add(boldTag);
		tags.add(iTag);
		tags.add(closeiTag);
		tags.add(closeboldTag);
		tags.add(closetableTag);
		tags.add(closetableTag);
		HtmlValidator TestValidator = new HtmlValidator(tags);
		
		//tags out of order and not closed
		TestValidator.addTag(tableTag);
		TestValidator.addTag(tableTag);
		TestValidator.addTag(iTag);
		TestValidator.addTag(boldTag);
		TestValidator.addTag(closeiTag);
		TestValidator.addTag(closeboldTag);
		TestValidator.addTag(closetableTag);
		
		//the validate method prints its output to the command line so the user should 
		//answer y or n if the output meets the criteria listed in the Expected Output statement.
		//this method can be tested more by using the ValidatorMain class.
		System.out.println("*****Tested output*****");
		TestValidator.validate();
		System.out.println("*****Expected output*****");
		System.out.println("Are there 2 unexpected tag ERRORS and 1 unclosed tag ERROR? \n"
							+ "There also should be several pairs of closed and open tags \n"
							+ "each on their own indentation level"
							+ "\n\n"
							+ "Have all these conditions been met? (y / n)");
		
		String response = console.nextLine().trim();
		assertEquals(response,"y");
	}
}
