class ShipToAddressesController < ApplicationController
    #配送先一覧
    def index
        @user = current_user
        @ship_to_addresses = @user.ship_to_addresses
        @ship_to_address = ShipToAddress.new
    end

    #配送先新規保存
    def create
        @ship_to_address = ShipToAddress.new(ship_to_address_params)
        @ship_to_address.user_id = current_user.id
       if @ship_to_address.save
           flash[:notice] = "You have creatad ship_to_addresses successfully."
           redirect_to ship_to_addresses_path
        else
            @user = current_user
            @ship_to_addresses = @user.ship_to_addresses.all
            render :index
        end
    end

    #配送先削除
    def destroy
        @ship_to_address = ShipToAddress.find(params[:id])
        @ship_to_address.destroy
        redirect_to ship_to_addresses_path
    end

    #配送先編集
    def edit
        @ship_to_address = ShipToAddress.find(params[:id])

        if @ship_to_address.user.id != current_user.id
            flash[:notice] = "errors"
            redirect_to ship_to_addresses_path
        end
    end

    #編集内容保存
    def update
        @ship_to_address = ShipToAddress.find(params[:id])

        if @ship_to_address.update(ship_to_address_params)
            redirect_to ship_to_addresses_path
            flash[:notice] =  "You have updated book successfully."
        else
         render :edit
        end
    end

private
    def ship_to_address_params
        params.require(:ship_to_address).permit(:last_name, :first_name, :postal_code, :address, :last_name_kana, :first_name_kana, :phone,:user_id)

end

end