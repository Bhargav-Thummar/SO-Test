class DashboardController < ApplicationController
  def index
    @books_datatable = BooksDatatable.new
    render template: "books_table"
  end
end
