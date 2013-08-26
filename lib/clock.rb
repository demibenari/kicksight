require 'clockwork'
require './config/boot'
require './config/environment'

require File.dirname(__FILE__) + '/kick_project_crawler'

include Clockwork

kick_crawler = KickProjectCrawler.new


handler do |job|
  puts "Running #{job}"
end

every(30.seconds, 'crawl_job.job') {
  kick_crawler.get_pledges_status('http://www.kickstarter.com/projects/aharburg/gregorian-chant-modes-album')
}
#every(3.minutes, 'less.frequent.job')
#every(1.hour, 'hourly.job')

#every(1.day, 'midnight.job', :at => '00:00')
