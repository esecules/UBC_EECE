package bibliothek210;

import java.util.ArrayList;
import java.util.List;

public class User {
	
	private static int nextUserId = 1;
	private final String name;
	private final int userId;
	private List<LibraryHolding> itemList;
	
	/**
	 * Constructor for a user object.
	 *  
	 * @param name: user's name
	 * @returns nothing but automatically sets the UserId using the next valid id number.
	 */
	public User( String name ) {
		userId = nextUserId;
		nextUserId++;
		this.name = name;
		itemList = new ArrayList<LibraryHolding>( );
	}
	
	/**
	 * Gets the user's name.
	 * 
	 * @return name
	 */
	public String getName( ) {
		return name;
	}
	
	/**
	 * Gets the user's identification number.
	 * 
	 * @return userId
	 */
	public int getUserId( ) {
		return userId;
	}
	
	/**
	 * Add an item to the user's list of checked out items.
	 * 
	 * @param item: item that is added to the user's list
	 * of checked out items. Requires that the item be checked out to
	 * the user.
	 */
	public boolean addToList( LibraryHolding item ) {
		if (item == null) {
			throw new NullPointerException();
		}
		
		return itemList.add( item );
		
	}
	
	/**
	 * Check if the user has an item.
	 * @param item: check if this item is in the user's list of checked out items
	 * @return true if the item is in the list and false otherwise
	 */
	public boolean hasItem( LibraryHolding item ) {
		// TODO: Is this check sufficient? Can we run into problems?
		// Think about how the contains( ) method works.
		if (itemList.contains( item ) == true) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Process an item's return for a user by removing the item from
	 * the user's list of checked out items.
	 * 
	 * @param item: item that is being returned by the user.
	 * @return true if the item was correctly returned, false otherwise.
	 */
	public boolean processReturn( LibraryHolding item ) {
		// TODO: Implement this method.
		// The item should be removed from the user's list if its
		// status is no longer HoldingStatus.CheckedOut.
		if (item.getStatus() == HoldingStatus.Available) {
			itemList.remove(item);
			return true;
		}
		
		else if (item.getStatus() == HoldingStatus.Lost) {
			itemList.remove(item);
			return true;
		}
		// If its status is different then appropriate action must be
		// taken, including possibly changing the item's status.
		return false;
	}
	/**
	 * Resets the User IDs back to 1 for use in
	 * the library constructor.
	 * 
	 *modifies: NextUserId
	 */
	
}
