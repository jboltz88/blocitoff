class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # p self.method(:authenticate_user!).source_location
    # render :index, layout: "application"
  end
end
