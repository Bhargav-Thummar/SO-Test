class Admin::DashboardController < ApplicationController
  layout "admin"

  before_action :authenticate_user!

  def index
    @books_datatable = BooksDatatable.new
    render template: "books_table"
  end
end
