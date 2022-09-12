class GoodsController < ApplicationController
  def index
    @goods = Good.where(type_id: params[:type_id])
    @type  = Type.find(params[:type_id])
  end
end
