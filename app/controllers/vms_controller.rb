class VmsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: :destroy

  def create
    @vm = current_user.vms.build(vm_params)
    if @vm.save
      flash[:success] = "VM created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @vm.destroy
    flash[:success] = "VM deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @vm = Vm.find(params[:id])
  end


  def update
    @vm = Vm.find(params[:id])
    if @vm.update_attributes(vm_params)
      flash[:success] = "VM updated"
      redirect_to root_url
    else
      render 'edit'
    end


  end

  private

    def vm_params
      params.require(:vm).permit(:name)
    end

    def correct_user
      @vm = current_user.vms.find_by(id: params[:id])
      redirect_to root_url if @vm.nil?
    end
end
