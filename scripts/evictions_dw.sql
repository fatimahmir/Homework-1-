CREATE SCHEMA INSTANCE;

CREATE TABLE INSTANCE.Entity ( 
 );

CREATE TABLE INSTANCE.dim_building ( 
	building_id          INT  NOT NULL  ,
	BIN_num              INT    ,
	BBL_num              INT    ,
	CONSTRAINT pk_dim_property PRIMARY KEY ( building_id )
 );

CREATE TABLE INSTANCE.dim_location ( 
	location_id          INT  NOT NULL  ,
	eviction_address     VARCHAR(100)    ,
	eviction_apartment_num VARCHAR    ,
	eviction_borough     VARCHAR    ,
	eviction_zip         INT    ,
	eviction_latitude    DECIMAL(5,12)    ,
	eviction_longitude   DECIMAL(5,12)    ,
	community_board      INT    ,
	council_district     INT    ,
	census_tract         INT    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE TABLE INSTANCE.dim_marshal ( 
	marshal_id           INT  NOT NULL  ,
	marshal_fn           VARCHAR    ,
	marshal_ln           VARCHAR    ,
	CONSTRAINT pk_dim_marshal PRIMARY KEY ( marshal_id )
 );

CREATE TABLE INSTANCE.facts_evictions ( 
	facts_id             BIGINT  NOT NULL  ,
	court_indexnum       INT    ,
	execute_date         DATE    ,
	docket_num           INT    ,
	location_id          INT  NOT NULL  ,
	marshal_id           INT  NOT NULL  ,
	property_id          INT  NOT NULL  ,
	building_id          INT  NOT NULL  ,
	CONSTRAINT pk_facts_evictions PRIMARY KEY ( facts_id, marshal_id, location_id, property_id, building_id )
 );

CREATE TABLE INSTANCE.property_dim ( 
	property_id          INT  NOT NULL  ,
	property_type        VARCHAR    ,
	ejection             VARCHAR    ,
	eviction             VARCHAR    ,
	CONSTRAINT pk_property_dim PRIMARY KEY ( property_id )
 );
