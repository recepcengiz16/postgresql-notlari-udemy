-- indexlerin listlenmesi

-- tüm veritabanındaki indexlerin listelenmesi
select * 
from pg_indexes
--where schemaname = 'public' bununla da scheması public olanlar demiş olduk.

--indexlerin kullanım istatiklerini gösteren bir liste
select *
from pg_stat_user_indexes
order by idx_scan;