drop keyspace if exists TEST;
create keyspace if not exists TEST with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
drop table if exists TEST.ITEM;
create table if not exists TEST.ITEM( Uuid uuid, Bool boolean, Int8 tinyint, Uint8 tinyint, Int16 smallint, Uint16 smallint, Int32 int, Uint32 int, Int64 bigint, Uint64 bigint, Float32 float, Float64 double, String text, Date timestamp, DateTime timestamp, Blob blob, primary key( ( Uuid, Bool ), Int8 ) );
create index on TEST.ITEM ( Uint8 );
drop table if exists TEST.COLLECTION;
create table if not exists TEST.COLLECTION( Id int, Tuple tuple<int,text>, Map map<int,text>, Set set<int>, List list<int>, ItemUuid uuid, ItemList list<ITEM>, primary key( Id ) );
