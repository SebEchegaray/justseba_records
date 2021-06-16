def run_sql execution
  connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'records'})
  results = connection.exec(execution)
  connection.close

  results
end