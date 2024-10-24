-- partial index
-- sadece bir şarta bağlı olan kısıma index ataması yapma. Yani sorgularda genelde activelerle ilgileniyorsan o şartı sağlayanlara 
-- index ataması yapılabilir.

create index index_name
on tablo_adi(sutun_adi)
where active = 1 -- aktif olanlara mesela