-- reindex
-- bazı nedenlerden dolayı indeximiz bozulmuş olabilir. Bunu düzeltmek için iki yöntemi var. Ya drop create yapabiliriz veya
-- reindex kullanabiliriz.

--reindex de sanki bizim indeximiz yeni oluşturuluyormuş gibi sorunlu kısımları düzeltmeye yardımcı olur.

reindex [ (verbose) ] { index | table | schema | database | system} -- verbose verilen komutun ilerleme 
-- sürecini text olarak bize sunar. index diyerek sadece bu indexi ya da table diyerek bu tablodaki tüm indexleri ya da schema 
-- diyerek bu schema daki tüm indexleri gibi yeniden oluşturmamızı sağlar. Ama bu genellik arttıkça da sıkıntı artar çünkü
-- index operasyonları tabloya geçici olarak lock koyar.

reindex index idx_customer_id -- indexin ismi
reindex (verbose) table customer -- tablonun ismi. Bu tablodaki tüm indexleri reindex yaparak düzelt.
-- indexleme yaparken de işleyiş sürecini görelim.
reindex schema public; -- public schemadaki tüm indexleri yeniden oluşturabiliyoruz.
reindex database Test;
