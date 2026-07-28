-- شغل كل جزء لوحده بالترتيب (Run بعد كل واحد)

-- 1) إنشاء الجدول
create table natega_results (seating_no bigint primary key, arabic_name text not null, total_degree numeric, student_case_desc text);

-- 2) إنشاء الفهرس على رقم الجلوس
create index idx_seating_no on natega_results (seating_no);

-- 3) تفعيل الحماية على مستوى الصفوف
alter table natega_results enable row level security;

-- 4) صلاحية القراءة للجميع
create policy "public read" on natega_results for select using (true);

-- 5) صلاحية الإضافة
create policy "admin insert" on natega_results for insert with check (true);

-- 6) صلاحية التعديل
create policy "admin upsert" on natega_results for update using (true);
