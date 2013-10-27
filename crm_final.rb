require_relative "contact_final"
require_relative "rolodex_final"

class CRM

  attr_accessor :name    #Is this required?

  def initialize(name)   #Is this required?
    self.name = name
  end

def main_menu
    begin
    display_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end while user_selected != 7 
end

def display_main_menu
    puts "------------------------------"
    puts "    Welcome to Juha's CRM!    "
    puts "------------------------------"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Search for a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "------------------------------"
    print "Enter a number: "
end  

def call_option(user_selected)
    case(user_selected)
    when 1
      add_new_contact
    when 2
      modify_contact
    when 3
      display_a_contact
    when 4
      display_all_contacts
    when 5
      print_attribute_menu
    when 6
      delete_contact
    when 7
        puts "Thanks for using Juha's CRM. Feedback to sales@floorballpro.com"
        Kernel.exit 
    end
  end

def add_new_contact
  puts "\e[H\e[2J"
  puts "-----------------"
  puts "Add a New Contact"
  puts "-----------------"
  print "Enter First Name: "
  first_name = gets.chomp
  print "Enter Last Name: "
  last_name = gets.chomp
  print "Enter Email Address: "
  email = gets.chomp
  print "Enter Note: "
  note = gets.chomp
  contact = Contact.new(first_name, last_name, email, note)   #This is where it's confusing
  Rolodex.add_contact(contact)
  puts "\e[H\e[2J"
  puts "Contact Added"
  main_menu
end

def modify_contact
  puts "\e[H\e[2J"
  display_all_contacts
  puts "-----------------------------"
  puts "Enter ID of Contact to Edit: "
  puts "-----------------------------"
  id_to_edit = gets.to_i
  puts
  Rolodex.display_name(id_to_edit)
  puts
  puts "[1] Yes"
  puts "[2] No"
  puts
  print "Enter your selection: "
  confirm = gets.to_i
  case confirm
    when 1
      puts "\e[H\e[2J"
      puts "----------------------"
      puts "Choose field to edit: "
      puts "----------------------"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      puts
      print "Enter your selection: "
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
      print "Enter new Email Address: "
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

def display_a_contact
end

def display_all_contacts
  Rolodex.display_all_contacts
end

def display_attributes
end

def delete_contact
end

end

theCRM = CRM.new("Juha's CRM")
puts "\e[H\e[2J"
theCRM.main_menu          #Is this required?