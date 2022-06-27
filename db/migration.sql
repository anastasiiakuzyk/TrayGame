create table if not exists users
(
    id            serial,
    username      varchar default ''::character varying,
    first_name    varchar default ''::character varying,
    second_name   varchar default ''::character varying,
    telegram_hash text                                  not null,
    telegram_id   bigint                                not null,
    auth_date     integer                               not null,
    photo_url     varchar default ''::character varying not null,
    game_uuid     varchar                               not null
);

create unique index users_username_uindex
    on users (username);

create unique index users_telegram_id_uindex
    on users (telegram_id);

create table if not exists analytics
(
    id           serial
        constraint analytics_pk
            primary key,
    user_id      integer not null,
    total_kills  integer default 0,
    total_death  integer default 0,
    games_played integer default 0
);

create unique index analytics_user_id_uindex
    on analytics (user_id);

