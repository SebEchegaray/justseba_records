get '/records' do
  records_info = all_records()

  erb :'info/records', locals: { info: records_info }
end

get '/add' do
  erb :'info/new'
end

post '/new' do
  record_name = params[:record_name]
  artist = params[:artist]
  year_release = params[:year_release]
  artwork_url = params[:artwork_url]
  label = params[:label]

  add_record(record_name, artist, year_release, artwork_url, label)

  redirect '/records'
end