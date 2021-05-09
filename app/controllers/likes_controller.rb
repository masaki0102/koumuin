class LikesController < ApplicationController
  before_action :set_exam, only: [:create, :destroy, :checked]
  before_action :move_to_index, only: [:show]

  def checked
    if like = Like.find_by(exam_id: @exam.id, user_id: current_user.id)
       like.destroy
    else
      like = current_user.likes.new(exam_id: @exam.id)
      like.save
    end
    item = Like.find_by(exam_id: @exam.id, user_id: current_user.id)
    render json: { like: item }
  end

  def show
    @likes = Like.where(user_id: current_user.id).includes(:exam).order("created_at DESC")
  end

  private

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end

  def move_to_index
    redirect_to :root unless user_signed_in?
  end
end
