class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :notes

  belongs_to :user
  
end
