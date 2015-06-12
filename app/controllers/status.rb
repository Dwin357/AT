# post '/statuses/new/:type/:id' do
# 	# not up yet
# 	params[:type].constantize.find_by_id(params[:id]).generate_status
# 	redirect "#{params[:type].constantize.find_by_id(params[:id])}"
#   # add status to truck/trailer/soldier
# end

get '/statuses/new/:type/:id' do
	# @resource = params[:type].constantize.find_by_id(params[:id])
	# erb: ''
end

delete '' do
  # delete status
end
