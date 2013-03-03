class Edition < YamlRecord::Base
  # Source
  source File.expand_path('../../../data/editions',  __FILE__)

  # Properties
  properties :title_fr, :title_en, :held_at, :number

  # Retreive talks for this edition
  def talks
    @talks ||= Talk.all.select { |t| t.edition_id == self.id }
  end
end
