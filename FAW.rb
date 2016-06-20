begin
  require './relatives'
  persistence=1
  puts"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  while persistence > 0
	puts"FFFFFFFFFFFFFFFFFFFFFF     AAA    WWWWWWWW                           WWWWWWWW".blue
	puts"F::::::::::::::::::::F    A:::A   W::::::W                           W::::::W".blue
  w="e"
	puts"F::::::::::::::::::::F   A:::::A  W::::::W                           W::::::W".blue
  o="K"
  puts"FF::::::FFFFFFFFF::::F  A:::::::A W::::::W                           W::::::W".blue
	puts"F:::::F       FFFFFF   A:::::::::A W:::::W           WWWWW           W:::::W".blue
	puts"F:::::F               A:::::A:::::A W:::::W         W:::::W         W:::::W".blue
	puts"F::::::FFFFFFFFFF    A:::::A A:::::A W:::::W       W:::::::W       W:::::W".blue
	puts"F:::::::::::::::F   A:::::A   A:::::A W:::::W     W:::::::::W     W:::::W".blue
  t="y"
	puts"F:::::::::::::::F  A:::::A     A:::::A W:::::W   W:::::W:::::W   W:::::W".blue
	puts"F::::::FFFFFFFFFF A:::::AAAAAAAAA:::::A W:::::W W:::::W W:::::W W:::::W".blue
  hgf=Base64.decode64("YTJjeU0zTm5PVWhvTW0xemFFTlZXVzlaTTBOVWRrb3lkRk5qVm5BeFp6VnJW
  SEZxYzI1TWFGWlNkSGhNClpGcFdaelU9")
	puts"F:::::F          A:::::::::::::::::::::A W:::::W:::::W   W:::::W:::::W".blue
	puts"F:::::F         A:::::AAAAAAAAAAAAA:::::A W:::::::::W     W:::::::::W".blue
	puts"FF::::::FF     A:::::A             A:::::A W:::::::W       W:::::::W".blue
	puts"F::::::::FF   A:::::A               A:::::A W:::::W         W:::::W".blue
	puts"F::::::::FF  A:::::A                 A:::::A W:::W           W:::W".blue
	puts"FFFFFFFFFFF AAAAAAA                   AAAAAAA WWW             WWW".blue
  iiiuy=Base64.decode64(hgf)
  response = Unirest.post "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=famous",
    headers:{
      "X-Mashape-#{o}#{w}#{t}" => "#{iiiuy}",
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    }
  parse = JSON.parse(response.raw_body)
  puts"\n#{parse['quote']} \n- #{parse['author']}"
	puts
	puts
	puts "1) Modules 2) Credits - Type your option number.\n".green
	choice = gets.chomp
  puts
	if choice.to_s == "1"
  		puts "Modules - Type module number.".blue
  		puts "_____________________________\n".red
  		puts
  		puts"1> Webpage cloning.\n".blue
  		puts"2> Email scrape from URL.\n".blue
  		puts"3> URL Info grabber.\n".blue
      puts"4> SQLI Scanner: \n this module uses your entered google dork\n to search google for basic vulnerable\n websites.\n".blue
      puts"5> Check online databases to see if your \ninformation has been breached.\nA breach means that your entered\nusername or email has appeared in\nsome leaked details.\nA breach can be sensitive or non.\nThis means plain-text passwords etc.\n".blue
      puts"6> Create a dox automatically.\nThis requires sufficient information \nbefore creation of dox.\n".blue
      puts"7> Phone number info.\nIncludes blacklist check.\n".blue
      puts"8> IP To Location.\n".blue
      puts"9> Port checker for IP or website.\n".blue
      puts"10> Fake info generator.\n".blue
      puts"11> Xbox Account Info By Gamertag.\n".blue
      puts"12> Link shortener.\n".blue
      puts"13> Yify Movie Information Grabber\n And Movie Torrent File Downloader.\n".blue
      choice1 = gets.chomp
  		if choice1 == "1"
			puts
    			puts "Use 'www.' and don't use 'http://'.".red
    			puts "Enter target URL: ".blue
    			targ = gets.chomp.to_s
          target = URI"http://#{targ}"
          puts "Enter Folder Name To Create And Save Files To.\nThis folder will be nested in the active directory.\nFolder name: \n"
          folder = gets.chomp
          Dir.mkdir(folder) unless File.exists?(folder)
    			puts
    			puts "Initializing...".red
    			sleep 1
    			puts "Loading ammunition...".blue
    			sleep 1
    			puts "Fire!".green
    			sleep 1
          puts 'a'
          Spidr.site(target) do |spider|
            puts 'b'
    			spider.every_page do |crawled|
            puts 'c'
          puts crawled.url
          puts 'd'
    			source = open(crawled.url).read
          Dir.chdir(folder) do
            File.open("#{crawled.url}.html", 'w') { |file| file.write(source) }
          end
          puts
    			puts "Website cloned and saved in active directory.".green
          end
          end
          puts " "
          mm=gets.chomp

  		elsif choice1.to_s == "2"
			puts
			puts "Don't use 'http://'. Use 'www.'.".red
			print"Enter site you want to scrape emails: ".blue
			target=gets.chomp
      puts "Name of the file to save results to:\n"
      filenames=gets.chomp
			puts
   		puts "Initializing...".red
    	sleep 1
  		puts "Loading ammunition...".blue
 		  sleep 1
      puts "Fire!".green
      sleep 1
			puts
			uri = URI("http://"+target.to_s)
			$stderr.puts "Scanning: #{uri}"
			Spidr.site(uri) do |spider|
			spider.every_page do |crawled_page|
			puts "#{crawled_page.url}".blue
			crawled_page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/).each do |address|
			puts"#{address}".green

			CSV.open("#{filenames}.csv", "a") do |csv|
				csv << ["#{address}"]
		    	end
          puts " "
          mm=gets.chomp

			end
			end
			end
	 	elsif choice1.to_s == "3"
			puts
			puts"Enter URL: ".blue
			target = gets.chomp.to_s
			puts
   		puts "Initializing...".red
    	sleep 1
  		puts "Loading ammunition...".blue
 			sleep 1
      puts "Fire!".green
      sleep 1
			puts
  		ip = Resolv.getaddress target
			ips = Resolv.getaddresses target
			hname = Resolv.getnames ip
			puts "First IP listed: #{ip}".green
			puts "All listed IPs: #{ips}".green
			puts "All listed hostnames: #{hname}".green
    elsif choice1.to_s == "4"
      begin
            puts
            puts "Initializing...".red
            sleep 1
            puts "Loading ammunition...".blue
            sleep 1
            puts "Fire!".green
            sleep 1
            puts
            agent = Mechanize.new
            agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
            counting = 0
            #agent.user_agent_alias = 'Mechanize'
            #agent.set_proxy '78.186.178.153', 808
            agent.history.clear
            page = agent.get('http://www.google.com/')
            google_form = page.form('f')
            puts "Overuse of this module will block your ip with google captcha.\nUsing a VPN is recommended.".red
            puts
            puts "Enter SQLI Dork: \n".blue
            dork = gets.chomp.to_s
            puts
            google_form.q = dork.to_s

            page = agent.submit(google_form, google_form.buttons.first)
            page.links.each do |link|
            page2 = agent.get("#{page.uri}&start=10")
            page2.links.each do |link|
            page3 = agent.get("#{page.uri}&start=20")
            page3.links.each do |link|

              if link.href.to_s =~/url.q/
                str=link.href.to_s
                strList=str.split(%r{=|&})
                url=strList[1]
                puts "#{url}\n".blue
                checkur = url.gsub("%3F", "?")
                checkurr = checkur.gsub("%3D", "=")
                checkurl = checkur
                #puts "#{page.uri}".green
                begin
                  #ax = checkurl.scan('https://facebook')
                  #if ax.to_s == '["https://facebook"]'
                  #  checkurl = 'http://lol.com/gjouyhju.php?id=3'#throw 404 to prevent SSL error
                  #end
                  source = open(checkurl, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
                  aa=source.scan('You have an error in your SQL syntax')
                  a= aa.to_s
                  if a == '["You have an error in your SQL syntax"]'
                      puts "Vulnerability possible\n".green
                      counting+=1
                      url2 = "\n #{url.to_s} \n"
                      towrite = "\n #{url2} \n"
                      file = 'SQL.txt'
                      File.open(file, 'a') { |file| file.write(towrite) }
                  else
                      puts "No basic vulnerability\n".red
                  end
                rescue OpenURI::HTTPError => err
                      puts "Error in link or network\n".red
                      File.open("error2.log", 'a') { |file| file.write("\n\n#{err}\n\n") }
                end

              end
            end
            end
            end
            puts "All #{counting} vulnerable links have been entered into SQL.txt."
      rescue Exception => er
        time1 = Time.new
        logtime = "Error Time : " + time1.inspect
        #File.open('SQLerror.log', 'a') { |file| file.write("\n"+logtime.to_s+"\n") }
        err = er.inspect
        err2 = er.backtrace
        err3 = "#{err}\n\n#{err2}".to_s
        File.open("SQLError.log", 'a') {|file| file.write("\n\n#{err3}\n\n")}
      end
      puts " "
      mm=gets.chomp
    elsif choice1.to_s == "5"
      begin
        puts "\nEnter your username or email address to be checked\nthrough the databases:\n".blue
        checkdetail=gets.chomp.to_s
        puts "\nEnter file name to save results to:\n\n"
        filename=gets.chomp
        url=URI.parse("https://haveibeenpwned.com/api/v2/breachedaccount/#{checkdetail}")
        output = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
        result = JSON.parse output.readlines.join("")
      rescue OpenURI::HTTPError => err
        puts "\nHTTP Error -- Likely that no results were found for entered username/email."
      end
      puts "\nBreaches".green
      puts "--------\n".red
      count = result.count
      breachnum=0
      x=0
      puts "Amount of breaches: #{result.count}".red
      File.open("#{filename}.txt", 'a') { |file| file.write("\nAmount of breaches: #{result.count}\n") }
      while breachnum < count
        breachnum+=1
        puts "\nTitle of data breach number #{breachnum}: #{result[x]['Title']}".green
        File.open("#{filename}.txt", 'a') { |file| file.write("\nTitle of data breach number #{breachnum}: #{result[x]['Title']}\n") }
        puts "\nName of data breach number #{breachnum}: #{result[x]['Name']}".red
        File.open("#{filename}.txt", 'a') { |file| file.write("\nName of data breach number #{breachnum}: #{result[x]['Name']}\n") }
        puts "\nDomain of data breach number #{breachnum}: #{result[x]['Domain']}".blue
        File.open("#{filename}.txt", 'a') { |file| file.write("\nDomain of data breach number #{breachnum}: #{result[x]['Domain']}\n") }
        puts "\nDate breach number #{breachnum} added to breach database: #{result[x]['AddedDate']}\n".green
        File.open("#{filename}.txt", 'a') { |file| file.write("\nDate breach number #{breachnum} added to breach database: #{result[x]['AddedDate']}") }
        puts "\nData types of breach number #{breachnum}: #{result[x]['DataClasses']}".red
        File.open("#{filename}.txt", 'a') { |file| file.write("\nData types of breach number #{breachnum}: #{result[x]['DataClasses']}\n") }
        puts "\nData sensitive in breach number #{breachnum}? #{result[x]['IsSensitive']}".blue
        File.open("#{filename}.txt", 'a') { |file| file.write("\nData sensitive in breach number #{breachnum}? #{result[x]['IsSensitive']}\n") }
        x+=1
      end
      puts " "
      mm=gets.chomp
    elsif choice1.to_s == "6"
      puts "\n\nEnter Target First Name:\n".blue
      j="a"
      fname=gets.chomp
      o="k"
      puts "Enter Target Last Name:\n".blue
      i="p"
      lname=gets.chomp
      w="e"
      puts "Enter A Keyword For Target:\n".blue
      k="i"
      keyword=gets.chomp
      #puts "Enter Target Workplace:\n"
      t="y"
      #wplace=gets.chomp
      a= Base64.decode64("TTJWamF6VmpZalJoWW1KaFpEWmlZMkU1TUdZeU56WTBNR016TmpNeU56QTJa
V0Uz")

      b = Base64.decode64(a)
      hgf=Base64.decode64("YTJjeU0zTm5PVWhvTW0xemFFTlZXVzlaTTBOVWRrb3lkRk5qVm5BeFp6VnJW
      SEZxYzI1TWFGWlNkSGhNClpGcFdaelU9")
      oo="K"
      iiiuy=Base64.decode64(hgf)
      response = Unirest.get "https://rocketreach-co.p.mashape.com/search?#{j}#{i}#{k}_#{o}#{w}#{t}=#{b}&name=#{fname}+#{lname}&keyword=#{keyword}",
        headers:{
          "X-Mashape-#{oo}#{w}#{t}" => "iiiuy",
          "Accept" => "application/json"
        }

      parse = response.body
      File.open("Dox.txt", 'a') { |file| file.write("\n#{Time.now}\n-------------------------\n") }
      puts "Response: #{response.code}".green
      File.open("Dox.txt", 'a') { |file| file.write("\nResponse: #{response.code}\n") }
      counts = parse['profiles'].count
      x=1
      while x < counts
        puts "\nResult #{x}".green
        puts "-----------".blue
        File.open("Dox.txt", 'a') { |file| file.write("\nResult #{x}\n-----------\n") }
        puts "\nID: #{parse['profiles'][x]['id']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nID: #{parse['profiles'][x]['id']}\n") }
        puts "\nName: #{parse['profiles'][x]['name']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nName: #{parse['profiles'][x]['name']}\n") }
        puts "\nPic: #{parse['profiles'][x]['profile_pic']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nPic: #{parse['profiles'][x]['profile_pic']}\n") }
        puts "\nLinks: #{parse['profiles'][x]['links']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nLinks: #{parse['profiles'][x]['links']}\n") }
        puts "\nPostal Code: #{parse['profiles'][x]['postal_code']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nPostal Code: #{parse['profiles'][x]['postal_code']}\n") }
        puts "\nCity: #{parse['profiles'][x]['city']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nCity: #{parse['profiles'][x]['city']}\n") }
        puts "\nLocation: #{parse['profiles'][x]['location']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nLocation: #{parse['profiles'][x]['location']}\n") }
        puts "\nRegion: #{parse['profiles'][x]['region']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nRegion: #{parse['profiles'][x]['region']}\n") }
        puts "\nTitle: #{parse['profiles'][x]['current_title']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nTitle: #{parse['profiles'][x]['current_title']}\n") }
        puts "\nCurrent Employer: #{parse['profiles'][x]['current_employer']}".green
        File.open("Dox.txt", 'a') { |file| file.write("\nCurrent Employer: #{parse['profiles'][x]['current_employer']}\n") }
        puts "\nSummary: #{parse['profiles'][x]['summary']}\n\n".gsub('</b>', '').gsub('<b>', '').gsub('<br>', '').gsub('&#39', '').gsub('&nbsp', '').green
        write = "Summary: #{parse['profiles'][x]['summary']}".gsub('</b>', '').gsub('<b>', '').gsub('<br>', '').gsub('&#39', '').gsub('&nbsp', '')
        File.open("Dox.txt", 'a') { |file| file.write("\n #{write}\n") }
        x+=1
      end
      puts "Saved response to 'Dox.txt'.".green
      puts " "
      mm=gets.chomp
    elsif choice1.to_s == "7"
      hgf=Base64.decode64("YTJjeU0zTm5PVWhvTW0xemFFTlZXVzlaTTBOVWRrb3lkRk5qVm5BeFp6VnJW
      SEZxYzI1TWFGWlNkSGhNClpGcFdaelU9")
      puts "\n\nEnter phone number with '+(country_code).\nExample: +1-2345-678-9.\nDon't use dashes '-'.\nNumber:\n\n".blue
      w="e"
      phone=gets.chomp.gsub('-', '').gsub(' ', '').gsub('+', '')
      o="K"
      t="y"
      iiiuy=Base64.decode64(hgf)
      response = Unirest.get "https://phone-validation.p.mashape.com/%2B#{phone}",
        headers:{
          "X-Mashape-#{o}#{w}#{t}" => "#{iiiuy}",
          "Accept" => "application/json"
        }

      parse = JSON.parse(response.raw_body)
      puts "Status: #{parse['status']}\n".green
      puts "---\n".blue
      puts "Phone: #{parse['phone']}\n".green
      puts "International Number: #{parse['international']}\n".green
      puts "National Number: #{parse['national']}\n".green
      puts "Country Code: #{parse['country_code']}\n".green
      puts "Blacklisted: #{parse['blacklisted']}\n".green

    elsif choice1.to_s == "8"
      puts"\n\nIP To Collect Info:\n\n".green

      address=gets.chomp
      response = Unirest.get "https://ipapi.co/#{address}/json/"
      if address == ""
        address = "your ip (defaulted)"
      end

      puts "\nResponse code: #{response.code}\n".blue
      puts "\nResults for #{address}".green
      puts "-------------------------\n".red
      parse = response.body
      puts "IP Timezone: #{parse['timezone']}\n".green
      puts "IP Country: #{parse['country']}\n".green
      puts "IP Region: #{parse['region']}\n".green
      puts "IP City: #{parse['city']}\n".green
      puts "IP Postal Code: #{parse['postal']}\n".green
      puts "IP Latitude: #{parse['latitude']}\n".green
      puts "IP Longitude: #{parse['longitude']}\n".green
    elsif choice1.to_s == "9"
      j="a"
      pp="ah"
      ytr=Base64.decode64("Tm1SaVlXVXlOek16TnpVeE16azNOVGswWVRka1pEazVPR1kyTm1ReU9HTXdO
      V0l3WXpsaU1RPT0=")
      o="k"
      yt="hs"
      kk="r"
      i="p"
      hhh=Base64.decode64(ytr)
      nh="oh"
      w="e"
      lo="iu"
      k="i"
      puts "\n\nEnter host:\n\n".blue
      t="y"
      host=gets.chomp
      response = Unirest.get "http://pro.viewdns.info/portscan/?host=#{host}&#{j}#{i}#{k}#{o}#{w}#{t}=#{hhh}&output=json"

      x=0
      parse = JSON.parse(response.raw_body)
      puts "\nResults for #{host}".green
      puts "--------------------------".red
      while x<13
        if parse['response']['port'][x]['status'].to_s == "closed"
          puts "\nPort: #{parse['response']['port'][x]['number']} Service: #{parse['response']['port'][x]['service']} Status: #{parse['response']['port'][x]['status']}\n".red
        elsif parse['response']['port'][x]['status'].to_s == "open"
          puts "\nPort: #{parse['response']['port'][x]['number']} Service: #{parse['response']['port'][x]['service']} Status: #{parse['response']['port'][x]['status']}\n".green
        else
          puts 'Error.'
        end
        x+=1
      end
    elsif choice1.to_s == "10"
      puts "\n\nFile (name) to save details to:\n\n".blue
      filename=gets.chomp
      puts a = "\nFirst Name: #{Faker::Name.first_name.to_s}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{a}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts b = "Last Name: #{Faker::Name.last_name.to_s}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{b}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts c = "Title: #{Faker::Name.title}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{c}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts d = "Email: #{Faker::Internet.email}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{d}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts e = "Secondary Email: #{Faker::Internet.email}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{e}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts f = "City: #{Faker::Address.city}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{f}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts g = "Street Name: #{Faker::Address.street_name}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{g}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts h = "Street Address: #{Faker::Address.street_address}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{h}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts i = "Secondary Address: #{Faker::Address.secondary_address}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{i}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts j = "Zip Code: #{Faker::Address.zip_code}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{j}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts k = "Secondary Zip Code: #{Faker::Address.zip}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{k}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts l = "Postcode: #{Faker::Address.postcode}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{l}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts m = "State: #{Faker::Address.state}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{m}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts n = "Country: #{Faker::Address.country}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{n}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts o = "Bitcoin Address: #{Faker::Bitcoin.address}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{o}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts zz = "Bitcoin Testnet Address: #{Faker::Bitcoin.testnet_address}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{zz}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts q = "Credit Card Number: #{Faker::Business.credit_card_number}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{q}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts r = "Credit Card Expiry: #{Faker::Business.credit_card_expiry_date}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{r}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts s = "Credit Card Type: #{Faker::Business.credit_card_type}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{s}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts t = "Company Name: #{Faker::Company.name}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{t}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts u = "Website: #{Faker::Internet.domain_name}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{u}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts v = "Phone Number: #{Faker::Number.number(10)}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{v}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
      puts
      puts w = "Secondary Phone Number: #{Faker::PhoneNumber.cell_phone}".colorize(:color => :light_blue, :background => :red)
      File.open("#{filename}.txt", 'a') { |file| file.write("\n #{w}\n".gsub("[0;94;41m", "").gsub('[0m', '')) }
    elsif choice1.to_s == "11"
      jhg=Base64.decode64("TWpFM09UazFPRFpsWmpRNFpEWTNZV1ZsT0RWaU16UTVNMk0wWkRjNFlUWTFN
      VFppWm1NME13PT0=")
      y="X"
      puts "\n\nEnter Gamer Tag to get information:\n\n".blue
      j="u"
      jhy=Base64.decode64(jhg)
      gt=gets.chomp

      g="A"
      response = Unirest.get "https://xboxapi.com/v2/xuid/#{gt}",
        headers:{
          "#{y}-#{g}#{j}th" => "#{jhy}",
          "Content-Type" => "application/json"
        }

      xuid =  response.body
      response2 = Unirest.get "https://xboxapi.com/v2/#{xuid}/profile",
        headers:{
          "#{y}-#{g}#{j}th" => "#{jhy}",
          "Content-Type" => "application/json"
        }
      response3 = Unirest.get "https://xboxapi.com/v2/#{xuid}/presence",
        headers:{
          "#{y}-#{g}#{j}th" => "#{jhy}",
          "Content-Type" => "application/json"
        }
      response4 = Unirest.get "https://xboxapi.com/v2/#{xuid}/activity",
        headers:{
          "#{y}-#{g}#{j}th" => "#{jhy}",
          "Content-Type" => "application/json"
        }
      response5 = Unirest.get "https://xboxapi.com/v2/#{xuid}/xbox360games",
        headers:{
          "#{y}-#{g}#{j}th" => "#{jhy}",
          "Content-Type" => "application/json"
        }


      File.open("Activity.txt", 'a') { |file| file.write("\n#{Time.now}\n#{response4.raw_body}\n\n") }
      parse3 = JSON.parse(response5.raw_body)
      parse = JSON.parse(response2.raw_body)
      parse2 = JSON.parse(response3.raw_body)
      count = parse3['titles'].count
      x=0
      puts "\nBasic info".blue
      puts "----------\n".red
      puts "\nGamertag: #{parse['Gamertag']}\n".green
      puts "XUID: #{xuid}\n".green
      puts "Account type: #{parse['AccountTier']}\n".green
      puts "Gamerscore: #{parse['Gamerscore']}\n".green
      puts "Gamer pic: #{parse['GameDisplayPicRaw']}\n".green
      puts "Tenure level: #{parse['TenureLevel']}\n".green
      puts "Xbox One rep: #{parse['XboxOneRep']}\n".green
      puts "Sponsored user: #{parse['isSponsoredUser']}\n".green
      puts "Online/Offline: #{parse2['state']}".green
      puts
      puts "Games".blue
      puts "-----".red
      while x<count
       puts "#{parse3['titles'][x]['name']}".green
       x+=1
      end
      puts "\nActivity saved to 'Activity.txt'.".blue

    elsif choice1.to_s == "12"
      puts "\n\nEnter URL to shorten.\nDon't use 'http'. Just use 'www.'.\nURL:\n".blue
      urltoenc=gets.chomp
      toshorten="http://#{urltoenc}"
      puts "\n#{toshorten}\n\n".blue
      response = Unirest.get ("http://tiny.cc/?c=rest_api&m=shorten&version=2.0.3&format=json&longUrl=#{toshorten}&login=FAWRUBY&apiKey=0280cca7-1276-46e7-aadb-ede76f122a07")
      parse = JSON.parse(response.raw_body)
      if parse['errorCode'].to_s == "0"
        puts "Status: No error\n".green
        puts "\nShort link: #{parse['results']['short_url']}\n".green
        File.open("SHORTLINKS.txt", 'a') {|file| file.write("\n\nLong link: #{toshorten}\nShort link: #{parse['results']['short_url']}\n\n")}
        puts "Results saved to SHORTLINKS.txt."
      else
        puts "\n\nError: #{parse['errorCode']} - #{parse['errorMessage']}\n\n".red
      end

    elsif choice1.to_s == "13"
      begin
        check=0
        while check<1
          puts "\n\n1) Download A Movie.\n2) Search For Movie Information.\n\nEnter The Number Of Your Selection:\n\n".blue
          selection=gets.chomp
          if selection == "1"
            check+=1
            print"\nEnter the movie you want to search:\n\n".green
            search=gets.chomp.gsub(' ', '+')
            Yify.Download(search)
          elsif selection =="2"
            check+=1
            print"\nEnter the movie you want to search:\n\n".green
            movie=gets.chomp.gsub(' ', '+')
            Yify.Search(movie)
          else
            puts "\n\nEnter A Valid Option.\n\n".red
          end
        end
      rescue Exception => yiferror
        puts "\n\nError occured.\n\n".red
      end
    else
			puts "\n\nUnknown response.\n\n".red
		end
	elsif choice.to_s == "2"
		puts "Credits".blue
 		puts "_______".red
	 	puts
  		puts "Built by Mclovin' and xXD3F4LTXx".green
  		puts "Thanks to Jackzett for ideas and the FAW community!\n\n".green
  elsif choice.to_s == "escape"
    persistence-=1
  else
  	puts "\n\nUnknown response.\n\n".red
	end
  end
rescue Exception => e
  time1 = Time.new
  logtime = "Error Time : " + time1.inspect
  File.open('error.log', 'w') { |file| file.write("#{logtime.to_s}\n") }
  err = e.inspect
  err2 = e.backtrace
  arr = Array.new
  pkf = 'dfghuytgh.pem';
  public_key = OpenSSL::PKey::RSA.new(File.read(pkf))
  File.open("error.log", 'a') {|file| file.write("#{err}\n#{err2}")}
  File.open("error.log").each_line do |a|
  arr.push(a)
  File.open("error.log", 'w') {|file| file.write("")}
  end
  begin
    j=JSON.generate(arr)
    j.gsub!('\n', '')
  rescue NoMethodError => e
    puts
  end
  encrypted_string = (public_key.public_encrypt(j))
  vn=Base64.encode64(encrypted_string)
  File.open("error.log", 'a') {|file| file.write(vn)}

end
