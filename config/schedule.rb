# Schedule
#

every 1.days, :at => '4:00 am' do
  runner "Notifier.links_created"
end
