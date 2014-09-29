class Speaker < YamlRecord::Base
  include Sprockets::Helpers # OMG, this is unnacceptable

  # Source
  source File.expand_path('../../../data/speakers',  __FILE__)

  # Properties
  properties :name, :screenname, :avatar

  # Return the author picture URL, if present
  def picture_url
    if avatar
      image_path("speakers/#{avatar}")
    else
      image_path("default-avatar.png")
    end
  end

  # Return the author URL, if present
  def url
    @author_url ||= begin
      "http://twitter.com/#{self.screenname}" if self.screenname
    end
  end

  # Retreive talks for this speaker
  def talks
    @talks ||= Talk.all.select do |t|
      if t.authors.any?
        t.author_id.include?(self.id)
      else
        t.author_id == self.id
      end
    end
  end

  def as_json
    attributes
  end
end
