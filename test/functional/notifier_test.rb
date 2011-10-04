require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "links_created" do
    mail = Notifier.links_created
    assert_equal "Links created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
