class HomeController < ApplicationController
  def index

    respond_to do |format|
      format.pdf { render pdf: "contents"}
      format.html
    end
    # render pdf: "contents"
  end
end
