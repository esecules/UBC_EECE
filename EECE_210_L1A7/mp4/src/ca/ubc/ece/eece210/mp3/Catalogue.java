package ca.ubc.ece.eece210.mp3;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import ca.ubc.ece.eece210.mp3.ast.ASTNode;
import ca.ubc.ece.eece210.mp3.ast.QueryParser;
import ca.ubc.ece.eece210.mp3.ast.QueryTokenizer;
import ca.ubc.ece.eece210.mp3.ast.Token;

/**
 * Container class for all the albums and genres. Its main 
 * responsibility is to save and restore the collection from a file.
 * 
 * @author Sathish Gopalakrishnan
 * 
 */
public final class Catalogue{
	private Genre ROOT = new Genre("");
	/**
	 * Builds a new, empty catalogue.
	 */
	public Catalogue() {
		ROOT.name = "ROOT";
		
	}
	
	/**
	 * Builds a new catalogue and restores its contents from the 
	 * given file.
	 * 
	 * @param fileName
	 *            the file from where to restore the library.
	 */
	public Catalogue(String fileName) {
		String stringRep = null;
		try {
			stringRep = readFile(fileName);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		ROOT = Genre.restoreCollection(stringRep);
	}
	String readFile(String fileName) throws IOException {
	    BufferedReader br = new BufferedReader(new FileReader(fileName));
	    try {
	        StringBuilder sb = new StringBuilder();
	        String line = br.readLine();

	        while (line != null) {
	            sb.append(line);
	            sb.append("\n");
	            line = br.readLine();
	        }
	        return sb.toString();
	    } finally {
	        br.close();
	    }
	}
	/**
	 * Saved the contents of the catalogue to the given file.
	 * @param fileName the file where to save the library
	 */
	public void saveCatalogueToFile(String fileName) {
		PrintWriter out = null;
		try {
			out = new PrintWriter(fileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		out.print(ROOT.getStringRepresentation());
		//System.out.println(ROOT.getStringRepresentation());
		out.close();
	}
	/**
	 * Adds a given Genre to a catalogue
	 * @param e a Genre
	 */
	public void addToCat(Element e){
		ROOT.addToGenre(e);
	}
	/**
	 * Removes a Genre from a catalogue
	 * @param G
	 */
	public void removeFromCat(Genre G){
		ROOT.removeFromGenre(G);
	}
	/**
	 * Tests Catalogue equality by producing a string representation for each and comparing those
	 * @param C
	 * @return Whether the catalogues are equal.
	 */
	public boolean equals(Catalogue C){
		return this.ROOT.getStringRepresentation().equals( C.ROOT.getStringRepresentation());
	}
	public Genre getCat(){
		return ROOT;
	}
	public List<Album> queryCat( String query ){
		List<Token> tokens = QueryTokenizer.tokenizeInput(query);
		QueryParser parser = new QueryParser(tokens);
		ASTNode rootNode = parser.getRoot();
		List<Album> matches = new ArrayList<Album>();
		//for (Token t : tokens){
		//	System.out.println(t.toString());
		//}
		//System.out.println(rootNode.toString());
		Set<Element> s = rootNode.interpret(this);
		for (Element e : s){
			if (!e.hasChildren())
				matches.add((Album) e);
		}
		
		return matches;
	}
}