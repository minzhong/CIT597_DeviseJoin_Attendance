class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /attendances
  # GET /attendances.json
  def index
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end
  
  def import
    # params[:attendance][:course_id] is from the collection_select in the index.html.erb view
    Attendance.import(params[:file], params[:attendance][:course_id])  
    @attendances = Attendance.where("course_id = ?", params[:attendance][:course_id])
    # this is for the flash notice in attendance views index.html.erb
    # redirect_to attendances_url, notice: "Attendances imported successfully." 
  end
  
  def calculate
    @course_id = params[:attendance][:course_id]
    course = Course.find_by_id(@course_id)
    @course_name = course.course_code
    @students = course.students
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:att_date, :att_time, :note, :course_id, :student_id)
    end
end
