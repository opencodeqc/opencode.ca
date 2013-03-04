class Edition < YamlRecord::Base
  # Source
  source File.expand_path('../../../data/editions',  __FILE__)

  # Properties
  properties :title_fr, :held_at, :location, :incomplete

  # Retreive talks for this edition
  def talks
    @talks ||= Talk.all.select { |t| t.edition_id == self.id }
  end

  # Return the object as a Hash
  def as_json
    attributes
  end
end
