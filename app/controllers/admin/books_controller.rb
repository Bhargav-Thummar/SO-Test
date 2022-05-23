class Admin::BooksController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :set_admin_book, only: %i[ show edit update destroy ]

  def index
    @books_datatable = BooksDatatable.new
    render template: "books_table"
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(admin_book_params)

    if @book.save
      redirect_to admin_books_path, notice: "Book was successfully created."
    else
      render :new
    end
  end

  def update
    if @book.update(admin_book_params)
      redirect_to admin_books_path, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy

    redirect_to admin_books_path, notice: "Book was successfully destroyed."
  end

  private

    def set_admin_book
      @book = Book.find(params[:id])
    end

    def admin_book_params
      params.require(:book).permit(:title, :auther, :description, :category_id)
    end
end
