require 'test_helper'
include Rake::DSL

class LinkTest < ActiveSupport::TestCase
  test "link url must be http or ftp" do
    link1 = Link.new(:original => "http://help.ubuntu.com/community/WifiDocs")
    assert link1.valid? 
    link2 = Link.new(:original => "https://help.ubuntu.com/community/WifiDocs")
    assert link2.valid? 
    link3 = Link.new(:original => "ftp://ftp.mozilla.org/pub/firefox/releases/7.0b6/linux-x86_64/en-US/firefox-7.0b6.tar.bz2")
    assert link3.valid?
    link4 = Link.new(:original => "http://help.ubuntu")
    assert link4.invalid?
    link5 = Link.new(:original => "help.ubuntu.com/community/WifiDocs")
    assert link5.invalid?
    link6 = Link.new(:original => "gopher://mydomain.co/link/link/")
    assert link6.invalid?
  end

#  test "link must be longer than basename" do
#    link1 = Link.new
#    link1.original = "http://www.site.it/"
#    (Rails.application.config.server_name[:host].length 
#     + Rails.application.config.hash_length
#     - "http://www.site.it/".length).times do |i|
#       link1.original += "a"  
#    end
#    assert link1.valid?, "link1 #{link1.original.length}"

#    link2 = Link.new
#    link2.original = "http://www.site.com/"
#    (Rails.application.config.server_name[:host].length 
#     + (Rails.application.config.hash_length)
#     - "http://www.site.com/".length - 2).times do |i|
#      link2.original += "a"
#    end
#    assert link2.invalid?, "link2 #{link2.original.length}"
#  end

  test "link must not contain basename" do
    hash_length = Rails.application.config.hash_length
    server_name = Rails.application.config.server_name[:host]

    link1 = Link.new
    link1.original = "http://" + server_name + "/aa"
    hash_length.times do |i|
      link1.original += "a"
    end
    assert link1.invalid?, "link1 #{link1.original}"

    link2 = Link.new
    link2.original = "http://www.google.com/"
    (server_name.length + hash_length).times do |i|
      link2.original += "a"
    end
    assert link2.valid?, "link2 #{link2.original}"
  end
end
