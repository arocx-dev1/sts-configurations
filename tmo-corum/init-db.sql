drop table if exists temperature_measurement_history;
create table temperature_measurement_history (id uuid primary key not null,transaction_id uuid  not null,measurement_date text  not null,outside_value numeric(19,2) );
drop table if exists temperature_measurement_history_detail;
create table temperature_measurement_history_detail (id uuid primary key not null,transaction_id uuid  not null,silo_id uuid  not null,silo_view_id uuid  not null,lower_alarm_value numeric(19,2)  not null,upper_alarm_value numeric(19,2)  not null,measurement_date text  not null,result_json text  not null);
drop table if exists relay;
create table relay (id uuid primary key not null,silo_id uuid  not null,device numeric(10,2)  not null,channel numeric(10,2)  not null,automation_flag boolean  not null,open_above numeric(19,2)  not null,close_below numeric(19,2)  not null);
drop table if exists silo;
create table silo (id uuid primary key not null,silo_view_id uuid  not null,name text ,lower_alarm_value numeric(19,2)  not null,upper_alarm_value numeric(19,2)  not null,bindings_json text ,note text ,rtu_bindings_json text ,silo_order numeric(10,2) );
drop table if exists silo_view;
create table silo_view (id uuid primary key not null,name text ,view_order numeric(10,2) );
drop table if exists application_settings;
create table application_settings (id uuid primary key not null,key text ,value text );

insert into application_settings(id,key,value) values (uuid_generate_v4(),'COMPANY_NAME','Çorum TMO');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'LOWER_SYSTEM_ALARM','8.0');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'UPPER_SYSTEM_ALARM','30.0');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SENSOR_READING_PERIOD_ITEMS','3,4,5,6,12,24');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SELECTED_SENSOR_READING_PERIOD','6');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'LANGUAGE_ITEMS','en,ru,tr');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SELECTED_LANGUAGE','tr');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'SENSOR_READING_PERIOD_UNIT','Saat');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'DEFAULT_NEWS','Termal Gözcü - Sıcaklık Kontrol Sistemi.');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'OUTSIDE_SENSOR_KEY','R1C255S255');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'AUTO_RUN_FLAG','true');
insert into application_settings(id,key,value) values (uuid_generate_v4(),'DISPLAY_SERIAL_STATUS_ON_STARTUP','true');

