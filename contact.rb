# Copy your entire Contact class from the old crm assignment here.

class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    # 1. Initialize a new Contact with a unique ID
    new_contact = self.new(first_name, last_name, email, note)
    # 2. Add the new Contact to the list of all contacts
    @@contacts << new_contact
    # 3. Return new object
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end



  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      return contact if contact.id == id
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)

    @@contacts.find { |contact| contact if contact.send("#{attribute}=", new_value) }

    # ATTEMPT #2 - Each, Send Method

    # @@contacts.each do |contact|
    #   if contact.send("#{attribute}=", new_value)
    #     return contact
    #   end
    # end

    # ATTEMPT #1 - Case Method

    # case
    # when edit_attribute = "first_name"
    #   @first_name = new_value
    # when edit_attribute = "last_name"
    #   @last_name = new_value
    # when edit_attribute = "email"
    #   @email = new_value
    # when edit_attribute = "note"
    # @note = new_value
    # end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)

    # ATTEMPT #5 - Each, Send Method, Single Line

    @search_results = []
    @@contacts.each { |contact| @search_results << contact if contact.send(attribute) == value }
    return @search_results

    # ATTEMPT #4 -  Find, Send Method

    # @@contacts.find do |contact|
    #   contact if contact.send(attribute) == value
    # end

    # ATTEMPT #3 - Send Method, Single Line

    # @@contacts.each do |contact|
    #   return contact if contact.send(attribute) == value
    # end

    # ATTEMPT #2 - Send Method

      # @@contacts.each do |contact|
      #   if contact.send("#{attribute}=", value)
      #    return contact
      #   end
      # end

    # ATTEMPT #1 - Case Method

      # @@contacts.each do |contact|
      #   case
      #   when attribute = "first_name" && value == contact.first_name
      #     p contact
      #   when attribute = "last_name" && value == contact.last_name
      #    p contact
      #   when attribute = "email" && value == contact.email
      #     p contact
      #   when attribute = "note" && value == contact.note
      #     p contact
      #   end
      # end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
