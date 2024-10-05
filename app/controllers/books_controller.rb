class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id]) 
    end

    def index
        @books = Book.paginate(page: params[:page], per_page: 5)
    end

    def new
        @book = Book.new
    end

    def edit
        @book = Book.find(params[:id]) 
    end
    
    def update
        @book = Book.find(params[:id]) 
        if @book.update(params.require(:book).permit(:name,:isbn,:author,:year,:description))
            flash[:notice] = "Book was updated Succesfully"
            redirect_to @book
        else
            render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id]) 
        @book.destroy
        flash[:notice] = "Book #{@book.isbn} : #{@book.name} is Deleted."
        redirect_to books_path
    end

    def create 
        @book = Book.create(params.require(:book).permit(:name,:isbn,:author,:year,:description))
        if @book.save
            flash[:notice] = "Book was added Succesfully"
            redirect_to @book
        else
            render 'new'
        end
    end
end
