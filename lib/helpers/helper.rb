def current_user
  !session[:uid].nil?
end

def expand_url(url)
  result = Curl::Easy.perform(url) do |curl|
    curl.head = true
    curl.follow_location = true
  end
  result.last_effective_url
end

def restore_session(uid)
  
end


# Examples from https://raw.githubusercontent.com/taf2/curb/d2949196a832ad6338bf51608d953fb12c864974/samples/downloader.rb
def delete_dowload(urls)
  urls.each do|url|
    filename = url.split(/\?/).first.split(/\//).last
    File.unlink("data/#{filename}") if File.exist?("data/#{filename}")
  end
end


# first sequential
def download_sequential(urls)
  easy = Curl::Easy.new
  easy.follow_location = true

  urls.each do|url|
    easy.url = url
    filename = url.split(/\?/).first.split(/\//).last
    print "'#{url}' :"
    File.open("data/#{filename}", 'wb') do|f|
      easy.on_progress {|dl_total, dl_now, ul_total, ul_now| print "="; true }
      easy.on_body {|data| f << data; data.size }   
      easy.perform
      puts "=> '#{filename}'"
    end
  end
end


# using multi interface
def download_parallel(urls)
  Curl::Multi.download(urls){|c,code,method| 
    filename = c.url.split(/\?/).first.split(/\//).last
    puts "=> '#{filename}'"
  }
end
