package ca.ubc.ece.eece210.mp3;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Container class for all the albums and genres. Its main 
 * responsibility is to save and restore the collection from a file.
 * 
 * @author Sathish Gopalakrishnan
 * 
 */
public final class Catalogue{
	private Genre MASTER = new Genre("");
	/**
	 * Builds a new, empty catalogue.
	 */
	public Catalogue() {
		MASTER.name = "MASTER";
		
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
		MASTER = Genre.restoreCollection(stringRep);
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
		out.print(MASTER.getStringRepresentation());
		//System.out.println(MASTER.getStringRepresentation());
		out.close();
	}
	/**
	 * Adds a given Genre to a catalogue
	 * @param G a Genre
	 */
	public void addToCat(Genre G){
		MASTER.addToGenre(G);
	}
	/**
	 * Removes a Genre from a catalogue
	 * @param G
	 */
	public void removeFromCat(Genre G){
		MASTER.removeFromGenre(G);
	}
	/**
	 * Tests Catalogue equality by producing a string representation for each and comparing those
	 * @param C
	 * @return Whether the catalogues are equal.
	 */
	public boolean equals(Catalogue C){
		return this.MASTER.getStringRepresentation().equals( C.MASTER.getStringRepresentation());
	}
}