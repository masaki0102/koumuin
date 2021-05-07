class GovernmentsController < ApplicationController

  def index
    @governments = Government.all
  end

  def show
    @government = Government.find(params[:id])
    @exams = @government.exams
  end

end
