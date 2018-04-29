class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]

  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
    heading = "<h3>#{@posting.company_name} is hiring a #{@posting.position_name}.</h3>"
    apply_button = "<center><a href=\"#{@posting.link}\" rel=\"nofollow\"><img src=\"https://i.imgur.com/3iDKGJb.png\"/></a></center><br><br>"
    # job summary
    job_summary = "<h3>#{@posting.summary_name}</h3><p>#{@posting.summary}</p>"

    # job duties

    job_duties = "<h3>#{@posting.duties_name}</h3><ul>"
    job_duties_array = @posting.duties.split('-').drop(1)
    job_duties_array.each do |duty|
      job_duties += "<li>#{duty}</li>"
    end
    job_duties += "</ul>"
    # qualifications heading
    qualifications = "<h3>#{@posting.qualifications_name}</h3><ul>"
    qualification_array = @posting.qualifications.split('-').drop(1)
    qualification_array.each do |qualification|
      qualifications += "<li>#{qualification}</li>"
    end
    qualifications += "</ul>"

    @html = heading
    @html += job_summary
    # if the user entered job duties
    if job_duties_array.length > 0
      @html += job_duties
    end
    # if the user entered qualifications
    if qualification_array.length > 0
      @html += qualifications
    end
    @html += "<p>Please apply with your resume and profile via EightSix Network's <b><i><br>"
    @html += "one minute online application</i></b> today:</p>"
    @html += apply_button
    @html += "<p>It takes just a minute! Plus, add a <i>Job Alert</i> and get notified whenever #{@posting.company_name} and many other great employers are hiring. Thank you for your interest!</p>"
    @html_render = @html.html_safe
  end

  # GET /postings/new
  def new
    @posting = Posting.new
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings
  # POST /postings.json
  def create
    @posting = Posting.new(posting_params)

    respond_to do |format|
      if @posting.save
        format.html { redirect_to @posting, notice: 'Posting was successfully created.' }
        format.json { render :show, status: :created, location: @posting }
      else
        format.html { render :new }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to @posting, notice: 'Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting }
      else
        format.html { render :edit }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
      format.html { redirect_to postings_url, notice: 'Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = Posting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posting_params
      params.require(:posting).permit(:company_name, :position_name, :link, :summary, :summary_name, :qualifications, :qualifications_name, :duties, :duties_name)
    end
end
