class Speaker < YamlRecord::Base
  # Source
  source File.expand_path('../../../data/speakers',  __FILE__)

  # Properties
  properties :name, :screenname

  # Retreive talks for this speaker
  def talks
    @talks ||= Talk.all.select { |t| t.author_screenname == self.id }
  end

  def as_json
    attributes
  end

end
