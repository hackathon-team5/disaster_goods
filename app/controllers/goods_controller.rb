class GoodsController < ApplicationController
  def index
    item_code = 'quattro-botanico:10000096'
    @good = RakutenWebService::Ichiba::Item.search(itemCode: item_code)
  end
end
