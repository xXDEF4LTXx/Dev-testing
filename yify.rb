require 'net/http'
require 'json'
require 'httparty'
module Yify
  class << self
    public
	def Search(movie)
		 response = Net::HTTP.get(URI("http://yts.ag/api/v2/list_movies.json?query_term= + #{movie}"))
         return response
    end
    def SearchGenre(genre)
    	 response = Net::HTTP.get(URI("http://yts.ag/api/v2/list_movies.json?genre= + #{genre}"))
         return response
         #idk if this is needed at all or in the future
         #genre=[Action, Comedy,Family,History,Mystery,Sci-Fi,War,Adventure,Crime,Fantasy,Horror,News,Sport,Western,Animation,Documentary,Film-Noir,Music,Biography,Drama,Muscial,Thriller,Thriller]
    end
    def Data(data)
         #couldnt get it to work
         data=  JSON.parse(data)
    end
    def SearchLimit(limit)
         response = Net::HTTP.get(URI("http://yts.ag/api/v2/list_movies.json?page= + #{lmit}"))
         return response
    end
    def SearchQuality(p)
         response = Net::HTTP.get(URI("http://yts.ag/api/v2/list_movies.json?quality= + #{p}"))
         return response
         quality=['720p,1080p,3D']
    end
    def SearchSort_By(sorts)
         response = Net::HTTP.get(URI("http://yts.ag/api/v2/list_movies.json?sort_by= + #{sort}"))
         return response
    end 
    def SuggestionsMovie_id(id)
         response = Net::HTTP.get(URI("http://yts.ag/api/v2/movie_suggestions.json?movie_id= + #{id}"))
         return response
    end
    #MD= Movie_details
    def MD_Info(info)
         response = Net::HTTP.get(URI("http://yts.ag/api/v2/movie_details.json?movie_id= + #{info}"))
         return response
    end
    def MD_Cast(cast)
        response = Net::HTTP.get(URI("https://yts.ag/api/v2/movie_details.json?movie_id= #{cast} + &with_cast=true"))
         return response
    end
    def  MD_Images(images) 
         response = Net::HTTP.get(URI("https://yts.ag/api/v2/movie_details.json?movie_id= #{images} + &with_images=true"))
         return response
    end 
    #ic=Images&Cast
    def  MD_ImageAndCast(ic)
         response = Net::HTTP.get(URI("https://yts.ag/api/v2/movie_details.json?movie_id= #{cast} + &with_images=true&with_cast=true"))
         return response
    end
end 
end 





























