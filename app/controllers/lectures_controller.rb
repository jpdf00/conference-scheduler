class LecturesController < ApplicationController
  protect_from_forgery except: :import
  before_action :set_lecture, only: %i[show edit update destroy]

  # GET /lectures/1 or /lectures/1.json
  def show; end

  # GET /lectures/1/edit
  def edit; end

  # POST /lectures or /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to lecture_url(@lecture), notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { redirect_to conferences_url, status: :unprocessable_entity }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1 or /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to lecture_url(@lecture), notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1 or /lectures/1.json
  def destroy
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to track_url(@lecture.track), notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /lectures/import/new or /lectures/import/new.json
  def new_import
    @lectures = Lecture.new
  end

  # POST /lectures/import or /lectures/import.json
  def import
    lectures = FileParsing.new(file: params[:lecture][:file]).parse
    conference_id = ScheduleOrganizer.new(lectures: lectures).organize

    @conference = Conference.includes(tracks: :lectures).where(id: conference_id).first

    respond_to do |format|
      format.json { render template: 'conferences/show', status: :ok, location: @conference }
      format.html { redirect_to conference_url(@conference), notice: 'File was successfully imported.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lecture_params
    params.require(:lecture).permit(:title, :duration, :lecturer, :start_at, :track_id)
  end
end
