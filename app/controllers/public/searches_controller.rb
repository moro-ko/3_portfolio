class Public::SearchesController < ApplicationController

  def search
    @projects = Project.looks(params[:search], params[:word])
  end

end
