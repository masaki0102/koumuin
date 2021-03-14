class ExamsController < ApplicationController
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
    @exam = Exam.find(params[:id])
    redirect_to :root unless @exam.government_id == current_government.id
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    redirect_to :root unless @exam.government_id == current_government.id
    @exam.destroy
    redirect_to :root
  end

  private

  def exam_params
    params.require(:exam).permit(:category_id, :date, :age).merge(government_id: current_government.id)
  end
end
