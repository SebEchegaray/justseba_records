get '/records' do
  records_info = all_records()

  erb :'info/records', locals: { info: records_info }
end

get '/add' do
  erb :'info/new', locals: { edit: false }
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

get '/view/:id' do |id|
  record_info = show_record(id)

  erb :'info/show', locals: { record_info: record_info[0] }
end

get '/info/:id/edit' do |id|
  record_edit = show_record(id)

  erb :'info/new', locals: { edit: true, record: record_edit[0] }
end

put '/new/:id/edit' do |id|
  record_name = params[:record_name]
  artist = params[:artist]
  year_release = params[:year_release]
  artwork_url = params[:artwork_url]
  label = params[:label]

  update_record(record_name, artist, year_release, artwork_url, label, id)

  redirect "/view/#{id}"
end

delete '/info/:id/delete' do |id|
  delete_record(id)

  redirect '/records'
end