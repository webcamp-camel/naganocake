class OrderedItemsController < ApplicationController
#ログインユーザーのみ閲覧可
before_action :authenticate_user!

end
