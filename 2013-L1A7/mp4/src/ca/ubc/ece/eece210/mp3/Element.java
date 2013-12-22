package ca.ubc.ece.eece210.mp3;

import java.util.ArrayList;
import java.util.List;

/**
 * An abstract class to represent an entity in the catalogue. The element (in this
 * implementation) can either be an album or a genre.
 * 
 * @author Sathish Gopalakrishnan
 * 
 */
public abstract class Element {
	private List<Element> children = new ArrayList<Element>();
	String name;
	/**
	 * Returns all the children of this entity. They can be albums or
	 * genres. In this particular application, only genres can have
	 * children. Therefore, this method will return the albums or genres
	 * contained in this genre.
	 * 
	 * @return the children
	 */
	public List<Element> getChildren() {
		return children;
		
	}
	
	

	/**
	 * Adds a child to this entity. Basically, it is adding an album or genre
	 * to an existing genre
	 * 
	 * @param b
	 *            the entity to be added.
	 */
	protected void addChild(Element b) {
		if (this.hasChildren()){
			if(!children.contains(b)){
				children.add(b);
			}
			
			else
				throw new IllegalArgumentException("child already in set!");	
		}
		else
			throw new IllegalArgumentException("this element cannot have children");
	}
	/**
	 * Removes all children c from the instance of the Element
	 * if the element is not found. Because addChild checks if the Element is already
	 * contained in children, we only have to remove one instance of the Element.
	 * @param c
	 */
	protected void removeChild(Element c){
		if (this.hasChildren()){
			if (children.contains(c)){
				children.remove(c);
			}
			else{
				throw new IllegalArgumentException("child not found!");
			}
		}
		else{
			throw new IllegalArgumentException("this element cannot have children");
		}
	}

	/**
	 * Abstract method to determine if a given entity can (or cannot) contain
	 * any children.
	 * 
	 * @return true if the entity can contain children, or false otherwise.
	 */
	public String getName(){
		return this.name;
	}
	public abstract boolean hasChildren();
		
		
	
}