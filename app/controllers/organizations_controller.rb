class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity}
      end
    end
  end

   def update
    @organization = organization.find(params[:id])

    respond_to do |format|
     if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was sucessfully updated.' }
        format.json { render :show, organization: :ok, location: @organization }
     else
        format.html {render :edit }
        format.json { render json: @organization.erros, organization: :unprocessable_entity }
     end
   end
 end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organization_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

  def organization_params
    params.require(:organization).permit(:name, :address, :address_2, :city, :state, :postal, :description, :website, :category)
  end
end
