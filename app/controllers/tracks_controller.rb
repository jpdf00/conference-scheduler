class TracksController < ApplicationController
  before_action :set_track, only: %i[show destroy]
  before_action :sanitize_params, only: %i[create]

  # GET /tracks/1 or /tracks/1.json
  def show; end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to track_url(@track), notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { redirect_to conferences_url, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy

    respond_to do |format|
      format.html { redirect_to conference_url(@track.conference), notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.require(:track).permit(:name, :conference_id)
  end

  def sanitize_params
    params[:track][:name] = params[:track][:name].to_i
  end
end
