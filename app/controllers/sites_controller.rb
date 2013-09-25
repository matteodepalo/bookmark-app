class SitesController < ApplicationController
  layout 'bookmarks'

  def show
    @site = Site.find(params[:id])
    @bookmarks = @site.bookmarks

    respond_to do |format|
      format.html { render template: 'bookmarks/index' }
    end
  end
end