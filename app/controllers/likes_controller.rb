class LikesController < ApplicationController
  before_action :set_exam, only: [:create,:destroy]


  def create
    @like = current_user.likes.new(exam_id: @exam.id)
    @like.save
    redirect_to government_path(@exam.government)
  end

  def destroy
    @like = Like.find_by(exam_id: @exam.id, user_id: current_user.id).destroy
    redirect_to government_path(@exam.government)
  end

  def show
    @likes = Like.where(user_id: current_user.id).includes(:exam)
  end

  private

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end
end
