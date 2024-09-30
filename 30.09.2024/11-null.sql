-- null değerler: olmayan bir değerdir. Herhangi bir değer yoksa o sütunda null deriz. Tanımlanmamış değerdir.
-- null 0(sıfır) ve ''(boşluk) değeri değildir. 
-- null bir değerle aritmetik işlemin sonucu null dur.

select *
from employees
where phone_number is null; -- is null: null olan değerleri bulmak için getirilmiştir.

select *
from employees
where phone_number is not null; -- is not null: null olmayan değerleri bulmak için getirilmiştir.