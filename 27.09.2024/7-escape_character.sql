-- escape karakter

-- string ifadelerde bazı ifadeleri rahatlıkla kullanmamızı sağlar. Mesela ' (tek tırnak) kullanacaksak
-- E
select E'I\'m an engineer'; -- başına e ve nereyi dikkate almayacaksa onun önüne \ işareti konulur.

-- $$
select $$ I'm a computer engineer $$; -- bu ikisi arasındaki string olarak al, sıkıntı yok demiş olduk.