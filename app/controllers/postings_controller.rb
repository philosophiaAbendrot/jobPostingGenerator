class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]

  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all.order(created_at: :desc)
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
    heading = "<h3>#{@posting.company_name} is hiring #{@posting.position_name}.</h3>"
    apply_button = "<center><a href=\"#{@posting.link}\" rel=\"nofollow\"><img src=\"https://i.imgur.com/3iDKGJb.png\"/></a></center><br><br>"
    # job summary
    job_summary = "<h3>#{@posting.summary_name}</h3><p>#{@posting.summary}</p>"

    job_duties = ""
    qualifications = ""
    additional_comments = ""

    # if duties were filled out
    if @posting.duties.length > 0
      job_duties += "<h3>#{@posting.duties_name}</h3>"

      if @posting.radio_duties == 'point-form'
        # if duties are point form
        # job duties
        job_duties += "<ul>"
        # line is split when it runs into a dot followed by a space or a hyphen followed by a space
        job_duties_array = @posting.duties.split(/^•|^-|^/).drop(1)

        job_duties_array.each do |duty|
          job_duties += "<li>#{duty}</li>"
        end

        job_duties += "</ul>"
      elsif @posting.radio_duties == 'paragraphs'
        # if duties are paragraph form
        job_duties += "<p>#{@posting.duties}</p>"
      end
    end

    # if qualifications were filled out
    if @posting.qualifications.length > 0
      qualifications = "<h3>#{@posting.qualifications_name}</h3>"
      if @posting.radio_qualifications == 'point-form'
        qualifications += "<ul>"
        qualification_array = @posting.qualifications.split(/^•|^-|^/).drop(1)

        qualification_array.each do |qualification|
          qualifications += "<li>#{qualification}</li>"
        end

        qualifications += "</ul>"
      elsif @posting.radio_qualifications == 'paragraphs'
        # if qualifications are in paragraph form
        qualifications += "<p>#{@posting.qualifications}</p>"
      end
    end

    # if additional comments were filled out
    if @posting.additional_comments.length > 0
      additional_comments = "<h3>#{@posting.additional_comments_name}</h3>"
      if @posting.radio_additional_comments == 'point-form'
        additional_comments += "<ul>"
        additional_comments_array = @posting.additional_comments.split(/^•|^-|^/).drop(1)

        additional_comments_array.each do |additional_comment|
          additional_comments += "<li>#{additional_comment}</li>"
        end

        additional_comments += "</ul>"
      elsif @posting.radio_additional_comments == 'paragraphs'
        # if additional_comments are in paragraph form
        additional_comments += "<p>#{@posting.additional_comments}</p>"
      end
    end

    @html = heading
    @html += job_summary
    @html += job_duties
    @html += qualifications
    @html += additional_comments
    @html += "<p>Please apply with your resume and profile via #{@posting.company_name}'s <b><i>"
    @html += "one minute online application</i></b> today:</p>"
    @html += apply_button
    @html += "<p>It takes just a minute! Plus, add a <i>Job Alert</i> and get notified whenever #{@posting.company_name} and many other great employers are hiring. Thank you for your interest!</p>"
    @html_render = @html.html_safe
  end #end show

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
      params.require(:posting).permit(:company_name, :position_name, :link, :summary, :summary_name, :qualifications, :qualifications_name, :duties, :duties_name, :additional_comments, :additional_comments_name, :radio_duties, :radio_summary, :radio_qualifications, :radio_additional_comments)
    end
end
