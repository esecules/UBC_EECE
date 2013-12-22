package ca.ubc.ece.eece210.mp3.ast;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import ca.ubc.ece.eece210.mp3.Album;
import ca.ubc.ece.eece210.mp3.Catalogue;
import ca.ubc.ece.eece210.mp3.Genre;

public class ASTNodesTest {
//TODO Use a catalog and search it using strings similar to those from QueryParserTest 
        // except go one step further and actually search the catalog and see if the set you
        // are returned is the same as what you expect.
	    static	Album theWall;
       	static Album internetMedley;
       	static Album americanIdiot;
       	static Album ageOfIgnorance;
       	static Catalogue testCat;
       	
       	@BeforeClass
       	/**
         * constructs a catalog that all tests can use
         * the catalog contains several levels subgenres
         *  
         *  --A graphical representation of the catalog--
         *               (Catalog)
         *               /       \
         *      (Troll Music)   (Rock)
         *                       /  \
         *   				(Metal)(Punk)
         *                    /
         *        (Heavy Metal)
         *        
         * @return catalog
         */
       public static  void catFactory(){
               testCat = new Catalogue();
                ArrayList<String> songlist1 = new ArrayList<String>();
                songlist1.add( "Holiday" );
                songlist1.add( "American Idiot" );
                songlist1.add( "Boulivard of Broken Dreams" );
                songlist1.add( "Letterbomb" );
                ArrayList<String> songlist2 = new ArrayList<String>();
                songlist2.add( "Another Brick in the Wall Pt. 1" );
                songlist2.add( "Another Brick in the Wall Pt. 2" );
                ArrayList<String> songlist3 = new ArrayList<String>();
                songlist3.add( "Trolololol" );
                songlist3.add( "Leak Spin" );
                songlist3.add( "Numa Numa" );
                songlist3.add( "Nyan Cat" );
                ArrayList<String> songlist4 = new ArrayList<String>();
                songlist4.add( "Fate" );
                songlist4.add( "Age Of Ignorance" );
                songlist4.add( "Voices" );
                songlist4.add( "Liberate Me" );
                ageOfIgnorance = new Album("Age Of Ignorance", "Our Last Night", 2012, songlist4);
                americanIdiot =  new Album( "American Idiot" , "Green Day", 2004 , songlist1);
                theWall = new Album( "The Wall (Remastered)" , "Pink Floyd", 1979 , songlist2);
                internetMedley = new Album( "Internet Medley" , "Forever Alone", 2000 , songlist3);
                Genre rock  = new Genre("Rock");
                Genre punk = new Genre("Punk");
                Genre metal = new Genre("Metal");
                Genre Hmetal = new Genre("Heavy Metal");
                Genre trolMusic = new Genre("Trol Music");
                theWall.addToGenre(rock);
                americanIdiot.addToGenre(punk);
                internetMedley.addToGenre(trolMusic);
                ageOfIgnorance.addToGenre(Hmetal);
                metal.addToGenre(Hmetal);
                rock.addToGenre(metal);
                rock.addToGenre(punk);
                testCat.addToCat(rock);
                testCat.addToCat(trolMusic);
                
        }
		@Test
        public void AndNode() {
         
                List<Album> matches = new ArrayList<Album>();
                matches = testCat.queryCat("in (\"Rock\") && by (\"Pink Floyd\"))");
                
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
                
        }
        @Test
        public void OrNode() {
                List<Album> matches = new ArrayList<Album>();
                matches = testCat.queryCat("by (\"Pink Floyd\") || by (\"Forever Alone\")");
                
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
                expected.add( internetMedley );
             
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void InNode() {
                
                List<Album> matches = new ArrayList<Album>();
                matches = testCat.queryCat("in (\"Rock\")");
     
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
                expected.add( americanIdiot );
                expected.add( ageOfIgnorance );
                
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void MatchesNode() {
           
                List<Album> matches = new ArrayList<Album>();
                matches = testCat.queryCat("matches (\"Pink Floyd\"))");
                
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void CompoundExpr() {
                List<Album> matches = new ArrayList<Album>();
                
                matches = testCat.queryCat("(by (\"Pink Floyd\") || in (\"Trol Music\")) || (matches (\"Green Day\") && in (\"Rock\") && after (\"42\"))");
                
                List<Album> expected = new ArrayList<Album>();  
                expected.add( theWall );
                expected.add( internetMedley );
                expected.add( americanIdiot );
              
                assertEquals(expected.size(), matches.size());
               assertTrue(expected.containsAll(matches));
        }
        @Test
        public void notFound() {
                List<Album> matches = testCat.queryCat("in (\"Some Genre\") && before (\"42\") ");
                List<Album> expected = new ArrayList<Album>();
                
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void releasedAfterTest() {
                List<Album> matches = testCat.queryCat("after (\"1999\")");
                List<Album> expected = new ArrayList<Album>();
                expected.add( internetMedley );
                expected.add( americanIdiot );
                expected.add( ageOfIgnorance );
                
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void releasedBeforeTest() {
                List<Album> matches = testCat.queryCat("before (\"1990\")");
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
           
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        @Test
        public void releasedBeforeOrAfterTest() {
                List<Album> matches = testCat.queryCat("before (\"1990\") || after (\"2005\")");
                List<Album> expected = new ArrayList<Album>();
                expected.add( theWall );
                expected.add( ageOfIgnorance );
           
                assertEquals(expected.size(), matches.size());
                assertTrue(expected.containsAll(matches));
        }
        
       
}
