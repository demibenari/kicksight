class TemplateController
  #get /templates/:path.html => 'templates#page', :constraints => { :path => /.+/  }
  #caches_page :page

  def page
    @path = params[:path]
    render :template => 'templates/' + @path, :layout => nil
  end

  def custom_asset_template_url(path)
    "http://kicksight.herokuapp.com/templates/#{path}"
  end

end