ALTER TABLE detail_iklan
	ADD latitude point,
	ADD longitude POINT
	
ALTER TABLE pengguna
	ADD COLUMN latitude FLOAT8,
	ADD COLUMN longitude FLOAT8
	
ALTER TABLE detail_iklan
	ADD COLUMN latitude FLOAT8,
	ADD COLUMN longitude FLOAT8
	
select * from pengguna
select * from detail_iklan
	
ALTER TABLE pengguna
	DROP COLUMN latitude,
	DROP COLUMN longitude
	
ALTER TABLE detail_iklan
	DROP COLUMN latitude,
	DROP COLUMN longitude 