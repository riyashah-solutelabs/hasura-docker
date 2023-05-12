
SET check_function_bodies = false;
CREATE TYPE public.author_name AS (
	full_name text
);
CREATE TABLE public.author (
    name text NOT NULL,
    rating integer,
    id text NOT NULL
);
CREATE FUNCTION public.a_full_name(author_row public.author) RETURNS text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name
$$;
CREATE FUNCTION public.au_full_name(author_row public.author) RETURNS public.author_name
    LANGUAGE sql STABLE
    AS $$
  SELECT (author_row.first_name || ' ' || author_row.last_name)::author_name
$$;
CREATE FUNCTION public.author_full_name(author_row public.author) RETURNS public.author_name
    LANGUAGE sql STABLE
    AS $$
  SELECT (author_row.first_name || ' ' || author_row.last_name)::author_name
$$;
CREATE FUNCTION public.authorr_full_name(author_row public.author) RETURNS text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name AS full_name
$$;
CREATE FUNCTION public.b_full_name(author_row public.author) RETURNS SETOF text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name
$$;
CREATE FUNCTION public.c_full_name(author_row public.author) RETURNS SETOF text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name
$$;
CREATE FUNCTION public.e_full_name(author_row public.author) RETURNS SETOF text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name
$$;
CREATE FUNCTION public.f_full_name(author_row public.author) RETURNS SETOF text
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name
$$;
CREATE FUNCTION public.g_full_name(author_row public.author) RETURNS TABLE(full_name text)
    LANGUAGE sql STABLE
    AS $$
  SELECT author_row.first_name || ' ' || author_row.last_name AS full_name
$$;
CREATE TABLE public.article (
    id text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    author_id text NOT NULL
);
CREATE TABLE public.author1 (
    id text NOT NULL,
    name text NOT NULL,
    rating integer NOT NULL
);
ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.author1
    ADD CONSTRAINT author1_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE "public"."address" ("id" text NOT NULL, "street" text NOT NULL, "zip" text NOT NULL, "city" text NOT NULL, "country" text NOT NULL, "author_id" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("author_id") REFERENCES "public"."author"("id") ON UPDATE restrict ON DELETE restrict);
