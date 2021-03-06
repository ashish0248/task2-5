class PostCommentsController < ApplicationController
	def create
    book = Book.find(params[:book_id])
    @post_comment = current_user.post_comments.new(book_params)
    @post_comment.book_id = book.id
    if @post_comment.save
    	redirect_to book_path(book)
    else
        @book_new = Book.new
        @book = Book.find(params[:book_id]) 
        @user = @book.user
    	render 'books/show'
    end
	end

	def destroy
    book = Book.find(params[:book_id])
    comment = PostComment.find(params[:id])
    if comment.destroy
    	redirect_to book_path(book)
    else
    	render 'books/show'
    end
    	
end
	private

	def book_params
    params.require(:post_comment).permit(:comment)
	end
end
