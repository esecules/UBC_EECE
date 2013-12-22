package ca.ubc.ece.eece210.mp3.ast;

import java.util.Set;
import java.util.HashSet;

import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Catalogue;

/**
 * 
 * @author Sathish Gopalakrishnan
 *
 */

public class AndNode extends ASTNode {

    public AndNode(Token token) {
	super(token);
    }

    @Override
    public Set<Element> interpret(Catalogue argument) {
    	Set<Element> s1 = new HashSet<Element>();
    	Set<Element> s2 = new HashSet<Element>();
    	if (this instanceof AndNode){
    		s1.addAll(this.children.get(0).interpret(argument));
    		s2.addAll(this.children.get(1).interpret(argument));
    		s1.retainAll(s2);
    		return s1;
    	}
    	
	return null;
    }

}
