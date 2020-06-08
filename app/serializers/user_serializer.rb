class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username
  # do I still need this when I have customization below?
  # has_many :entries
  # does not have other attributes:
  has_many :entries, serializer: EntrySerializer
  
  # customiziong your attributes
  attribute :entries do |user|
    user.entries.map do |entry| {
      title: entry.title,
      notes: entry.notes
    }
    end
  end

end

