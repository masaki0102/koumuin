class GovernmentsController < ApplicationController
  before_action :search_exam, only: [:index]

  def index
    @governments = Government.all
    @exams = Exam.all
    if user_signed_in?
      date_format = '%Y%m%d'
      now_date = Date.today
      @age = (now_date.strftime(date_format).to_i - current_user.birth_date.strftime(date_format).to_i) / 10_000
    end
  end

  def show
    @government = Government.find(params[:id])
    @exams = @government.exams
  end

  private

  def search_exam
    @p = Exam.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
