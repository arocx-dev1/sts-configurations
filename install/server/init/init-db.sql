drop 
  table if exists temperature_measurement_history;
create table temperature_measurement_history (
  id uuid primary key not null, transaction_id uuid not null, 
  measurement_date text not null
);
drop 
  table if exists temperature_measurement_history_detail;
create table temperature_measurement_history_detail (
  id uuid primary key not null, 
  transaction_id uuid not null, 
  silo_id uuid not null, 
  silo_view_id uuid not null, 
  lower_alarm_value numeric(19, 2) not null, 
  upper_alarm_value numeric(19, 2) not null, 
  measurement_date text not null, 
  result_json text not null
);
drop 
  table if exists silo;
create table silo (
  id uuid primary key not null, 
  silo_view_id uuid not null, 
  name text, 
  lower_alarm_value numeric(19, 2) not null, 
  upper_alarm_value numeric(19, 2) not null, 
  bindings_json text, 
  report_headers_json text, 
  rtu_bindings_json text
);
drop 
  table if exists application_settings;
create table application_settings (
  id uuid primary key not null, key text, 
  value text
);
drop 
  table if exists silo_view;
create table silo_view (
  id uuid primary key not null, name text
);

insert into application_settings(id,key,value) values (uuid_generate_v4(),'COMPANY_NAME','Demo Company');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'LOWER_SYSTEM_ALARM','8.0');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'UPPER_SYSTEM_ALARM','30.0');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SENSOR_READING_PERIOD_ITEMS','10,20,30,40,50,60');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SELECTED_SENSOR_READING_PERIOD','30');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'LANGUAGE_ITEMS','en');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SELECTED_LANGUAGE','en');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SENSOR_READING_PERIOD_UNIT','Min.');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'JOB_PERIOD','60');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'DEFAULT_NEWS','Thermal Sentinel - Temperature Automation System.');