--transaction işlemi sonrası

--commit sonrası: commit bittikten sonra veri değişikleri kalıcı hale gelir. Verinin transaction öncesi durumu kaybolur.
-- Bu değişikleri tüm userlar görebilir. transaction esnasında yaptığmız güncellemeyle bu satır kilitlenir böylece bir başkası müdahale
-- edemez. delete de de o satır kilitlenir çünkü on başka biri o satırı güncellemek isteyebilir. Ama insertte böyle bir kilitleme yok.
-- comitten sonra bu kilitler kaldırılır. Comitten sınra tüm savepoint noktaları silinir.

-- rollback sonrası: tüm veri değişiklikleri geri alınır(insert,update, deleteler). Transaction öncesine dönerler.
-- Kilitler kaldırılır.