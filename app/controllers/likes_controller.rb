class LikesController < ApplicationController
  before_action :set_exam

  def create
    @like = current_user.likes.new(exam_id: @exam.id)
    @like.save
    @likes = Like.where(exam_id: @exam.id)
  end

  def destroy
    @like = Like.find_by(exam_id: @exam.id, user_id: current_user.id).destroy
    @likes = Like.where(exam_id: @exam.id)
  end

  private

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end
end
