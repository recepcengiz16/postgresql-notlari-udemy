-- veri tabaı normalizasyon tipleri:
/*
	1NF(1. Normal Form) - Atomiklik: Tek bir değerin konulmasını sağlar sütuna. 
	Tekrar eden sütunlar olmaması lazım. Adres1 Adres2 gibi.
	Primary key olması lazım her tabloda.

	2NF(2. Normal Form) - 1NF var mı?
	Parçalı bir bağımlılık olmamalı

	3NF(3. Normal Form) - 2NF var mı?
	Geçişli bağımlılık olmaması gerekiyor.

	3.5NF - 3NF var mı?
	A'dan B'ye bağımlılık varsa A super key olmalı
*/