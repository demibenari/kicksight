class TemplatesController < ApplicationController

  #caches_page :page

  def page
    @path = params[:path]
    render :template => 'templates/' + @path, :layout => nil
  end

  # This code is not so good!!!
  def custom_asset_template_url(path)
    return "http://localhost:3000/templates/#{path}"
  end

end