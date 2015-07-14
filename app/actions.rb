


post "/users/create" do
 
  user = User.new({
  	first_name: params[:first_name],
  	last_name: params[:last_name],
  	phone: params[:phone]
  })
  user.save
  redirect "/"
end

get "/users/edit/:id" do
	@user = User.find(params[:id])
	erb :update
end

post "/users/update/:id" do
	User.update(params[:id], {
		first_name: params[:first_name],
	  	last_name: params[:last_name],
	  	phone: params[:phone]
	})
	redirect "/"
end

post "/users/remove/:id" do
	User.destroy(params[:id])
		redirect "/"
end

get "/" do
  if params[:search] && params[:search] != ""
    @users = User.where("lower(first_name) = ? or lower(last_name) = ?", params[:search].downcase, params[:search].downcase)
  else
    @users = User.all
  end

  if params[:sort] == "asc"
    @users = @users.order(:first_name)
  else
   	@users = @users.order("first_name DESC") 
  end

  erb :index
end







