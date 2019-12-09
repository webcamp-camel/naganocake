class ShipToAddressesController < ApplicationController
    #配送先一覧
    def index
        @user = current_user
        #@ship_to_addresses = @user.ship_to_addresses
        @ship_to_addresses = ShipToAddress.all
        @ship_to_address = ShipToAddress.new
    end

    #配送先新規保存
    def create
        @ship_to_address = ShipToAddress.new(ship_to_address_params)
        @ship_to_addresses.user_id = current_user.id

       if @ship_to_addresses.save
           flash[:notice] = "You have creatad ship_to_addresses successfully."
           redirect_to ship_to_addresses_path(@ship_to_address)
        else
            @user = current_user
            @ship_to_addresses = Ship_to_address.all
            render :index
        end
    end

private
    def ship_toaddress_params
        params.require(:ship_to_address).permit(:last_name, :first_name, :postal_code, :address)

end

end