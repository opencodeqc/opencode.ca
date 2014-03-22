class Talk < YamlRecord::Base
  # Source
  source File.expand_path('../../../data/talks',  __FILE__)

  # Properties
  properties :title, :slides_url, :code_url, :edition_id, :author_id

  # Find author
  def author
    Speaker.find(self[:author_id]) if self[:author_id].is_a?(Integer)
  end

  # Find authors in more than one
  def authors
    if self[:author_id].is_a?(Array)
      self[:author_id].map { |id| Speaker.find(id) }
    else
      []
    end
  end

  # Return the object as a Hash
  def as_json
    attributes
  end
end
