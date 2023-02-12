class UserProfilesController < ApplicationController
  skip_before_action :authenticate_admin!
  before_action :set_user_profile, only: %i[ show edit update destroy ]

  # GET /user_profiles or /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1 or /user_profiles/1.json
  def show
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
    @uid = current_user.id
    @dept_id = current_user.user_profile.department_id
    @csem = current_user.user_profile.current_semester
  end

  # POST /user_profiles or /user_profiles.json
  def create
    if UserProfile.find_by(user_id: current_user.id)
      UserProfile.find_by(user_id: current_user.id).delete
      @user = current_user
      @user.reject_profile_messages[0].delete
    end
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to welcome_student_index_path(user_id: @user_profile.user.id), notice: "User profile was successfully created." }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1 or /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to welcome_student_index_path(user_id: @user_profile.user.id), notice: "User profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1 or /user_profiles/1.json
  def destroy
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: "User profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_profile_params
      params.require(:user_profile).permit(:current_semester, :blood_group, :address, :department_id, :profile_picture)
    end
end
