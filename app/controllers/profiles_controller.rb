class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'profile was successfully created' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

   def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
     if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'profile was sucessfully updated.' }
        format.json { render :show, profile: :ok, location: @profile }
     else
        format.html {render :edit }
        format.json { render json: @profile.erros, profile: :unprocessable_entity }
     end
   end
 end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'profile was successfully destroyed.' }
      format.json { head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :twitter, :website, :field, :bio)
  end
end
