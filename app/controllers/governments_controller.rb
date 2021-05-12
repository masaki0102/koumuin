class GovernmentsController < ApplicationController

  def index
    @governments = Government.where(prefecture_id: params[:prefecture_id]).order("created_at ASC")
    @prefecture = Prefecture.find_by(id: params[:prefecture_id])   
  end

  def show
    @government = Government.find(params[:id])
    @exams = @government.exams
  end

end
