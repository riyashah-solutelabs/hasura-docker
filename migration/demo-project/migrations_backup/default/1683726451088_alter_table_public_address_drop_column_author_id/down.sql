alter table "public"."address"
  add constraint "address_author_id_fkey"
  foreign key (author_id)
  references "public"."author"
  (id) on update restrict on delete restrict;
alter table "public"."address" alter column "author_id" drop not null;
alter table "public"."address" add column "author_id" text;
