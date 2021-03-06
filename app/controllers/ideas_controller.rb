class IdeasController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy, :vote, :unvote, :comment]
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :vote, :unvote, :comment]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.highest_voted
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @industries = Industry.all.order("name")
    @revmods = RevenueModel.all.order("title")
  end

  # GET /ideas/1/edit
  def edit
    @industries = Industry.all.order("name")
    @revmods = RevenueModel.all.order("title")
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  def comment
     title = params[:title]
     comment = params[:comment]
     user_id = current_user.id

     # Make sure we've got a comment to add
     raise "Comment cannot be blank" unless comment

     new_comment = @idea.comments.create
     new_comment.title = title
     new_comment.comment = comment
     new_comment.user_id = user_id
     new_comment.save

     redirect_to :back
  end

  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end
    @idea.vote voter: current_user, vote: direction
    redirect_to :back
  end

  def unvote
     direction = params[:direction]
     if direction == "like"
        @idea.unliked_by current_user
     elsif direction == "bad"
        @idea.undisliked_by current_user
     end
     redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :notes, :industry_id, :revenue_model_id)
    end
end
