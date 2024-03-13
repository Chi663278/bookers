class BooksController < ApplicationController
  def create
    book = Book.new(book_params) #formから送られてくるデータはparamsの中に入っています
    if book.save #あとでやる
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      #あとでやる
    end
  end

  def index #一覧画面用アクション
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private #ストロングパラメータbook_paramsを定義
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
