def pull_stores()
  run_sql("SELECT * FROM record_stores")
end

def pull_djs()
  run_sql("SELECT * FROM djs")
end