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

    job_duties = generate_html(@posting.radio_duties, @posting.duties, @posting.duties_name)
    qualifications = generate_html(@posting.radio_qualifications, @posting.qualifications, @posting.qualifications_name)
    additional_comments = generate_html(@posting.radio_additional_comments, @posting.additional_comments, @posting.additional_comments_name)

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

    # generates html markup for text section from input data
    def generate_html(type, text, title)
      markup = ""
      if text.length > 0
        # title
        markup += "<h3>#{title}</h3>"

        if type == 'point-form'
          # if point form was selected
          markup += "<ul>"
          # split strings
          point_form_array = text.split(/^•|^-|^/).drop(1)

          point_form_array.each do |point_form|
            markup += "<li>#{point_form}</li>"
          end

          markup += "</ul>"
        elsif type == 'paragraphs'
          # if paragraphs were selected
          markup += "<p>#{text}</p>"
        end
      end
      # return html markup
      markup
    end
end
