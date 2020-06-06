class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :notes
end
