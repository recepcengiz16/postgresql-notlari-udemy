-- kısa bir sorgu
-- aşağıda verilen tarihi yukarıda teker teker yazmaktansa aşağıda bir kere yazıp yukarıda alias ile kullanıyorum. 
-- Aslında yok ama sanki bu tbl varmış gibi oluyor bu sorguda.

select col,
	date_trunc('quarter',col),
	date_trunc('year',col),
	date_trunc('month',col)
from
	(select (timestamp '2024-10-01 11:44:05') as col) tbl