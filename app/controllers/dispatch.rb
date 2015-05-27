

get '' do
	# view payloads
end


get '' do
	# view a specific soldier
	# include all mission went on
	# include ph#, wep#, any statuses
	# presented w/ btn to chng status
end


get '' do
	# view a specific truck
	# include all missions
	# include radio#, any deffencies + statuses
	# presented with btn to chng defficiences / status

end


post '' do
	# mark a mission as completed...
	# this could be automatic when last pass/tk
	# returns though...
end


post '/mission/:id' do
	"you landed on POST /mission/#{params[:id]}"
	# mark a truck/soldier as leaving wire
end


post '' do
	# mark a truck/soldier as returned
	# throws a pop-up for miles, gal+, oil+, confirm keys
	# auto update soldiers miles
	# auto update truck miles/gal/oil
end


post '' do
	# add a deficiency to a truck/trailer
end


delete '' do
	# delete deficiency
end


post '' do
	# add status to truck/trailer/soldier
end


delete '' do
	# delete status
end


post '' do
	# add a new soldier
end


post '' do
	# add a new truck
end
