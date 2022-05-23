class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!

  def index
    @users_datatable = UsersDatatable.new
  end
end
