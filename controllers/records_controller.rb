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

get '/about' do
  erb :'info/about'
end

# SEARCH TRY
# get '/search' do
#   wrapper = Discogs::Wrapper.new("JUST SEBA Records")

#   artist          = wrapper.get_artist("329937")
#   artist_releases = wrapper.get_artist_releases("329937")
#   release         = wrapper.get_release("1529724")
#   label           = wrapper.get_label("29515")

#   auth_wrapper = Discogs::Wrapper.new("JUST SEBA Records", user_token: "my_user_token")
#   search = auth_wrapper.search("Necrovore", :per_page => 10, :type => :artist)

#   erb :'info/search', locals: { search: artist }
# end

post '/info/search' do
  wrapper = Discogs::Wrapper.new("JUST SEBA Records")

  record_more_info = params[:record]

  artist          = wrapper.get_artist("329937")
  artist_releases = wrapper.get_artist_releases("329937")
  release         = wrapper.get_release("1529724")
  label           = wrapper.get_label("29515")

  auth_wrapper = Discogs::Wrapper.new("JUST SEBA Records", user_token: "my_user_token")
  search = auth_wrapper.search("Necrovore", :per_page => 10, :type => :artist)

  erb :'info/search', locals: { search: search, artist: artist }
end