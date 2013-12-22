package ca.ubc.ece.eece210.mp3.ast;

import java.util.HashSet;
import java.util.Set;

import ca.ubc.ece.eece210.mp3.Album;
import ca.ubc.ece.eece210.mp3.Catalogue;
import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Genre;

public class ReleaseNode extends ASTNode {
	public ReleaseNode(Token token) {
		super(token);
	    }

	public Set<Element> interpret(Catalogue argument) {
    	Set<Element> s = new HashSet<Element>();
    	for( Element e : argument.getCat().getChildren() ){
    			s.addAll(traverse((Genre) e));
	    		}
    	return s;
    	}
    	
	
	private Set<Element> traverse (Genre g){
		Set<Element> s = new HashSet<Element>();
		for (Element e : g.getChildren()){
		
			if (!e.hasChildren() && ((Album)e).getRelease() < Integer.parseInt(this.arguments) && ((Album)e).getRelease() > 0 && this.getText() == "before"){
    			s.add(e);
			}
			else if (!e.hasChildren() && ((Album)e).getRelease() > Integer.parseInt(this.arguments) && this.getText() == "after"){
    			s.add(e);
			}
			else if (e.hasChildren()){
				s.addAll(this.traverse((Genre) e));
    		}
		}
		return s;
	}
}
