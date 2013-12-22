package ca.ubc.ece.eece210.mp3.ast;

import java.util.Set;
import java.util.HashSet;

import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Catalogue;

public class OrNode extends ASTNode {

    public OrNode(Token token) {
	super(token);
    }

    @Override
    public Set<Element> interpret(Catalogue argument) {
    	Set<Element> s1 = new HashSet<Element>();
    	if (this instanceof OrNode){
    		s1.addAll(this.children.get(0).interpret(argument));
    		//System.out.println(s1);
    		s1.addAll(this.children.get(1).interpret(argument));
    		//System.out.println(s1);
    		return s1;
    	}
	return null;
    }

}
