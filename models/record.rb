def all_records()
  run_sql("SELECT * FROM records_info")
end

def add_record(record_name, artist, year_release, artwork_url, label)
  run_sql("INSERT INTO records_info(record_name, artist, year_release, artwork_url, label) VALUES('#{record_name}', '#{artist}', #{year_release}, '#{artwork_url}', '#{label}')")
end

def show_record(id)
  run_sql("SELECT * FROM records_info WHERE id = #{id}")
end