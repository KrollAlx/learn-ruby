class RatingController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(rating: :desc)
  end
end
