class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
    @@next_id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all
    @@contacts
  end

# FIND BY ID

  def self.find(id)
    @@contacts.find { |contact| contact.id == id }
  end

# UPDATE CONTACT

  def update(attribute, new_value)
    @@contacts.find { |contact| contact if contact.send("#{attribute}=", new_value) }
  end

# FIND BY ATTRIBUTE

  def self.find_by(attribute, value)
    @@contacts.find { |contact| contact if contact.send(attribute) == value }
  end

# DELETE ALL

  def self.delete_all
    @@contacts = []
  end

# FULL NAME

  def full_name
    "#{first_name} #{last_name}"
  end

# DELETE SINGLE CONTACT

  def delete
    @@contacts.delete(self)
  end

end
