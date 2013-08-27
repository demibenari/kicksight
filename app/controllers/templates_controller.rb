class TemplatesController < ApplicationController
  #caches_page :page

  def page
    @path = params[:path]
    render :template => 'templates/' + @path, :layout => nil
  end

  def index
    @path = params[:path]
    render :template => '/assets/templates/' + @path, :layout => nil
  end

  # This code is not so good!!!
  def custom_asset_template_url(path)
    link = "http://localhost:3000/templates/#{path}"
    return link
  end

end