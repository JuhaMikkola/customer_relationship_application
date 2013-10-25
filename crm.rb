require_relative "contact"  #Files always lower case with underscores
require_relative "rolodex"

#Raise, Begin, Rescue

class CRM    #Use camel case for class names

attr_accessor :name  #GETTER & SETTER methods, convention is symbol but works with string

# attr_reader :name    #Sets GETTER method automatically
# attr_writer :name    #Sets SETTER method automatically

  def initialize(name)
    self.name = name        #Don't need @ anymore because of setter method
    #But need to call self to NOT call the local variable
  end

  # def name      #Allows you to access name outside of the class GETTER METHOD
  #   @name
  # end

  # def name=(name)   #SETTER METHOD - allows you to set the name of the CRM
  #   @name = name
  # end

  def print_main_menu
    puts "Welcome to #{@name}: the future of contact management"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case(user_selected)
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_all_contacts
    when 5
      display_attribute
    when 6
        puts "Thanks for being here with us"
        Kernel.exit 
    else
      #raise an error to get it to bubble up to main_menu and then set up rescue block
    end
  end

  # Perfect for a Case statement, define the above methods and add the rest.
  # case grade
  # when A, B
  #   puts XXXX
  # when A, B
  #   puts XXXX
  # else 
  #   puts XXXX
  # end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Rolodex.add_contact(contact)  #Calling on the class to do something, like NEW
  end

  def delete_contact
    Rolodex.delete_contact
  end

  def display_all_contacts
    Rolodex.display_all_contacts
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    main_menu
  end
end
  
my_crm = CRM.new("CRMizzy") #This creates the object using the class and calls initialize
my_crm.main_menu