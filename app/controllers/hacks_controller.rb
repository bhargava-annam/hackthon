class HacksController < ApplicationController
  before_action :set_hack, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit ,:update, :destroy]
  # GET /hacks or /hacks.json
  def index
    @hacks = Hack.order(params[:sort]).search(params[:search]).order("created_at")  
    @hack = current_user.hacks.build
  end

  # GET /hacks/1 or /hacks/1.json
  def show
  end

  def upvote
    @hack = Hack.find(params[:id])
    @hack.upvote_by(current_user)
    redirect_to hacks_path
  end

  def follow
    @hack = Hack.find(params[:id])
    current_user.follow(@hack)
    redirect_to hacks_path
  end

  # GET /hacks/new
  def new
    @hack = current_user.hacks.build
  end

  # GET /hacks/1/edit
  def edit
  end

  # POST /hacks or /hacks.json
  def create
    @hack = current_user.hacks.build(hack_params)

    respond_to do |format|
      if @hack.save
        format.html { redirect_to root_path, notice: "Hack was successfully created." }
        format.json { render :show, status: :created, location: @hack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hacks/1 or /hacks/1.json
  def update
    respond_to do |format|
      if @hack.update(hack_params)
        format.html { redirect_to @hack, notice: "Hack was successfully updated." }
        format.json { render :show, status: :ok, location: @hack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacks/1 or /hacks/1.json
  def destroy
    @hack.destroy
    respond_to do |format|
      format.html { redirect_to hacks_url, notice: "Hack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @hack = Hack.find(params[:id])
    if current_user.following?(@hack)
      
    elsif current_user.hacks.find_by(id: params[:id]).nil?
      redirect_to hacks_path, notice: 'Not Authorised'
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hack
      @hack = Hack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hack_params
      params.require(:hack).permit(:title, :description,:tags,:user_id,:username)
    end
end
