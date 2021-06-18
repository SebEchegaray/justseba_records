def run_sql(execution, params = [])
  connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'records'})
  # results = connection.exec(execution)
  connection.prepare("My_sql_query", execution)
  results = connection.exec_prepared("My_sql_query", params)
  connection.close

  results
end