require_relative "contact"
require_relative "rolodex"

class CRM

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

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
end
  
my_crm = CRM.new("CRMizzy") #This creates the object using the class and calls initialize
my_crm.main_menu