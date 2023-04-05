SELECT ST_AsText(
    ST_ConvexHull(
        ST_Collect(
            ST_GeomFromText('MULTIPOINT(-118.29270 34.01373, -118.282787 34.021734,-118.283896 34.020329, -118.288793 34.019659, -118.286464 34.023177, -118.282912 34.021463, -118.283406 34.020463, -118.28544 34.02405, -118.28636 34.01874, -118.28372 34.02295, -118.28524 34.02533, -118.28255 34.02135, -118.28240 34.01897)')
            )
        )
    );
create table coordinates_table (id SERIAL PRIMARY KEY,name varchar(30));
select AddGeometryColumn('coordinates_table', 'location',4326,'POINT',2);

insert into coordinates_table (name,location) values ('Home', (select ST_SetSRID(ST_MakePoint(-118.29270, 34.01373),4326)));
insert into coordinates_table (name,location) values ('Leavey Library', (select ST_SetSRID(ST_MakePoint(-118.282787, 34.021734),4326)));
insert into coordinates_table (name,location) values ('Doheny Library', (select ST_SetSRID(ST_MakePoint(-118.283896,34.020329),4326)));
insert into coordinates_table (name,location) values ('Seaver Library', (select ST_SetSRID(ST_MakePoint(-118.288793,34.019659),4326)));
insert into coordinates_table (name,location) values ('SCA', (select ST_SetSRID(ST_MakePoint(-118.28646, 34.02317),4326)));
insert into coordinates_table (name,location) values ('Leavey Pool', (select ST_SetSRID(ST_MakePoint(-118.28291, 34.02146),4326)));
insert into coordinates_table (name,location) values ('Carolyn Ftn', (select ST_SetSRID(ST_MakePoint(-118.28340, 34.02046),4326)));
insert into coordinates_table (name,location) values ('Wyatt Way', (select ST_SetSRID(ST_MakePoint(-118.28544, 34.02405),4326)));
insert into coordinates_table (name,location) values ('Trousday Pwy', (select ST_SetSRID(ST_MakePoint(-118.28636, 34.01874),4326)));
insert into coordinates_table (name,location) values ('GH Plaza', (select ST_SetSRID(ST_MakePoint(-118.28372, 34.02295),4326)));
insert into coordinates_table (name,location) values ('Dulce', (select ST_SetSRID(ST_MakePoint(-118.28524, 34.02533),4326)));
insert into coordinates_table (name,location) values ('Starbucks', (select ST_SetSRID(ST_MakePoint(-118.28255, 34.02135),4326)));
insert into coordinates_table (name,location) values ('FH Coffee', (select ST_SetSRID(ST_MakePoint(-118.28240, 34.01897),4326)));

select a.name, b.name, ST_Distance(geometry(a.location), geometry(b.location)) as distance from coordinates_table a,coordinates_table b where a.id = 1 and b.id in (select id from coordinates_table where id!=1) order by distance limit 4;