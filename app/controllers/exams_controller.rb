class ExamsController < ApplicationController
  

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def exam_params
    params.require(:exam).permit(:category_id, :date, :age).merge(government_id: current_government.id)
  end

end
