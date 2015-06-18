class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

   def update
    @user = User.find(params[:id])

    respond_to do |format|
     if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was sucessfully updated.' }
        format.json { render :show, user: :ok, location: @user }
     else
        format.html {render :edit }
        format.json { render json: @user.erros, user: :unprocessable_entity }
     end
   end
 end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def person_params
    params.require(:user).permit(:password,:password_confirmation,:first_name, :last_name, :email, :twitter, :website, { field: [] }, :bio)
  end
end
