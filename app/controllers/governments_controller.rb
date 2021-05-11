class GovernmentsController < ApplicationController

  def index
    @governments = Government.where(prefecture_id: params[:prefecture_id])
    @prefecture = Prefecture.find_by(id: params[:prefecture_id])   
  end

  def show
    @government = Government.find(params[:id])
    @exams = @government.exams.order("created_at DESC")
  end

end
