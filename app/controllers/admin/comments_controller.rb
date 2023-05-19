class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!


  private

  def authenticate_admin!
    unless admin_signed_in?
    redirect_to top_path
    end
  end

end
