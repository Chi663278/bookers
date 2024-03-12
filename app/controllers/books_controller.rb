class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def create
    book = Book.new(book_params) #formから送られてくるデータはparamsの中に入っています
    book.save #データをデータベースに保存するmethod
    redirect_to '/books/show' #リダイレクト
  end

  def index
  end

  def show
  end

  def edit
  end

  private #ストロングパラメータbook_paramsを定義
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
