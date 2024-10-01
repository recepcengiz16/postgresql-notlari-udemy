-- tarihlerle aritmetik işlemler

select current_date + 5; -- bugüne 5 gün eklenmiş hali: "2024-10-06"
select current_date - 5; 
select current_date - to_date('01012022','DDMMYYYY'); -- iki tarih arasındaki farkı sayı olarak verir.
select now() - interval '1 year 3 months 2 hours 50 minutes';
select current_time + interval '2 hour';