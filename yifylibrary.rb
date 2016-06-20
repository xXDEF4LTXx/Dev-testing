begin

module Yify
   class << self
    public
     def Search(movie)

        x=0
        xx=0
        verifynumeric=0
        url = "http://yify.is/api/v2/list_movies.json?query_term=#{movie}"
        data = response = HTTParty.get(url).parsed_response
        movcount=data['data']['movie_count'].to_i
        while xx < movcount
          puts "\n\n#{xx}) #{data['data']['movies'][xx]['title']}\n\n".blue
          xx+=1
        end
        puts "\n\nEnter Number Of Selected Movie To Gather Its Information:\n\n".green
        op = gets.chomp
        while verifynumeric < 1
          if op =~ /^-?[0-9]+$/
            verifynumeric+=1
            opt=op.to_i
          else
            puts "\nNumbers only, try again!\n".red
          end
        end

        title2="#{data['data']['movies'][opt]['title']}".gsub(' ', '+')
        hash= data['data']['movies'][opt]['torrents'][0]['hash']
        magneturl="magnet:?xt=urn:btih:#{hash}&dn=#{title2}&tr=http://open.demonii.com:1337/announce&tr=http://tracker.openbittorrent.com:80"
        puts  "\nState: #{data['data']['movies'][opt]['state']}".green
        puts  "\nTitle: #{data['data']['movies'][opt]['title']}".green
        puts  "\nID: #{data['data']['movies'][opt]['id']}".green
        puts  "\nURL: #{data['data']['movies'][opt]['url']}".green
        puts  "\nIMDB Code: #{data['data']['movies'][opt]['imdb_code']}".green
        puts  "\nTitle English: #{data['data']['movies'][opt]['title_english']}".green
        puts  "\nTitle Long: #{data['data']['movies'][opt]['title_long']}".green
        puts  "\nSlug: #{data['data']['movies'][opt]['slug']}".green
        puts  "\nYear Of Release: #{data['data']['movies'][opt]['year']}".green
        puts  "\nRating: #{data['data']['movies'][opt]['rating']}".green
        puts  "\nRuntime: #{data['data']['movies'][opt]['runtime']}".green
        puts  "\nGenre: #{data['data']['movies'][opt]['genres']}".green
        puts  "\nSummary: #{data['data']['movies'][opt]['summary']}".green
        puts  "\nDescription Full: #{data['data']['movies'][opt]['description_full']}".green
        puts  "\nSynopsis: #{data['data']['movies'][opt]['synopsis']}".green
        puts  "\nYouTube Trailer: www.YouTube.com/watch?v=#{data['data']['movies'][opt]['yt_trailer_code']}".green
        puts  "\nLanguage: #{data['data']['movies'][opt]['language']}".green
        puts  "\nMPA Rating: #{data['data']['movies'][opt]['mpa_rating']}".green
        puts  "\nBackground Image: #{data['data']['movies'][opt]['background_image']}".green
        puts  "\nBackground Image Original: #{data['data']['movies'][opt]['background_image_original']}".green
        puts  "\nSmall Cover Image: #{data['data']['movies'][opt]['small_cover_image']}".green
        puts  "\nMedium Cover Image: #{data['data']['movies'][opt]['medium_cover_image']}".green
        puts  "\nLarge Cover Image: #{data['data']['movies'][opt]['large_cover_image']}".green
        puts  "\nHash: #{data['data']['movies'][opt]['torrents'][0]['hash']}".green
        puts  "\nMagnet URL: #{magneturl}".green
        puts  "\nQuality: #{data['data']['movies'][opt]['torrents'][0]['quality']}".green
        puts  "\nSeeds: #{data['data']['movies'][opt]['torrents'][0]['seeds']}".green
        puts  "\nPeers: #{data['data']['movies'][opt]['torrents'][0]['peers']}".green
        puts  "\nSize: #{data['data']['movies'][opt]['torrents'][0]['size']}".green
        puts  "\nDate Uploaded: #{data['data']['movies'][opt]['torrents'][0]['date_uploaded']}".green
        puts  "\nDate Uploaded Unix: #{data['data']['movies'][opt]['torrents'][0]['date_uploaded_unix']}".green
        puts  "\nSize Bytes: #{data['data']['movies'][opt]['torrents'][0]['size_bytes']}".green

      end
    def Download(search)
      begin
         goterror=0
         x=0
         y=0
         verifynumeric=0
         url = "http://yify.is/api/v2/list_movies.json?query_term=#{search}"
         data = response = HTTParty.get(url).parsed_response
         mov= data['data']['movies'].count
         movies=mov
         while y<mov
           puts "\n#{y}) #{data['data']['movies'][y]['title']}\n".blue
           y+=1
         end
         while verifynumeric < 1
           puts "\nEnter Number Of Selected Movie:\n\n".blue
           op = gets.chomp
           if op =~ /^-?[0-9]+$/
             verifynumeric+=1
           else
             puts "\nNumbers only, try again!\n".red
           end
         end
         opt=op.to_i
         movie = "#{data['data']['movies'][opt]['title']}".gsub(' ', '+').to_s
         hash= data['data']['movies'][opt]['torrents'][0]['hash']
         name = "#{data['data']['movies'][opt]['title']}.torrent"
         puts "\nFile: #{name}\n\n".green
         link= "magnet:?xt=urn:btih:#{hash}&dn=#{movie}&tr=http://open.demonii.com:1337/announce&tr=http://tracker.openbittorrent.com:80"
         agent = Mechanize.new
         agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
         page = agent.get('http://magnet2torrent.com/')
         entry_form = agent.page.forms[0]
         agent.page.forms[0]['magnet']=link
         agent.page.forms[0].submit
         slash = "#{agent.page.uri}".gsub("http://torcache.net/torrent/", '')
         Net::HTTP.start("torcache.net") do |http|
             resp = http.get("/torrent/#{slash}")
             open(name, "wb") do |file|
                 file.write(resp.body)
             end
         end
       rescue Exception => yerror
         puts "\n\nInvalid option. Or other error.\n\n".red
         goterror+=1
       end
       if goterror==0
         puts "#{data['data']['movies'][opt]['title']} torrent file has finished downloading.".green
       elsif goterror > 0
         puts "\n\nTorrent file did not download.\n\n".red
       end
    end
  end
end
rescue Exception => yiferror2
  puts "\n\nError occured.\n\n".red
end
