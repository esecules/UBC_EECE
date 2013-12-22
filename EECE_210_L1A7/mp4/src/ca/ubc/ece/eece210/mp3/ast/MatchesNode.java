package ca.ubc.ece.eece210.mp3.ast;

import java.util.Set;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import ca.ubc.ece.eece210.mp3.Album;
import ca.ubc.ece.eece210.mp3.Element;
import ca.ubc.ece.eece210.mp3.Catalogue;
import ca.ubc.ece.eece210.mp3.Genre;

public class MatchesNode extends ASTNode {

    public MatchesNode(Token token) {
	super(token);
    }

    @Override
    public Set<Element> interpret(Catalogue argument) {
    	Set<Element> match = new HashSet<Element>();
    	Set<Element> all = getAll(argument);
    	for (Element e : all){
    		//System.out.println("Looking at " + e.getName()+" "+((Album)e).getPerformer() + " looking for " + this.arguments  );
    		Pattern pat = Pattern.compile(".*"+this.arguments+".*");
			Matcher matchPat = pat.matcher(e.getName()+" "+((Album)e).getPerformer() + " " + ((Album)e).songlist);
			if(matchPat.matches()){
				//System.out.println("Found match!");
				match.add(e);
			}
    	}
	return match;
    }
    private Set<Element> getAll(Catalogue argument){
    	Set<Element> all = new HashSet<Element>();
    	for( Element e : argument.getCat().getChildren() ){
    		if(!e.hasChildren())
    			all.add(e);
    		else{
    			all.addAll(traverse((Genre) e));
    		}
    	}
    	return all;
    }
    private Set<Element> traverse(Genre g){
    	Set<Element> all = new HashSet<Element>();
    	for( Element e : g.getChildren() ){
    		if(!e.hasChildren())
    			all.add(e);
    		else{
    			all.addAll(traverse((Genre) e));
    		}
    	}
    	return all;
    }

}
