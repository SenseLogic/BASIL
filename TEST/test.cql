drop keyspace if exists TEST;
create keyspace if not exists TEST with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
drop table if exists TEST.SIMPLE;
create table if not exists TEST.SIMPLE( Uuid uuid, Bool boolean, Int8 tinyint, Uint8 tinyint, Int16 smallint, Uint16 smallint, Int32 int, Uint32 int, Int64 bigint, Uint64 bigint, Float32 float, Float64 double, String text, Date timestamp, DateTime timestamp, Blob blob, primary key( ( Uuid, Bool ), Int8 ) );
create index on TEST.SIMPLE ( Uint8 );
drop table if exists TEST.COMPOUND;
create table if not exists TEST.COMPOUND( Id int, Location text, Name tuple<text,text>, NameSet set<tuple<text,text>>, CompanyMap map<text,text>, EmailSet set<text>, PhoneList list<text>, SimpleDate timestamp, SimpleDateMap map<tuple<>,timestamp>, SimpleDateSet set<timestamp>, SimpleDateList list<timestamp>, NameSetMap map<timestamp,set<>>, primary key( Id ) );
