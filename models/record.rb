def all_records()
  run_sql("SELECT * FROM records_info")
end

def add_record(record_name, artist, year_release, artwork_url, label)
  sql_query = "INSERT INTO records_info(record_name, artist, year_release, artwork_url, label) VALUES($1, $2, $3, $4, $5)"
  params = [record_name, artist, year_release, artwork_url, label]
  run_sql(sql_query, params)
end

def show_record(id)
  sql_query = "SELECT * FROM records_info WHERE id = $1"
  params = [id]
  run_sql(sql_query, params)
end

def update_record(record_name, artist, year_release, artwork_url, label, id)
  sql_query = "UPDATE records_info SET record_name = $1, artist = $2, year_release = $3, artwork_url = $4, label = $5 WHERE id = $6"
  params = [record_name, artist, year_release, artwork_url, label, id]
  run_sql(sql_query, params)
end

def delete_record(id)
  sql_query = "DELETE FROM records_info WHERE id = $1"
  params = [id]
  run_sql(sql_query, params)
end