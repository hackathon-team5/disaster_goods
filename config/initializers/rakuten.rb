require 'rakuten_web_service'

RakutenWebService.configure do |c|
    ## 先ほど.envで設定した内容を反映させる。
  c.application_id = ENV['RAKUTEN_APPLICATION_ID']
  c.affiliate_id = ENV['RAKUTEN_AFFILIATE_ID']
  c.debug = true # default: falseになっている。
end
