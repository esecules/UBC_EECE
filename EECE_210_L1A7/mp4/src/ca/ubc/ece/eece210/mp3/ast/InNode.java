package ca.ubc.ece.eece210.mp3.ast;

import java.util.HashSet;
import java.util.Set;

import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Catalogue;
import ca.ubc.ece.eece210.mp3.Genre;


public class InNode extends ASTNode {
	private static boolean foundGenre = false;
    public InNode(Token token) {
	super(token);
    }

    @Override
    public Set<Element> interpret(Catalogue argument) {
    	//System.out.println("\n\nlooking for albums in " + this.arguments);
    	Set<Element> s = new HashSet<Element>();
    	for( Element e : argument.getCat().getChildren() ){
    		//System.out.println("interpreting " + e.getName() + " /// " + this.arguments);
	    	if(!foundGenre){
    			if (e.hasChildren() && e.getName().equals(this.arguments)){
	    			setFoundGenre(true);
	    			//System.out.println("found it!!");
	    			s.addAll(traverse((Genre) e));
	    			setFoundGenre(false);
	    		}
	    	}
	    	else{
	    		if(!e.hasChildren()){
	    			//System.out.println("adding " + e.getName());
	    			s.add(e);
	    			//System.out.println(s.size());
	    		}
	    		else{
	    			//System.out.println("adding albums in " + e.getName());
	    			s.addAll(traverse((Genre) e));
	    			//System.out.println(s.size());
	    		}
	    	}
	    }
    	
    	//System.out.println(s.size());
    	return s;
    	
    }
    private Set<Element> traverse(Genre g){
    	Set<Element> s = new HashSet<Element>();
    	for( Element e : g.getChildren() ){
    		//System.out.println("looking at " + e.getName() + " /// " + this.arguments);
	    	if(!foundGenre){
    			if (e.hasChildren() && e.getName().equals(this.arguments)){
	    			setFoundGenre(true);
	    			//System.out.println("found it!!");
	    			s.addAll(traverse((Genre) e));
	    			//setFoundGenre(false);
    			}
	    	}
	    	else{
	    		if(!e.hasChildren()){
	    			//System.out.println("adding " + e.getName());
	    			s.add(e);
	    			//System.out.println(s.size());
	    		}
	    		else{
	    			//System.out.println("adding albums in " + e.getName());
	    			s.addAll(traverse((Genre) e));
	    			//System.out.println(s.size());
	    		}
	    		
	    	}
    	}
    	return s;
    }

	public static boolean getFoundGenre() {
		return foundGenre;
	}

	public static void setFoundGenre(boolean foundGenre) {
		InNode.foundGenre = foundGenre;
	}

}
