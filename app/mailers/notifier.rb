require 'rubygems'
require 'active_support/all'

class Notifier < ActionMailer::Base
  default :from => "ushorty@example.com"

  @new_links = Array.new
  now = Time.now
  Link.where("created_at > ?", now.yesterday).each do |link| 
    @new_links << link
  end

  def links_created
    mail :to => ActionMailer::Base.default[:admin]
  end
end
