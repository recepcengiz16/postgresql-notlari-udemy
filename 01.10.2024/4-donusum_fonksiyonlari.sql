-- dönüşüm fonksiyonları
-- tür dönüşümleri uyumlu olduğu zaman dönüştürülebilir.

--to_date: stringi bir tarihe dönüştürür.
SELECT TO_DATE('20241001','yyyymmdd'); 
SELECT TO_DATE('2024 OCTOBER 01','YYYY MONTH dd'); 
SELECT TO_DATE('2024 october 01','YYYY month dd'); 
SELECT TO_DATE('2024 oct 01','YYYY mon dd'); 
SELECT TO_DATE('2024 275','YYYY DDD'); -- ddd: SENEDEKİ GÜN: 260. GÜN GİBİ 
SELECT TO_DATE('February 08, 2024','Month DD, YYYY'); -- ddd: SENEDEKİ GÜN: 260. GÜN GİBİ 

--to_timestamp: stringi timestamp formatına dönüştürür.
SELECT TO_TIMESTAMP('2024-10-01 10:34:45','YYYY-MM-DD HH:MI:SS');
SELECT TO_TIMESTAMP('2024.10.01 13:34:45','YYYY.MM.DD HH24:MI:SS');
SELECT TO_TIMESTAMP('2024/25/10 13:34','YYYY/DD/MM HH24:MI');
SELECT TO_TIMESTAMP('11 30 99 08:30','MM DD YY HH:MI');
SELECT TO_TIMESTAMP('2024 OCT 15 07:11:20','YYYY MON DD HH:MI:SS');

--to_number: string ifadeyi sayıya çevirir. Numeric ifadeye yani
SELECT TO_NUMBER('1210.75','9999.99');
SELECT TO_NUMBER('1,210.75','9G999.99'); -- G burada binlik ayıracı yani virgül oluyor burada
SELECT TO_NUMBER('$1,210.75','L9G999.99'); -- L burada local parabirimini gösterir.
SELECT TO_NUMBER('$1,210.75','L9G999'); -- burada da . dan sonrası yok
SELECT TO_NUMBER('00005469','9999999999'); -- bu şekilde de integer yapabiliriz
SELECT '00005469'::integer -- bu şekilde de integer yapabiliriz
SELECT CAST('00005469' as integer); -- bu şekilde de integer yapabiliriz


--to_char: Birçok veri tipini stringe dönüştürür.
SELECT payment_date TO_CHAR(payment_date,'HH24:MI:SS') from tablo_adi -- girilen tarihi bu formata çevir. 
SELECT payment_date TO_CHAR(payment_date,'MON-DD-YYYY HH12:MI PM') from tablo_adi -- girilen tarihi bu formata çevir. 
SELECT payment_date TO_CHAR(amount,'99D99') from tablo_adi -- girilen tarihi bu formata çevir. D nokta manasında 

--cast: bir tipi başka bir tipe dönüştürür.
-- bir diğer cast işlemi de expression::type. '00005469'::integer gibi
SELECT CAST('100' as integer);
SELECT CAST('2024-10-10' as date);
SELECT CAST('15-OCT-2024' as date);
SELECT CAST('true' as boolean);
SELECT CAST('t' as boolean); -- true manasında
SELECT CAST('f' as boolean); -- false manasında
SELECT CAST('2 year 5 months 20 days' as interval) -- interval değerleri bu şekilde de varebiliriz.
SELECT CAST(2800 as money); -- Çıktı:$2,800.00
SELECT CAST(current_date as text);
SELECT CAST('22.54' as double precision); -- sadece double olmaz. double precision yazman lazım.

SELECT '100'::integer;
SELECT '01-OCT-2024'::date;
SELECT 598::varchar;
SELECT '15 minute'::interval; -- 15 dk öncesi veya sonrasını hesaplar.
SELECT '2 hour'::interval; -- 2 saat sonrası



