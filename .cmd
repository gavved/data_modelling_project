docker compose up -d

docker exec -it postgres bash

psql -U postgres -d db


# run file
docker exec -i postgres psql -U postgres -d db < sql/yrkesco_db_create_tables.sql

docker exec -i postgres psql -U postgres -d db < sql/check.sql