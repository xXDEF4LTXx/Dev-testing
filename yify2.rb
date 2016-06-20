require 'open-uri'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require'json'
require'colorize'
module Yify
   class << self
    public
     def Search(movie)
         x=0
         url = "https://yts.ag/api/v2/list_movies.json?query_term=#{movie}"
         data = response = HTTParty.get(url).parsed_response
         puts data['data']['movie_count']
         puts  "Title:#{data['data']['movies'][x]['title']}"
         puts  "ID:#{data['data']['movies'][x]['id']}"
         puts  "Url:#{data['data']['movies'][x]['url']}"
         puts  "Imdb Code:#{data['data']['movies'][x]['imdb_code']}"
         puts  "Title English:#{data['data']['movies'][x]['title_english']}"
         puts  "Title Long:#{data['data']['movies'][x]['title_long']}"
         puts  "Slug:#{data['data']['movies'][x]['slug']}"
         puts  "Year:#{data['data']['movies'][x]['year']}"
         puts  "Rating:#{data['data']['movies'][x]['rating']}"
         puts  "Runtime:#{data['data']['movies'][x]['runtime']}"
         puts  "Genre:#{data['data']['movies'][x]['genres']}"
         puts  "Summary:#{data['data']['movies'][x]['summary']}"
         puts  "description full:#{data['data']['movies'][x]['description_full']}"
         puts  "Synopsis:#{data['data']['movies'][x]['synopsis']}"
         puts  "YT Trailer_code#{data['data']['movies'][x]['yt_trailer_code']}"
         puts  "Language:#{data['data']['movies'][x]['language']}"
         puts  "Mpa Rating:#{data['data']['movies'][x]['mpa_rating']}"
         puts  "Background Imagedata:#{data['data']['movies'][x]['background_image']}"
         puts  "Background Image Original:#{data['data']['movies'][x]['background_image_original']}"
         puts  "Small Cover Image:#{data['data']['movies'][x]['small_cover_image']}"
         puts  "Medium Cover Image:#{data['data']['movies'][x]['medium_cover_image']}"
         puts  "large_cover_image:#{data['data']['movies'][x]['large_cover_image']}"
         puts  "State:#{data['data']['movies'][x]['state']}"
         puts  "Hash:#{data['data']['movies'][x]['torrents'][x]['hash']}"
         puts  "URL:#{data['data']['movies'][x]['torrents'][x]['url']}"
         puts  "Quality:#{data['data']['movies'][x]['torrents'][x]['quality']}"
         puts  "Seeds:#{data['data']['movies'][x]['torrents'][x]['seeds']}"
         puts  "Peers:#{data['data']['movies'][x]['torrents'][x]['peers']}"
         puts  "Size:#{data['data']['movies'][x]['torrents'][x]['size']}"
         puts  "Date Uploaded:#{data['data']['movies'][x]['torrents'][x]['date_uploaded']}"
         puts  "Date Uploaded Unix:#{data['data']['movies'][x]['torrents'][x]['date_uploaded_unix']}"
         puts  "Size Bytes:#{data['data']['movies'][x]['torrents'][x]['size_bytes']}"
         puts  "Size Bytes:#{data['data']['movies'][x]['torrents'][x]['size_bytes']}"

    end
    def Quality(quality)
         url = "https://yts.ag/api/v2/list_movies.json?quality=#{quality}"
         data = response = HTTParty.get(url).parsed_response
         begin
         for i in 0..20
         begin
         puts  "Title:#{data['data']['movies'][i]['title']}"
         rescue NoMethodError
         i+=1
         end
    end
         
    def Download(movie)
         x=0
         url = "https://yts.ag/api/v2/list_movies.json?query_term=#{movie}"
         data = response = HTTParty.get(url).parsed_response
         file= "#{data['data']['movies'][x]['torrents'][x]['url']}"
         name="#{data['data']['movies'][x]['title']}"
         puts"Downloading #{name}........."
            open("#{file}") {|f|
               File.open("#{name}.torrent","wb") do |file|
               file.puts f.read
            end
                
            }
    end
    
    def Limit(limit)
         url = "https://yts.ag/api/v2/list_movies.json?limit=#{limit}"
         data = response = HTTParty.get(url).parsed_response
         begin
         for i in 0..20
         begin
         puts  "Title:#{data['data']['movies'][i]['title']}"
         rescue NoMethodError
         i+=1
         end
         end
    end
         
    
    
    def Suggestion(movie)
         x=0
         count=0
         zero=0
         url = "https://yts.ag/api/v2/list_movies.json?query_term=#{movie}"
         data = response = HTTParty.get(url).parsed_response
         suggestion="#{data['data']['movies'][x]['id']}"
         url = "https://yts.ag/api/v2/movie_suggestions.json?movie_id=#{suggestion}"
         data1 = response = HTTParty.get(url).parsed_response
         count="#{data1['data']['movie_count']}"
         puts"Movie Count:#{count}"
         #puts"=================================================================="
         #puts  "Title:#{data1['data']['movies'][x]['title']}"
         #puts  "ID:#{data1['data']['movies'][x]['id']}"
         #puts  "Url:#{data1['data']['movies'][x]['url']}"
         #puts  "Imdb Code:#{data1['data']['movies'][x]['imdb_code']}"
         #puts  "Title English:#{data1['data']['movies'][x]['title_english']}"
         #puts  "Title Long:#{data1['data']['movies'][x]['title_long']}"
         #puts  "Slug:#{data1['data']['movies'][x]['slug']}"
         #puts  "Year:#{data1['data']['movies'][x]['year']}"
         #puts  "Rating:#{data1['data']['movies'][x]['rating']}"
         #puts  "Runtime:#{data1['data']['movies'][x]['runtime']}"
         #puts  "Genre:#{data1['data']['movies'][x]['genres']}"
         #puts  "Summary:#{data1['data']['movies'][x]['summary']}"
         #puts  "Mpa Rating:#{data1['data']['movies'][x]['mpa_rating']}"
         #puts"==================================================================" 
        end
    end
    def Genre(genre)
         url = "https://yts.ag/api/v2/list_movies.json?genre=#{genre}"
         data = response = HTTParty.get(url).parsed_response
         begin
         for i in 0..100
         begin
         puts  "Title:#{data['data']['movies'][i]['title']}"
         rescue NoMethodError
         i+=1
         end
    end
    def Rating(b)
        url = "https://yts.ag/api/v2/list_movies.json?minimum_rating=#{b}"
        data = response = HTTParty.get(url).parsed_response
        begin
            for i in 0..10
            begin
            puts  "Title:#{data['data']['movies'][i]['title']}"
            rescue NoMethodError
            i+=1
            end
            end
    end
        
    def OrderbyAsc()
            url = "https://yts.ag/api/v2/list_movies.json?order_by=asc"
            data = response = HTTParty.get(url).parsed_response
            begin
            for i in 0..10
            begin
            puts  "Title:#{data['data']['movies'][i]['title']}"
            rescue NoMethodError
            i+=1
            end
            end
    end
    def OrderbyDesc()
            url = "https://yts.ag/api/v2/list_movies.json?order_by=asc"
            data = response = HTTParty.get(url).parsed_response
            begin
            for i in 0..5
            begin
            puts  "Title:#{data['data']['movies'][i]['title']}"
            rescue NoMethodError
            i+=1
            end
            end
    end
            
           
    def Sortby(sortby)
         url = "https://yts.ag/api/v2/list_movies.json?sort_by=#{sortby}"
         data = response = HTTParty.get(url).parsed_response
         begin
         for i in 0..100
         begin
         puts  "Title:#{data['data']['movies'][i]['title']}"
         rescue NoMethodError
         i+=1
         end
    end
end 
end
end 
end 
end
end
end
end
end 
end 
end 
