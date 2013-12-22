package ca.ubc.ece.eece210.mp3;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Represents a genre (or collection of albums/genres).
 * 
 * @author Sathish Gopalakrishnan
 * 
 */
public final class Genre extends Element {
	

	/**
	 * Creates a new genre with the given name.
	 * 
	 * @param name
	 *            the name of the genre.
	 */
	public Genre(String name) {
		this.name = name;
	}

	/**
	 * Restores a genre from its given string representation.
	 * 
	 * @param stringRepresentation
	 */
	public static Genre restoreCollection(String stringRepresentation) {
		String[] lines;
		lines = stringRepresentation.split("\n");
		return restoreCollectionRecursive(lines,0,0);
	}
	private static Genre restoreCollectionRecursive(String[] lines, int index, int layer){
		Genre internalGenre = new Genre("internal");
		internalGenre.name = null;
		Boolean inSubGenre = false;
		int layersDeep = layer;
		int numLines = lines.length;
			for (int i= index; i < numLines; i++){
				String line = lines[i];
				//String genreStr = matcher.group(1);
				//System.out.println("found genre head \n"+ genreStr );
				Pattern GenreStart = Pattern.compile("<!!sub genre!!>");
				Matcher MatchGenreStart = GenreStart.matcher(line);
				Pattern GenreEnd = Pattern.compile("<!!end sub genre!!>");
				Matcher MatchGenreEnd = GenreEnd.matcher(line);
				Pattern Gname = Pattern.compile("<!!genre name!!>(.*)<!!end genre name!!>");
				Matcher MatchGname = Gname.matcher(line);
				Pattern Album = Pattern.compile("<!!album!!>(.*)<!!end album!!>");
				Matcher MatchAlbum = Album.matcher(line);
				Pattern End = Pattern.compile("<!!END!!>");
				Matcher MatchEnd = End.matcher(line);
				//System.out.println("looking at  " + line );
			//	System.out.println("\n in subgenre? "+ inSubGenre + " Match End Genre? "+MatchGenreEnd.find());
				//MatchGenreEnd.reset();
				if(MatchGname.find() && !inSubGenre){
					internalGenre.name = MatchGname.group(1);
					//System.out.println("found genre's name " + internalGenre.name );
				}
				if(MatchAlbum.find() && !inSubGenre){
					Album tempAlbum = new Album(MatchAlbum.group(1));
					internalGenre.addToGenre(tempAlbum);
					//System.out.println("added album " + tempAlbum.name);
				}
				if(MatchGenreStart.find()){
					layersDeep ++;
					if (!inSubGenre){
					    //System.out.println("now at " + layersDeep + " layer(s) deep");
					    internalGenre.addToGenre(restoreCollectionRecursive(lines,i+1, layersDeep));
					}
					inSubGenre = true;
				}
				if(MatchGenreEnd.find() && inSubGenre){
					layersDeep --;
					//System.out.println("now at " + layersDeep + " layer(s) deep");
					
				}
				MatchGenreEnd.reset();
				if((MatchGenreEnd.find() || MatchEnd.find()) && !inSubGenre){
					//System.out.println("returning genre " + internalGenre.name);
					if(internalGenre.name == null)
						throw new IllegalArgumentException("could not find the genre's name!");
					
					else
						return internalGenre;
				}
				if(layersDeep == layer){
					inSubGenre = false;	
				}
				
				
		}
			
			throw new IllegalArgumentException("could not find the end genre tag");
			
			
			
		
	}


	/**
	 * Returns the string representation of a genre
	 * 
	 * @return the name of the album as a string representation
	 */
	public String getStringRepresentation(){
		return this.getStringRepresentationR() + "\n<!!END!!>";
	}
	private String getStringRepresentationR() {
		List<Element> children = new ArrayList<Element>();
		List<String> ChildStrings = new ArrayList<String>();
		children = this.getChildren();
		
		for( Element child : children){
			if(child.hasChildren()){
				//System.out.println(child.name + " has Children");
				ChildStrings.add("\n<!!sub genre!!>"+((Genre) child).getStringRepresentationR()+"\n<!!end sub genre!!>");
				
			}
			else{
				//System.out.println(child.name + " has NO Children");
				ChildStrings.add("\n<!!album!!>"+((Album) child).getStringRepresentation()+"<!!end album!!>");
			}
		}
		return "\n<!!genre name!!>"+name +"<!!end genre name!!>"+ ChildStrings ;
	}

	/**
	 * Adds the given album or genre to this genre
	 * will handle exception in trying to add a child that 
	 * is already present in the set by printing the message to 
	 * the console
	 * @param b the element to be added to the collection.
	 */
	public void addToGenre(Element b) {
		try{
			//System.out.println("adding child " + b.name + " to " + this.name);
			if (this.name == b.name)
				throw new IllegalArgumentException("Can't add a genre to itself");	
			for (String line : this.getAllChildren()){
				if (line.matches(".*"+b.name+".*")){
					throw new IllegalArgumentException("Recursive hierarchy not allowed");
				}
			}
			this.addChild(b);
		}catch(IllegalArgumentException e){
			throw new IllegalArgumentException( e.getMessage() );
		}
	}
	/**
	 * Removes the specified child from the genre
	 * will handle exception in trying to remove a child not
	 * contained in the set of children by printing a message 
	 * to the console
	 * @param c a child Element of the genre
	 */
	public void removeFromGenre( Element c){
		try{
			removeChild(c);
		}catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
		}
	}
	/**
	 * Caller method for the recursive method getAllChildrenR 
	 * @return an array list of all the children grand children and so of this genre 
	 */
public ArrayList<String> getAllChildren(){ 
	return getAllChildrenR(this,1);
}
/**
 * 
 * @param E the element whose children we need to find
 * @param generation the the current generation in the hierarchy
 * @return
 */
private ArrayList<String> getAllChildrenR( Element E, int generation) {
	ArrayList<String> List = new ArrayList<String>();
	if( E.hasChildren() ) {
		for( Element child : E.getChildren() ) {
			Genre myGenre = new Genre(child.name);
			List.add( myGenre.name + " " + generation + getAllChildrenR( myGenre, generation + 1));
		}
	}
	else 
		List.add(((Album)E).name + " " + ((Album)E).performer + " " + ((Album)E).songlist ); //use type casting

	
	return List;
}
	/**
	 * Returns true, since a genre can contain other albums and/or
	 * genres.
	 */
	@Override
	public boolean hasChildren() {
		return true;
	}
}