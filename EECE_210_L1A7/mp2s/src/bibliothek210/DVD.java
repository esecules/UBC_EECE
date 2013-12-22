package bibliothek210;


public class DVD extends LibraryHolding{
		
		private String title;
		private String director;
		private static final int checkoutDuration = 7; //checkout is 7 days instead of 14
		
		//constructor
		public DVD( String title, String director ) {
			super( );
			this.title = title;
			this.director = director;
		}
		
		//returns the title of a DVD
		public String GetTitle( ) {
			return this.title;
		}
		
		//returns checkout duration
		@Override
		public int getCheckoutDuration( ) {
			return checkoutDuration;
		}
		
		//returns string representation of a DVD
		@Override
		public String getStringRepresentation( ) {
			return "<DVD>\n<title>"+title+"</title>\n<director>"+director+"</director>\n</DVD>";
		}
		
		//returns the type of the object
		@Override
		public String holdingType( ) {
			return "DVD";
		}
		
}
