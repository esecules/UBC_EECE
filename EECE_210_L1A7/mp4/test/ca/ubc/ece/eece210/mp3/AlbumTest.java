package ca.ubc.ece.eece210.mp3;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;


import java.io.IOException;




public class AlbumTest {
	
	ArrayList<String> songlist = new ArrayList<String>();
	Album testAlbum = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
	Genre Classical = new Genre( "Classical" );
	String albumString = new String();
	
	//Scenario 1: Tests if album is added into the right genre
	@Test
	public void AddAlbumToGenre() {
		//Declare new album, adds genre as classical and tests if its genre equals actual genre
		Album testAlbum = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
		testAlbum.addToGenre( Classical );
		assertEquals( "testAlbum should be in the genre Classical" , Classical, testAlbum.getGenre() );
	}
	
	//Scenario 2: Tests if album is removed from the right genre
	@Test
	public void RemoveAlbumFromGenre() {
		//Declare album, add and then remove the genre, see if the genre is still the genre of the album
		ArrayList<String> songlist = new ArrayList<String>();
		songlist.add( "Back in Black" );
		songlist.add( "Piano Stuff" );
		songlist.add( "Rap Stuff" );
		Album testAlbum = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
		testAlbum.addToGenre( Classical );
		testAlbum.rmAlbumFromGenre( Classical );
		assertFalse( "Returns false if genre of testAlbum is not equal to genre Classical", ( testAlbum.getGenre() == Classical ) );
	}

	//Scenario 3: Saves album to the string format
	@Test
	public void SaveToString() {
		//dont think this is right
		albumString = testAlbum.getStringRepresentation();
		Album StringRepresentation = new Album(albumString);
		//you must compare the object's fields because comparing objects compares their pointers.
		//System.out.println("album contents\n"+StringRepresentation.name +"\n"+StringRepresentation.performer+"\n" );
		assertEquals("Album title does not match expected",testAlbum.name,StringRepresentation.name);
		assertEquals("Album performer does not match expected",testAlbum.performer,StringRepresentation.performer);
		assertEquals("songlist does not match expected",testAlbum.songlist.toString(),StringRepresentation.songlist.toString());
	}
	
	//Scenario 4: Recreate album from the string form
	@Test
	public void StringToAlbum() {
		//makes string representation of album
		albumString = testAlbum.getStringRepresentation();
		//convert back into an album from string representation
		Album StringRepresentation = new Album(albumString);
		//compare the stringrepresentation album with the testalbum to see if theyre the same
			//System.out.println(StringRepresentation.name +" "+ StringRepresentation.performer +" "+ StringRepresentation.songlist);
			//System.out.println(testAlbum.name +" "+ testAlbum.performer +" "+ testAlbum.songlist);
		//you must compare the object's fields because comparing objects compares their pointers.
		assertEquals("Album title does not match expected",testAlbum.name,StringRepresentation.name);
		assertEquals("Album performer does not match expected",testAlbum.performer,StringRepresentation.performer);
		assertEquals("songlist does not match expected",testAlbum.songlist.toString(),StringRepresentation.songlist.toString());
	}
	
	//Scenario 5: Save Genre to the string form
	@Test
	public void GenreToString() {
		//declaring songlist with a couple songs and a test album with details
		ArrayList<String> songlist = new ArrayList<String>();
		songlist.add( "Back in Black" );
		songlist.add( "Piano Stuff" );
		songlist.add( "Boulivard of Broken Dreams" );
		//created album and added it to a specific genre
		Album testAlbum1 = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
		Album testAlbum2 = new Album( "American Idiot" , "Green Day" , songlist);
		Genre Classical = new Genre( "Classical" );
		Genre Master = new Genre( "Master" );
		testAlbum1.addToGenre( Classical );
		testAlbum2.addToGenre( Classical );
		Master.addToGenre(Classical);
		String Test = new String();
		Test = ("\n<!!genre name!!>Master<!!end genre name!!>[\n<!!sub genre!!>\n<!!genre name!!>Classical<!!end genre name!!>[\n<!!album!!><!!album name!!>Chopin Collections<!!end album name!!><!!performer!!>Evgeny Kissin<!!end performer!!><!!songlist!!>[<!!song!!>Back in Black<!!end song!!><!!SongSplitPoint!!>, <!!song!!>Piano Stuff<!!end song!!><!!SongSplitPoint!!>, <!!song!!>Boulivard of Broken Dreams<!!end song!!><!!SongSplitPoint!!>]<!!end songlist!!><!!end album!!>, \n<!!album!!><!!album name!!>American Idiot<!!end album name!!><!!performer!!>Green Day<!!end performer!!><!!songlist!!>[<!!song!!>Back in Black<!!end song!!><!!SongSplitPoint!!>, <!!song!!>Piano Stuff<!!end song!!><!!SongSplitPoint!!>, <!!song!!>Boulivard of Broken Dreams<!!end song!!><!!SongSplitPoint!!>]<!!end songlist!!><!!end album!!>]\n<!!end sub genre!!>]\n<!!END!!>");
		assertEquals("String does not match Test string" , Master.getStringRepresentation(), Test);
	}
	
	//Scenario 6: Recreate the Genre from the string form
	@Test
	public void StringToGenre() {
		//declaring songlist with a couple songs and a test album with details
		ArrayList<String> songlist = new ArrayList<String>();
		songlist.add( "Back in Black" );
		songlist.add( "Piano Stuff" );
		songlist.add( "Boulivard of Broken Dreams" );
		//created album and added it to a specific genre
		Album testAlbum1 = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
		Album testAlbum2 = new Album( "American Idiot" , "Green Day" , songlist);
		Album testAlbum3 = new Album( "Black Ice" , "AC / DC" , songlist);
		Genre Master = new Genre( "Master" );
		Genre Expected = new Genre( "Expected" );
		Genre TestGenre = new Genre( "TestGenre" );
		
		testAlbum1.addToGenre( Expected );
		testAlbum2.addToGenre( Expected );
		testAlbum3.addToGenre( Expected );
		Master.addToGenre(Expected);
		String stringRep = Master.getStringRepresentation();
		//System.out.println(stringRep);
		TestGenre = Genre.restoreCollection(stringRep);
		assertEquals(Master.name,TestGenre.name);
		assertEquals(Master.getAllChildren(),TestGenre.getAllChildren());
	}
	
	

	
	

	//Scenario 7: Save the whole catalogue to a file
	@Test
	public void SaveToFile () throws IOException {
		Catalogue TestCatalogue = new Catalogue();		//create new catalogue
		ArrayList<String> songlist = new ArrayList<String>();
		songlist.add( "Back in Black" );
		songlist.add( "Piano Stuff" );
		songlist.add( "Boulevard of Broken Dreams" );
		Album testAlbum1 = new Album( "Chopin Collections" , "Evgeny Kissin" , songlist);
		Album testAlbum2 = new Album( "American Idiot" , "Green Day" , songlist);
		Album testAlbum3 = new Album( "Black Ice" , "AC / DC" , songlist);
		Genre Funk = new Genre( "Funk" );
		Genre Classical = new Genre( "Classical" );
		Genre Jazz = new Genre( "Jazz" );
		Genre Blues = new Genre( "Blues" );
		testAlbum1.addToGenre( Classical );
		testAlbum2.addToGenre( Funk );
		testAlbum3.addToGenre( Blues );
		Jazz.addToGenre( Blues );
		Jazz.addToGenre( Funk );
		//save it to a file with file name "address"
		TestCatalogue.addToCat(Jazz);
		TestCatalogue.addToCat(Classical);
		TestCatalogue.addToCat(Blues);
		TestCatalogue.saveCatalogueToFile("Cat.txt");
		Catalogue	TestCatalogue2 = new Catalogue("Cat.txt");
		assertTrue(TestCatalogue.equals(TestCatalogue2));
	}
	
	
	
	//Scenario 8: Write a test to verify the genre inclusion rules
	//check to make sure you cant add an album already in a genre twice
	@Test
	public void InclusionRules() {
		Genre Rock = new Genre( "Rock" );
		Genre Jazz = new Genre( "Jazz" );
		Genre Blues = new Genre( "Blues" );
		Genre Classical = new Genre( "Classical" );
		
		songlist.add( "Back in Black" );
		songlist.add( "Piano Stuff" );
		songlist.add( "Boulevard of Broken Dreams" );
		
		Album testAlbum2 = new Album( "American Idiot" , "Green Day" , songlist);
		Album testAlbum3 = new Album( "Black Ice" , "AC / DC" , songlist);
		
		boolean addAlbumFail = false;
		
		try{
		testAlbum2.addToGenre( Rock );
		testAlbum3.addToGenre( Rock );
		testAlbum2.addToGenre( Rock );	
		} catch (IllegalArgumentException e) {
			//System.out.println( e.getMessage() );
			addAlbumFail = true;
		}
		
		boolean addGenreFail = false;
		
		try{
		Jazz.addToGenre( Rock );
		Blues.addToGenre( Rock );
		Jazz.addToGenre( Rock );
		} catch ( IllegalArgumentException e ) {
			//System.out.println( e.getMessage() );
			addGenreFail = true;
		}
		
		boolean Overflow = false;
		try{
		Rock.addToGenre( Rock );
		} catch ( IllegalArgumentException e ) {
			Overflow = true;
			//System.out.println( e.getMessage() );
		}
		
		assertTrue( addAlbumFail );
		assertTrue( Overflow );
		assertTrue( addGenreFail );
		
		testAlbum3.addToGenre( Classical );
		assertTrue( testAlbum3.getGenre().equals( Classical ) );
		assertFalse( testAlbum3.getGenre().equals( Rock ) );
	}
}
