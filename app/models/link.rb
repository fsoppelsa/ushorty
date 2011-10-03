class Link < ActiveRecord::Base

  validates_format_of :original, :with => URI::regexp(%w(http https))  

  public

  def complete_hashed_url
    return "http://" + Rails.application.config.server_name[:host] + "/" + self.hashed
  end
end
