class User::DashboardController < ApplicationController
  layout "user"
  before_action :authenticate_user!

  def index
    @books_datatable = BooksDatatable.new
    render template: "books_table"
  end

  def favorite_books
    @favourite_books = Book
                      .joins(:favourite_books)
                      .where("favourite_books.user_id = :user_id", user_id: current_user.id)
  end

  def add_or_remove_favorite_books
    book = Book.find(params[:book_id])

    if book.present?
      favourite_book = current_user.favourite_books.find_or_initialize_by(book_id: book.id)

      if favourite_book.persisted?
        favourite_book.destroy
        flash[:success] = "Book successfully remove from your favourites."
      else
        favourite_book.save
        flash[:success] = "Book successfully added to your favourites."
      end
    else
      flash[:alert] = "Book not found!"
    end

    redirect_back(fallback_location: root_path)
  end
end
