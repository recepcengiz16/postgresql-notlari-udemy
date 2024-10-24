-- alıştırma
create index idx_address_district on address(district);

create index idx_actor_first_last_name on actor(first_name,last_name);

create unique index idx_student_name_cname on student(name,course_name);

create index idx_part_product_segment_id on product(segment_id)
where segment_id;