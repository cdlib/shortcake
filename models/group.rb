class Group
  include DataMapper::Resource
  has n, :users
  has n, :maintainers
  has n, :pids, :through => :maintainers
  
  property :id, String, :length => 10, :format => /[A-Z]+/, :unique => true, :key => true,
    :messages => {
      :presence  => "A group ID is required.",
      :is_unique => "We already have that group ID.",
      :format    => "Group ID must be a combination of 1-10 uppercase letters."
    }
  property :name, String, :length => 50, :format => /\w+/, :required => true,
    :messages => {
      :presence  => "A group name is required.",
      :format    => "Group names must be 50 no more than characters without symbols."
    }
  property :description, String, :length => 250
end