class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def create
    book = Book.new(book_params) #formから送られてくるデータはparamsの中に入っています
    book.save #データをデータベースに保存するmethod
    redirect_to book_path(book.id) #リダイレクト
  end

  def index #一覧画面用アクション
    @books = Book.all #all method (モデルがやりとりしているデータベースのテーブルに保存されている、全てのレコードをまとめて取得)
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
    redirect_to '/books'
  end

  private #ストロングパラメータbook_paramsを定義
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
