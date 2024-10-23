-- index on expression
create index index_name
on tablo_adi(expression_) -- bu expressionda en çok ne şekilde arama yapıyorsak sorgularımızda o şekilde bir ifade yazarız.

--örnek
create index idx_ic_last_name
on customer(lower(last_name)); -- mesela last_name i genelde küçük harflere çevirerek arama yapıyoruz.