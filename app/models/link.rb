class Link < ActiveRecord::Base
  @@minimum_length = Rails.application.config.server_name[:host].length +
        Rails.application.config.hash_length + "http:///".length
  @@hostname = Rails.application.config.server_name[:host]

  # Input original must be a http(s) or ftp valid link
  validates_presence_of :original
  validates_format_of :original, :with => URI::regexp(%w(http https ftp))  
  # ..it must be longer than shorter link, otherwise is useless
  validates_length_of :original, :minimum => @@minimum_length
  # ... must not be recursive
  validate :original_must_not_be_recursive
  
  public

  def complete_hashed_url
    return "http://" + Rails.application.config.server_name[:host] + "/" + self.hashed
  end

  def original_length
    return self.original.length
  end

  private

  def original_must_not_be_recursive
    errors.add(:original, "recursive") if original.include?(Rails.application.config.server_name[:host].to_s)
  end
end
