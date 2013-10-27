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

  def self.display_name(id_to_edit)
    contacts.each { |i| puts "Edit #{i.first_name} #{i.last_name}?" if id_to_edit == i.id }
  end

  def self.change_first_name(id_to_edit, new_first_name)
    contacts.each { |i| i.first_name = new_first_name if id_to_edit == i.id }
  end

  def self.change_last_name(id_to_edit, new_last_name)
    contacts.each { |i| i.last_name = new_last_name if id_to_edit == i.id }
  end

  def self.change_email(id_to_edit, new_email)
    contacts.each { |i| i.email = new_email if id_to_edit == i.id }
  end

  def self.change_note(id_to_edit, new_note)
    contacts.each { |i| i.note = new_note if id_to_edit == i.id }
  end

  def self.display_all_contacts
      contacts.each { |x| puts "#{x.id} #{x.first_name} #{x.last_name} #{x.email} #{x.note}"}
  end

  def self.display_contact(contact_to_display)
    contacts.each { |i| puts "ID: #{i.id}  #{i.first_name} #{i.last_name}  Email: #{i.email}  Notes: #{i.note}" if contact_to_display.downcase == i.first_name.downcase || contact_to_display.downcase == i.last_name.downcase  }
    puts
  end

  def self.display_info_by_attribute(user_selected)
    contacts.map do |x|
      if user_selected == "id"
        x.id
      elsif user_selected == "first_name"
        x.first_name
      elsif user_selected == "last_name"
        x.last_name
      elsif user_selected == "email"
        x.email
      elsif user_selected == "note"
      end
    end
  end

  def self.delete_contact
      puts "Here is a list of who you know. Hope they are important"
      display_all_contacts
      puts "Who do you want to delete? Gimme an ID"
      deleteuser = gets.to_i
      @contacts.delete_if {|c| c.id == deleteuser } #Could you do it another way? Avoid looping
  end

end