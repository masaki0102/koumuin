class ExamsController < ApplicationController
  before_action :authenticate_government!, except: [:index, :show, :search]
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :search_exam, only: [:index, :search]

  def index
    if user_signed_in?
      date_format = "%Y%m%d"
      now_date = Date.today
      @age = (now_date.strftime(date_format).to_i - current_user.birth_date.strftime(date_format).to_i )/ 10000
    end
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to government_path(@exam.government_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exam.update(exam_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to :root
  end

  def search
    @exams = @p.result.includes(:government).order("created_at DESC")
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.birth_date ="1999-04-02"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def exam_params
    params.require(:exam).permit(:category_id, :date, :age).merge(government_id: current_government.id)
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def move_to_index
    redirect_to :root unless @exam.government_id == current_government.id
  end

  def search_exam
    @p = Exam.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
