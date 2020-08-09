class DownloadTweetWorker
	include Sidekiq::Worker
  sidekiq_options retry: 3
	
  def perform(id)
    puts "Performing..."
    # User.find(id).process_data
	end
  
end