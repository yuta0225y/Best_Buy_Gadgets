require 'rakuten_web_service'

RakutenWebService.configure do |c|
  c.application_id = '1094189325186609229' # ここに取得したAPIキーを入力
  c.affiliate_id = '3f502970.f7c07a9d.3f502971.ca92bfee'     # 任意でアフィリエイトIDも指定可能
end