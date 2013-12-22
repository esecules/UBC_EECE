import java.util.ArrayDeque;
import java.util.EmptyStackException;
import java.util.Queue;

/*
 * This is the HtmlValidator class.
 * You should implement this class.
 */
public class HtmlValidator {
		private ArrayDeque<HtmlTag> queue_internal;
		 
	public HtmlValidator() {
		this.queue_internal = new ArrayDeque<HtmlTag>();
	}
		 
	public HtmlValidator(Queue<HtmlTag> tags) {
		this.queue_internal = new ArrayDeque<HtmlTag>(tags);
	}
	
	// Add the given tag to the end of your validators queue.
	// If tag passed is null, throw IllegalArgumentException
	
	// Requires: A HtmlTag object
	// Effects: Adds a tag to queue_internal
	// Modifies: queue_internal to add a tag at the end of the queue.
	public void addTag(HtmlTag tag) {
		
		if( tag == null ) {
			throw new IllegalArgumentException ( "The tag is null!" );
		}
		else {
			this.queue_internal.add( tag );
		}
	}
	
	// Should return your validators queue of HTML tags
	// Queue contains all tags that were passed to constructor in their proper order
	// should also reflect any changes made. ex. adding tags with addTag or removing with removeAll
	public ArrayDeque<HtmlTag> getTags() {
		return queue_internal;
	}
	
	//Should remove any tags from validator's queue that match the given element.
	
	// Requires: A String element
	// Effects: Removes all elements in array that match element passed
	// Modifies: When finished queue_internal wont have the element passed anymore.
	public void removeAll( String element ) {
		//while array still contains the string element...
		try{HtmlTag opentag = new HtmlTag(element,true);
			HtmlTag closetag = new HtmlTag(element,false);
			//System.out.println("removing" + opentag +"and" +closetag);
			//System.out.println(this.queue_internal.contains(opentag));
			while ( this.queue_internal.contains(opentag) || this.queue_internal.contains(closetag)) {
				//System.out.println("enterd while loop");
				//System.out.println(this.queue_internal.peek());
				if( this.queue_internal.peek().equals(opentag) ) {
					//remove element
					//System.out.println("removing"+ opentag);
					this.queue_internal.remove();
				}
				else if(this.queue_internal.peek().equals(closetag)){
					//remove element
					this.queue_internal.remove();
					//System.out.println("removing"+ closetag);
				}
				else {
					//add element to the array since it isnt the element we want to remove
					this.queue_internal.add(this.queue_internal.poll());
					//System.out.println("emlement put at the back of the queue");
					
				}
			}
		}catch(NullPointerException e){
			throw new IllegalArgumentException("This tag is null!");
		}
	}
	
	//Print indented text representation of HTML tags in your queue. Display each tag on its own line.
	// Every open tag that requires a closing tag increases the level of indentation of following tags 
	// by four spaces until its closing tag is reached.
	
	//Requires: A queue of html tags
	//Effects: Prints a indented representation of the HTML tags in the queue
	//Modifies: When finished queue_internal will be empty.
	public void validate() { 
		int indent = 0;
		StackMP2 validateStack = new StackMP2();
		while(!queue_internal.isEmpty()){
			//catches opening tags and prints them to the console at the current indent level then incriments it by 4 spaces
			if(this.queue_internal.peek().isOpenTag() && !this.queue_internal.peek().isSelfClosing()){
				for(int i = 0; i < indent; i++){
					System.out.print(" ");
				}
				//removes the opening tag from the head of the queue and adds it to the top of the stack
				validateStack.push(this.queue_internal.poll());
				System.out.println(validateStack.peek());
				indent = indent + 4;
				}
			//Catches closing tags
			else if(!this.queue_internal.peek().isOpenTag()){
				//checks to see if they are closing the most recently opened tag ie. that they are valid.
				try{
					if(this.queue_internal.peek().matches((validateStack.peek()))){
						indent = indent - 4;
						for(int i = 0; i < indent; i++){
							System.out.print(" ");
						}
						//prints the closing tag and removes its opening tag from the stack 
						System.out.println(this.queue_internal.poll());
						validateStack.pop();
						
					}
					//prints an error if closed tags come out of order. and removes the misplaced tag from the stack
					else{
						System.out.println("ERROR unexpected tag: " + this.queue_internal.poll());
					}
				}catch(EmptyStackException e){System.out.println("ERROR unexpected tag: " + this.queue_internal.poll());}
			}
			//catches self closing tags -- they get printed to the console but don't get their own indent level
			else if(this.queue_internal.peek().isSelfClosing()){
				for(int i = 0; i < indent; i++){
					System.out.print(" ");
				}
				//since self closing tags don't need to be checked for a matching closing tag they need not be added to the stack.
				System.out.println(queue_internal.poll());
			}
			
			
			else{
				System.out.println("ERROR not recognized as a tag: " + this.queue_internal.poll());
			}
		}
		//This checks for any unclosed tags and prints them to the screen at the very end
		if(!validateStack.isEmpty()){
			while(!validateStack.isEmpty()){
				System.out.println("ERROR unclosed tag: " + validateStack.pop());  
			}
		}
	}
}
