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
      modify_contact
    when 3
      delete_contact
    when 4
      display_all_contacts
    when 5
      print_attribute_menu
    when 6
        puts "Thanks for being here with us"
        Kernel.exit 
    else
      #raise an error to get it to bubble up to main_menu and then set up rescue block
    end
  end

  def print_attribute_menu
      puts "Which attribute tickles your fancy?"
      puts "[1] ID"
      puts "[2] First Name"
      puts "[3] Last Name"
      puts "[4] Email"
      puts "[5] Note" 
      puts "[6] Cancel"
      puts "Enter a number: "
      user_selected = gets.to_i
      print_attribute_submenu(user_selected)
  end

  def print_attribute_submenu(user_selected)
    case(user_selected)
    when 1
      puts Rolodex.display_info_by_attribute("id") 
    when 2
      puts Rolodex.display_info_by_attribute("first_name")
    when 3
      puts Rolodex.display_info_by_attribute("last_name")
    when 4
      puts Rolodex.display_info_by_attribute("email")
    when 5
      puts Rolodex.display_info_by_attribute("note")
    when 6
      main_menu
    else
      #raise an error to get it to bubble up to main_menu and then set up rescue block
    end
  end

  def modify_contact
    puts "\e[H\e[2J"
    display_all_contacts
    puts
    print "Enter ID of Contact to Edit: "
    id_to_edit = gets.to_i
    puts
    Rolodex.display_name(id_to_edit)
    puts
    puts "[1] Yes"
    puts "[2] No"
    puts 
    print "Make a choice: "
    confirm = gets.to_i
    case confirm
    when 1
      puts "\e[H\e[2J"  
      puts "---------------------------------"
      puts "Which field do you want to edit?"
      puts "---------------------------------"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      puts "---------------------------------"
      print "Make a choice: "
      field_to_edit = gets.to_i
    when 2
      puts "\e[H\e[2J"
      main_menu
    end
    case field_to_edit
    when 1
      puts
      print "Enter new First Name: "
      new_first_name = gets.chomp
      Rolodex.change_first_name(id_to_edit, new_first_name)
      puts "\e[H\e[2J"
      puts "* First Name Changed! *"
      main_menu
    when 2
      puts
      print "Enter new Last Name: "
      new_last_name = gets.chomp
      Rolodex.change_last_name(id_to_edit, new_last_name)
      puts "\e[H\e[2J"
      puts "* Last Name Changed! *"
      main_menu
    when 3
      puts
      print "Enter new Email: "
      new_email = gets.chomp
      Rolodex.change_email(id_to_edit, new_email)
      puts "\e[H\e[2J"
      puts "* Email Changed! *"
      main_menu
    when 4
      puts
      print "Enter new Note: "
      new_note = gets.chomp
      Rolodex.change_note(id_to_edit, new_note)
      puts "\e[H\e[2J"
      puts "* Note Changed! *"
      main_menu
    end
  end

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

  def display_attribute
    Rolodex.display_info_by_attribute
  end

  def main_menu #Loop infinate unless you have an exit condition
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    main_menu
  end
end
  
my_crm = CRM.new("CRMizzy") #This creates the object using the class and calls initialize
my_crm.main_menu