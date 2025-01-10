@echo on

set PGPASSWORD=%1

set ROOT=%cd%
set PG_BIN=%ROOT%\pgsql\bin
set INIT_SQL=%ROOT%\init

cd %PG_BIN%

pg_ctl -D "../../data" -l "../../log/db.log" restart

psql -c "DROP DATABASE silo_dev WITH (FORCE)" -U postgres
psql -c "DROP USER IF EXISTS root " -U postgres


psql -c "CREATE USER root WITH PASSWORD '%PGPASSWORD%'" -U postgres
psql -c "ALTER USER root WITH SUPERUSER" -U postgres

psql -c "CREATE DATABASE silo_dev OWNER root" -U postgres

psql -d silo_dev -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"" -U postgres
psql -d silo_dev -c "CREATE EXTENSION IF NOT EXISTS pg_trgm" -U postgres

psql -U root -d silo_dev -a -f "%INIT_SQL%\init-db.sql"

pg_ctl -D "../../data" -l "../../log/db.log" stop

cd %ROOT%
