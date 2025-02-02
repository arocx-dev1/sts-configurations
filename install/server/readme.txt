unzip postgresql
run cmd as admin
cd to postgresql bin folder
initdb -D C:\dev\workspace\sts-install\data --locale=en_EN --encoding=UTF-8 -U postgres -W
pg_ctl register -D C:\dev\workspace\sts-install\data -N sts-postgres
start the service from task manager.
