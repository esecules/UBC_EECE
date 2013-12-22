/*
 * Implementation of a simple stack for HtmlTags.
 * You should implement this class.
 */

import java.util.ArrayList;
import java.util.EmptyStackException;

public class StackMP2 {
	// An ArrayList to hold HtmlTag objects.
	// Use this to implement StackMP2.
	private ArrayList<HtmlTag> stack_internal;
	
	/*
	 * Create an empty stack.
	 * 
	 * Requires: Nothing
	 * Effects: Creates a new stack for this instance of StackMP2
	 * 
	 * @param void
	 * @return void
	 */
	
	public StackMP2( ) {
		this.stack_internal = new ArrayList<HtmlTag>( );
	}
	
	/* 
	 * Push a tag onto the top of the stack.
	 * Requires: an HtmlTag type to push onto the top of the stack
	 * Effects: Takes the given HtmlTag and places it at the top of the stack
	 * Modifies: this instance of StackMP2
	 * 
	 * @param tag: an HtmlTag to add to the top of the stack
	 * @returns: void
	 */
	public void push( HtmlTag tag ) {
		this.stack_internal.add(tag);
	}
	
	/*
	 * Removes the tag at the top of the stack.
	 * Should throw an exception if the stack is empty.
	 * 
	 * Requires: Void
	 * Effects: Removes the top element from the stack
	 * Modifies: this instance of StackMP2
	 * 
	 * @param void
	 * @return: the tag removed from the stack
	 * @throws: EmptyStackException
	 */
	public HtmlTag pop( ) {
		if (this.stack_internal.size() == 0) {
			throw new EmptyStackException() ;
		}
		else {
			HtmlTag returnTag = (this.stack_internal.get(this.stack_internal.size() - 1));
			this.stack_internal.remove(this.stack_internal.size() - 1);
			return returnTag;
		}
	}
	
	/*
	 * Looks at the object at the top of the stack but does not actually remove the object. 
	 * Should throw an exception if the stack is empty.
	 * 
	 * Requires: void
	 * Effects: returns the top element in the stack without removing it
	 * 
	 * @param: void
	 * @return: the top element in the stack
	 * @throws: EmptyStackException
	 */
	public HtmlTag peek( )  {
		if (this.stack_internal.size() == 0) {
			throw new EmptyStackException() ;
		}
		else {
			return this.stack_internal.get(this.stack_internal.size()-1);
		}
	}
	
	/*
	 * Tests if the stack is empty.
	 * Returns true if the stack is empty; false otherwise.
	 * 
	 * Requires: void
	 * Effects: returns true if the stack is empty and false if it is not
	 * 
	 * @param: void
	 * @returns: true if empty and false otherwise
	 */
	public boolean isEmpty( ) {
		if (this.stack_internal.size() == 0) {
			return true;
		}
		else {
			return false;
		}
	}
}
