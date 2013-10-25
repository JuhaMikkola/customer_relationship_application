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
end