class Rolodex     #Container for all contacts, better than array as allows methods to be passed through it 
  @contacts = []  #Array to store the contacts in, instance variable not in an instance method but class level = CLASS LEVEL ISNTANCE VARIABLE -> can only access from the class level. Have to manually write the SETTERS and GETTERS
  @id = 1000      #Start number for the IDs

  def self.contacts #self defines it as a class variable
    @contacts
  end

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1      #Add an ID number to the contact
  end

  def modify_contact
  end

  def self.display_all_contacts #ADD SELF! Is this correct?
      contacts.each { |x| puts "#{x.id} #{x.first_name} #{x.last_name} #{x.email} #{x.note}"}
  end

  def display_particular_contact
  end

  def display_info_by_attribute
  end

  def self.delete_contact
      puts "Here is a list of who you know. Hope they are important"
      display_all_contacts
      puts "Who do you want to delete? Gimme an ID"
      deleteuser = gets.to_i
      @contacts.delete_if {|c| c.id == deleteuser }
  end

end