alter table "public"."author"
  add constraint "author_address_id_fkey"
  foreign key ("address_id")
  references "public"."address"
  ("id") on update restrict on delete restrict;
