class Talk < YamlRecord::Base
  include Sprockets::Helpers # OMG, this is unnacceptable

  # Source
  source File.expand_path('../../../data/talks',  __FILE__)

  # Properties
  properties :title, :slides_url, :code_url, :edition_id

  # Return the author picture URL, if present
  def author_picture_url
    @author_picture_url ||= begin
      if self.author_screenname
        "http://twitter.com/api/users/profile_image/#{self.author_screenname}"
      else
        image_path("default-avatar.png")
      end
    end
  end

  # Return the author URL, if present
  def author_url
    @author_url ||= begin
      "http://twitter.com/#{self.author_screenname}" if self.author_screenname
    end
  end

  def authors=(data)
    self[:authors] = (data || []).map { |a| Talk.new(a) }
  end

  # Return the object as a Hash
  def as_json
    attributes
  end
end
