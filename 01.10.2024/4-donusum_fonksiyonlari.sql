-- dönüşüm fonksiyonları

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

--cast: bir tipi başka bir tipe dönüştürür.