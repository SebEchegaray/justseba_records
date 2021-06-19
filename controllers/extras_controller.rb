get '/record-stores' do
  stores_info = pull_stores()

  erb :'extra/record_store', locals: { stores: stores_info }
end

get '/djs' do
  djs_info = pull_djs()

  erb :'extra/djs', locals: { djs: djs_info }
end