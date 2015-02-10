class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @gem_name = params[:text]
  end

  def search
    try_again = "Gem does not exist. Try again."
    gem_info = Gems.info @gem_name
    if @gem_name == gem_info["name"]
      @project_uri = gem_info["project_uri"]
      @homepage = gem_info["homepage_uri"]
      @docs = gem_info["documentation_uri"]
    end
  end
end
