class SearchesController < ApplicationController
	def index
	end
	def search 
		if params[:model_name] == "ユーザー"
			keyword = params[:keyword]
			search_name = params[:search_name]
			@searched = User.search(keyword,search_name)
		elsif params[:model_name] == "ブック"
			keyword = params[:keyword]
			search_name = params[:search_name]
			@searched = Book.search(keyword,search_name)
			render 'index'
		else
		end
	end
end

