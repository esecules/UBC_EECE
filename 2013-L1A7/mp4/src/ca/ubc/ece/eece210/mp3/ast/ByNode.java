package ca.ubc.ece.eece210.mp3.ast;

import java.util.HashSet;
import java.util.Set;

import ca.ubc.ece.eece210.mp3.Album;
import ca.ubc.ece.eece210.mp3.Catalogue;
import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Genre;

public class ByNode extends ASTNode{
	
	public ByNode(Token token) {
		super(token);
	    }

	public Set<Element> interpret(Catalogue argument) {
		//System.out.println("\n\nlooking for albums by " + this.arguments);
    	Set<Element> s = new HashSet<Element>();
    	for( Element e : argument.getCat().getChildren() ){
    		//System.out.println("looking at " + e.getName());
    			s.addAll(traverse((Genre) e));
	    		}
    	return s;
    	}
    	
	
	private Set<Element> traverse (Genre g){
		Set<Element> s = new HashSet<Element>();
		for (Element e : g.getChildren()){
			//System.out.print("looking at " + e.getName());
			if (!e.hasChildren())
				//System.out.println(" by " + ((Album)e).performer  + " /// " + this.arguments);
			if (!e.hasChildren() && ((Album)e).performer.equals(this.arguments)){
    			s.add(e);
    			//System.out.println("found it!!");
			}
		
			else if (e.hasChildren()){
    			//System.out.println(" diving deeper");
    			this.traverse((Genre) e);
    		}
		}
		return s;
	}
}
