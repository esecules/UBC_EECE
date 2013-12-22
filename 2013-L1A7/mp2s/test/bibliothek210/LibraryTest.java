package bibliothek210;

import static org.junit.Assert.*;
import org.junit.Test;

public class LibraryTest {

	@Test
	public void testUserCount( ) {
		Library lib = new Library( );
		User u1 = new User("U1");
		User u2 = new User("U2");
		lib.addUser( u1 );
		lib.addUser( u2 );	
		
		assertEquals( 2, lib.getUserCount() );
	}
	
	@Test
	public void testCheckedoutCount( ) {
		Library lib = new Library( );
		User u1 = new User("U1");
		User u2 = new User("U2");
		lib.addUser( u1 );
		lib.addUser( u2 );
		Book book = new Book ("Test", "Test Author");
		
		lib.addItem( book );
		lib.checkout(book, u1);
		
		assertEquals( lib.getCheckedoutCount( book ), 1 );  //TODO What's wrong here?
	}
	
	@Test
	public void testContentTypeCount1( ) {
		
		Book b1 = new Book ( "Book 1", "Author 1" );
		Book b2 = new Book ( "Book 2", "Author 2" );
		Library lib = new Library( );
		lib.addItem( b1 );
		lib.addItem( b2 );
		
		int n = lib.getContentTypeCount( "Book" );
		
		assertEquals( 2, n );		
	}
	

	@Test
	public void testContentTypeCount2( ) {
		
		Library lib = new Library( );
		
		DVD DVD1 = new DVD( "50 Shades of May", "SomeTerribleDirectorPerson" );
		DVD DVD2 = new DVD( "Howls Moving Castle", "Ghibli");
		DVD DVD3 = new DVD( "Spirited Away" , "Ghibli");
		Book Gatsby = new Book("The Great Gatsby", "F. Scott Fitzgerald");
		Book Slaughterhouse5 = new Book("Slaughterhouse Five" , "Kurt Vonnegut");
		
		lib.addItem(Gatsby);
		lib.addItem(Slaughterhouse5);
		lib.addItem( DVD1 );
		lib.addItem( DVD2 );
		lib.addItem( DVD3 );
		
		int n = lib.getContentTypeCount( "DVD" );
				
		// for this test, you must create a new class, DVD, that extends
		// LibraryHolding, and add objects of that class to the library.
		// See "Book.java" for a starting point
		assertEquals( 3, n );	
		
	}
	
	
	@Test
	public void testAddDuplicateUser( ) {
		User u = new User( "Test User" );
		Library lib = new Library( );
		lib.addUser( u );
		lib.addUser( u );
		lib.removeUser( u );
		
		assertEquals( false, lib.isUser( u ));
	}

	@Test
	public void testCheckoutAndReturn( ) {
		Library lib = new Library( );
		User u = new User( "Test User" );
		Book b = new Book ( "Grapes of Wrath", "John Steinbeck" );
		lib.addItem( b );
		lib.addUser( u );
		lib.checkout( b, u );
		assertEquals( true, lib.processReturn(b) );
	}
	
	@Test
	
	public void testCheckoutAndReturnWithID( ) {
		
		Library lib = new Library( );
		
		Book CharlieChocolateFactory = new Book( "Charlie and the chocolate factory", "Ronald Dahl" );
		Book HarryPotter = new Book( "Harry Potter", "J.K. Rowling" );
		DVD FiftyShades = new DVD( "50 Shades of May", "SomeTerribleDirectorPerson" );
		DVD Totoro = new DVD( "My Neighbour Totoro", "Ghibli");
		DVD SpiritedAway = new DVD( "Spirited Away" , "Ghibli");
		
		lib.addItem( CharlieChocolateFactory );
		lib.addItem( HarryPotter );
		lib.addItem( FiftyShades );
		lib.addItem( Totoro );
		lib.addItem( SpiritedAway );
		
		User ChuckNorris = new User( "Chuck Norris" );
		User Gandalf = new User( "Gandalf The White" );
		User Radagast = new User( "Radagast The Brown" );
		User Phil = new User( "Phil Coulson" );
		User Hulk = new User( "Bruce Banner" );
		
		lib.addUser( ChuckNorris );
		lib.addUser( Gandalf );
		lib.addUser( Radagast );
		lib.addUser( Phil );
		lib.addUser( Hulk );
	
		lib.checkout(Totoro.getHoldingID(), Hulk.getUserId());
			
		assertEquals( true, lib.processReturn(Totoro.getHoldingID()) );
	}
	
}
