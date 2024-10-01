-- matematik fonksiyonları

--round: ondalıklı sayılarda istenilen basamak kadar yuvarlama işlemi, sadece değeri yazarsak virgülden sonraki değer 5 ve büyükse
-- bir üst sayıya yoksa bir alt sayıya yuvarlar. select round(14.45) => 14
select round(12.45857567,3); -- virgülden sonra 3 basamaklı olsun

--trunc: istediğimiz yerden keserek bize farklı bir sayı oluşturur.
select trunc(14.52); -- 14 böyle yazarsak virgülden sonrasını kesip atıyor.
select trunc(14.5286,3); -- 14.528 alıyor

--mod: mod alma yani bölümden elde edilen kalanı bulma
select mod(5,2);

--sign: girilen değerlerin pozitif mi yoksa negatif mi olduğunu gösteriyor
select sign(-1);

--floor: parametre olarak gelen ondalıklı sayıyı bir alt sayıya yuvarlıyor.
select floor(2.4);

--ceiling - ceil: parametre olarak gelen ondalıklı sayıyı bir üst sayıya yuvarlıyor.
select ceiling(7.85); select ceil(2.4); -- ikisi de aynı şey

--abs: mutlak değer olarak getirir sayısal ifadeyi
select abs(-5);

--power: kuvvet almaya yarıyor. power(taban,üst)
select power(2,4);

--random: 0-1 arasında rastgele ondalıklı sayı getirir.
select random();
