class Rolodex
  @contacts = []
  @id = 1000

  def self.contacts
    @contacts
  end

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.display_all_contacts     #How can I get it to NOT display the memory addresses?
      contacts.each { |x| puts "#{x.id} #{x.first_name} #{x.last_name} #{x.email} #{x.note}"}
  end

  def self.display_name(id_to_edit)
      contacts.each { |x| puts "Do you want to edit #{x.first_name} #{x.last_name}?" if x.id == id_to_edit}
  end

  def self.change_first_name(id_to_edit,new_first_name)
      contacts.each { |x| x.first_name = new_first_name if x.id == id_to_edit}
  end

  def self.change_last_name(id_to_edit,new_last_name)
      contacts.each { |x| x.last_name = new_last_name if x.id == id_to_edit}
  end

  def self.change_email(id_to_edit,new_email)
      contacts.each { |x| x.email = new_email if x.id == id_to_edit}
  end

  def self.change_note(id_to_edit,new_note)
      contact.each { |x| x.note = new_note if x.id == id_to_edit}
  end

  def self.display_contact(contact_to_display)
      contacts.each { |x| puts "ID: #{x.id}  #{x.first_name} #{x.last_name}  Email: #{x.email}  Notes: #{x.note}" if contact_to_display.downcase == x.first_name.downcase || contact_to_display.downcase == x.last_name.downcase  }
      puts
  end

  def self.delete_contact(contact_to_delete)
      contacts.delete_if { |x| x.id == contact_to_delete}
  end

  def self.display_attribute(attribute_display)
    case attribute_display
    when 1
      contacts.each { |x| puts x.id }
    when 2
      contacts.each { |x| puts x.first_name }
    when 3
      contacts.each { |x| puts x.last_name }
    when 4
      contacts.each { |x| puts x.email }
    when 5
      contacts.each { |x| puts x.note }
    end
    puts
  end

end