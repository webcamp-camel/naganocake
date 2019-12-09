class ShipToAddressesController < ApplicationController
	#配送先一覧
	def index
		@user = current_user
		@ship_to_addresses = ship_to_address.user.all
		@ship_to_address = Ship_to_address.new
	end

    #配送先新規保存
	def create
		@ship_to_addresses = Ship_to_address.new(ship_to_address_params)
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

　　#削除
	def destroy
		@ship_to_address = Ship_to_address.find(params[:id])
        @ship_to_address.destroy
        redirect_to ship_to_addresses_path
	end

　　#配送先編集
　　def edit
	    @ship_to_address = Ship_to_address.find(params[:id])
        if @ship_to_address.user.id != current_user.id
            flash[:notice] = "errors"
            redirect_to root_path
        end
	end

	#変更内容保存する
	def update
		@ship_to_address = Ship_to_address.find(params[:id])
        if @ship_to_address.update(book_params)
        redirect_to ship_to_addresses_path(@book.id)
         flash[:notice] =  "You have updated ship_to_address successfully."
        else
         render :edit
        end
	end

private
  def ship_to_address_params
  	params.require(:ship_to_address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone, :postal_code, :address)
  end

end