class MessageInABottle < Sinatra::Base
	@@count = 0

	get '/' do
		erb :index
	end

	get '/beach' do
		if @@count == 20
			@post_message = "You search the beach but there are no more bottles. You will die here..."
			@@count = 0	
			redirect to('/')	
		elsif @@count % 5 == 0 
			@post_message = "Ouch! There was a crab in the bottle!"
		else 
			beach_messages = {
				"east" => "Argh, the Island of Tortuga runs short of turtles.",
				"west" => "It's totally awesome to write messages in your used bottles at the end of a spring break rager!",
				"tarantula" => "Holy shit! There are spiders everywhere! Wait... are those tarantulas!? No! NO! AH! GET OFF! They're on my face! Get it off! Get OFFFF....aghhhh *gurgle*"
			}
			@post_message = beach_messages[params["location"]]
		end
		@@count+=1
		erb :beach
	end
end