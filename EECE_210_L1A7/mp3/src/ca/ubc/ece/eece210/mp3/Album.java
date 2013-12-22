package ca.ubc.ece.eece210.mp3;

import java.util.ArrayList;
import java.util.regex.*;



/**
 * 
 * @author Sathish Gopalakrishnan
 * 
 * This class contains the information needed to represent 
 * an album in our application.
 * 
 */

public final class Album extends Element {
	public final String performer;
	public final ArrayList<String> songlist;
	public Genre genre;
	
	/**
	 * Builds an album with the given title, performer and song list
	 * 
	 * @param title
	 *            the title of the album
	 * @param author
	 *            the performer 
	 * @param songlist
	 * 			  the list of songs in the album
	 */
	public Album(String title, String performer, ArrayList<String> songlist) {
		this.name = title;
		this.performer = performer;
		this.songlist = songlist;
	}

	/**
	 * Builds an album from the string representation of the object. It is used
	 * when restoring an album from a file.
	 * 
	 * @param stringRepresentation
	 *            the string representation
	 */
	public Album(String stringRepresentation) {
		ArrayList<String> internalSongList = new ArrayList<String>();
		String songs;
		Pattern albumName = Pattern.compile("<!!album name!!>(.*)<!!end album name!!>");
		Matcher MatchAlbumName = albumName.matcher(stringRepresentation);
		Pattern performer = Pattern.compile("<!!performer!!>(.*)<!!end performer!!>");
		Matcher MatchPerformer = performer.matcher(stringRepresentation);
		Pattern songList = Pattern.compile("<!!songlist!!>(.*)<!!end songlist!!>");
		Matcher MatchSongList = songList.matcher(stringRepresentation);
		Pattern song = Pattern.compile("<!!song!!>(.*)<!!end song!!>");
		
		if (MatchAlbumName.find()){
			this.name = MatchAlbumName.group(1);
		}else{throw new IllegalArgumentException("could not find the Album name!"); }
		
		if (MatchPerformer.find()){
			this.performer = MatchPerformer.group(1);
		}else{throw new IllegalArgumentException("could not find the Performer");}
		
		if (MatchSongList.find()){
			//System.out.println("found some songs");
			songs = MatchSongList.group(1);
			String[] songTokens = songs.split("<!!SongSplitPoint!!>");
			for(String token : songTokens){
				Matcher MatchSong = song.matcher(token);
				if (MatchSong.find()){
					internalSongList.add(MatchSong.group(1));
				}
				
			}
							
			this.songlist = internalSongList;
		}else{
			throw new IllegalArgumentException("could not find songs");
			}
		
	}

	/**
	 * Returns the string representation of the given album. The representation
	 * contains the title, performer and songlist, as well as all the genre
	 * that the book belongs to.
	 * 
	 * @return the string representation
	 */
	public String getStringRepresentation() {
		//System.out.println(name + "!@^^%" + performer + "!@^^%" + songlist);
		ArrayList<String> songTokens = new ArrayList<String>();
		for (String song : songlist){
			songTokens.add("<!!song!!>"+song+"<!!end song!!><!!SongSplitPoint!!>");
		}
		return "<!!album name!!>"+ name + "<!!end album name!!>"+ "<!!performer!!>" + performer +"<!!end performer!!>"+ "<!!songlist!!>" + songTokens + "<!!end songlist!!>";  //!@^^% is unlikely to show up in a song title
	}

	/**
	 * Add the book to the given genre
	 * 
	 * @param genre
	 * the genre to add the album to.
	 */
	public void addToGenre(Genre genre) {
		genre.addToGenre(this);
		this.genre = genre;		
	}
	/**
	 * removes an this album from the given genre
	 * @param genre
	 */
	public void rmAlbumFromGenre(Genre genre){
		genre.removeFromGenre(this);
		this.genre = null;
	}

	/**
	 * Returns the genre that this genre(name)s album belongs to.
	 * 
	 * @return the genre that this album belongs to
	 */
	public Genre getGenre() {
		return this.genre;
	}

	/**
	 * Returns the title of the album
	 * 
	 * @return the title
	 */
	public String getTitle() {
		return name;
	}

	/**
	 * Returns the performer of the album
	 * 
	 * @return the performer
	 */
	public String getPerformer() {
		return performer;
	}

	/**
	 * An album cannot have any children (it cannot contain anything).
	 */
	@Override
	public boolean hasChildren() {
		return false;
	}
}
