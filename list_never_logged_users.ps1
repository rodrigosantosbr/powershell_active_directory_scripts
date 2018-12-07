# never logged users
get-aduser -f {-not ( lastlogontimestamp -like "*")}| ft samaccountname,lastlogontimestamp -auto
