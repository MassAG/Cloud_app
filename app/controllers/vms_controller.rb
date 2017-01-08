class VmsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: :destroy

  def create
    @vm = current_user.vms.build(vm_params)
    server_root_path=Rails.root.to_s
    vms_config_file=server_root_path+"/vms/Vagrantfile"
    if @vm.save
      server_vms_path=server_root_path+"/vms/"+@vm.id.to_s
      puts "VMs path = #{server_vms_path}"
      line = Command::Runner.new("mkdir",server_vms_path.to_s)
      message = line.pass
      puts "stdout " + message.stdout
      puts "line " + message.line
      line = Command::Runner.new("cp",vms_config_file.to_s+" "+server_vms_path.to_s)
      message = line.pass
      puts "line " + message.line
      system("VAGRANT_CWD="+server_vms_path.to_s+" vagrant up")

#      debugger
      flash[:success] = "VM created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @vm.destroy
    server_root_path=Rails.root.to_s
    server_vms_path=server_root_path+"/vms/"+@vm.id.to_s
    system("VAGRANT_CWD="+server_vms_path.to_s+" vagrant destroy -f")
    system("rm -r "+server_vms_path.to_s)
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
