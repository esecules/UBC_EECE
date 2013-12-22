package bibliothek210;

import java.util.List;
import java.util.ArrayList;

/**
 * 
 * @author Sathish Gopalakrishnan
 * 
 * The Library class represents a library,
 * with a collection of items and users.
 * 
 * The class includes methods for processing checkouts and returns
 * and other basic operations.
 *
 */

public class Library {
	
	// the list of items in the library
	private List<LibraryHolding> libraryItems;
	
	// the list of users
	private List<User> users;
	
	
	/**
	 * Default constructor that creates empty item and user lists.
	 * and resets ID number counters.
	 */
	public Library( ) {
		libraryItems = new ArrayList<LibraryHolding>();
		users = new ArrayList<User>();
	}
	
	/**
	 * Obtain the number of users.
	 * 
	 * @return the number of users in the library system.
	 */
	public int getUserCount() {
		return users.size();
	}
	
	/**
	 * Obtain the number of items in the library.
	 * 
	 * @return the number of items in the library system.
	 */
	public int getItemCount() {
		return libraryItems.size();
	}

	/**
	 * Add a new user to the list of users.
	 * 
	 * @param user to add to the library user list
	 */
	public void addUser( User user ) {
		if (!users.contains(user))
			users.add( user );
	}
	
	/**
	 * Checks if a user is part of this library's system
	 * @param user to be tested for
	 * @return true of the user is part of the library's user list,
	 * otherwise return false
	 */
	public boolean isUser( User user ) {
		
		return users.contains( user );
	}
	
	/**
	 * Remove a user from the library's user list
	 * 
	 * @param user to be removed
	 */
	public void removeUser( User user ) {
		if (users.size() != 0)
			users.remove( user );
	}
	
	/**
	 * Add an item to the library's collection
	 * 
	 * @param item to be added
	 */
	public void addItem( LibraryHolding item ) {
		if (!this.contains(item))
			libraryItems.add( item );
	}
	
	/**
	 * Return the number of times a given library holding has been checked out.
	 * @return number of checked out items
	 */
	public int getCheckedoutCount( LibraryHolding H ) {
		return H.getCheckOutCount();
	}
	
	/**
	 * Returns the number of items in the library of the given holding type
	 * 
	 * @param contentType is a string that represents the holding type
	 * @return the number of library items that match the holding type
	 */
	public int getContentTypeCount( String contentType ) {
		int itemCount = 0;
		for (LibraryHolding item : this.libraryItems){
			if (item.holdingType() == contentType)
				itemCount ++;
		}
		return itemCount;
	}
	
	/**
	 * Process an item checkout given the item object pointer
	 * and the user object pointer
	 * 
	 * @param item being checked out
	 * @param user who is checking the item out
	 * @return true if the checkout succeeded, false otherwise.
	 * If the checkout is successful then the state of the item 
	 * changes to CheckedOut and the user is added to the item
	 * as its current holder. Similarly the item is added to the 
	 * list of items in the user's possession.
	 */
	public boolean checkout( LibraryHolding item, User user ) {
		//Checkout checks whether the item is part of the library
		try{
			if (this.contains(item))
				if (item.checkOut( user )) 
					if (user.addToList( item ))
						return true;
			return false;
			
		
		}catch(NullPointerException e){
			System.out.println("User or Holding Not found");
			return false;
		}
	}
	
	/**
	 * Process an item checkout given the item's ID and the user's ID
	 * so long as the item and user are already in the system
	 * @param holdingID
	 * @param userID
	 * @return
	 */
	public boolean checkout( int holdingID, int userID ) {
		boolean foundUser = false;
		boolean foundHolding = false;
		User borrower = null;
		LibraryHolding item = null;
	
		for (User U : users){
			if(U.getUserId() == userID){
				foundUser = true;
				borrower = U;
				break;
			}
		}
		if (!foundUser){
			System.out.println("UserID  Not found");
			return false;
		}
		for (LibraryHolding H : libraryItems){
			if(H.getHoldingID() == holdingID){
				foundHolding = true;
				item = H;
				break;
			}
		}
		if (!foundHolding){
			System.out.println("HoldingID Not found");
			return false;
		}
		return this.checkout(item, borrower);
		
	}
	
	/**
	 * Will process a return on an item provided that it exists 
	 * in the library. Will return true or false depending on 
	 * whether the return was successful.
	 * @param item
	 * @return boolean
	 */
	public boolean processReturn( LibraryHolding item ) {
		try{
			if (this.contains(item))
				return item.processReturn();
			else{
				System.out.println("Cannot find item in catalogue");
				return false;
			}
		}catch(NullPointerException e){
			System.out.println("Item is null!");
			return false;
		}
	}
	
	/**
	 * GIven library holding's ID number a return will be
	 * processed on that holding provided that it exists in
	 * the library. If the return was successful true will be 
	 * returned and false otherwise.
	 * @param holdingID
	 * @param userID
	 * @return
	 */
	public boolean processReturn( int holdingID ) {
			LibraryHolding item = null;
			boolean foundItem = false;
			for (LibraryHolding H : libraryItems){
				if (H.getHoldingID() == holdingID){
					item = H;
					foundItem = true;
					break;
				}
			}
			if (!foundItem){
				return false;
			}
			else
		return item.processReturn();
	}
	/**
	 * Checks the library for the library holding specified
	 * and returns true when the first instance of that holding
	 * is found
	 * @param H , A library holding
	 * @return true or false
	 */
	public boolean contains(LibraryHolding H){
		try{
			for (LibraryHolding item : this.libraryItems){
				if (item.getHoldingID() == H.getHoldingID()){
					return true;
				}
			}
			return false;
		}catch(NullPointerException e){
			System.out.println("Item is null!");
			return false;
		}
	}
}
