-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS tabla_pokemon
(
    pk_id_pokemon INTEGER NOT NULL,
    nombre_pokemon VARCHAR(0),
    peso INTEGER,
    altura INTERVAL,
    fk_especie INTEGER NOT NULL,
    fk_estafisticas_pokemon INTEGER NOT NULL,
    PRIMARY KEY(pk_id_pokemon)
);

CREATE TABLE IF NOT EXISTS tabla_habilidades
(
    pk_id_habilidades INTEGER NOT NULL,
    habilidades_pokemon VARCHAR(100),
    descriocion_habilidad TEXT,
    puntos_ataque INTEGER,
    putos_defensa INTEGER,
    PRIMARY KEY(pk_id_habilidades)
);

CREATE TABLE IF NOT EXISTS especie_pokemon
(
    pk_especie INTEGER NOT NULL,
    nombre_especie VARCHAR(100),
    PRIMARY KEY(pk_especie)
);

CREATE TABLE IF NOT EXISTS union_pokemones_habilidades
(
    pk_id_pokemon INTEGER NOT NULL,
    pk_id_habilidades INTEGER NOT NULL,
    PRIMARY KEY(pk_id_pokemon, pk_id_habilidades)
);

CREATE TABLE IF NOT EXISTS tabla_contenido_imdb
(
    pk_id_peliculas INTEGER NOT NULL,
    titulo_pelicula VARCHAR(20),
    ano_pelicula INTEGER,
    fk_id_tipo_contenido INTEGER NOT NULL,
    director_pelicula VARCHAR(100),
    valor_pelicula INTEGER,
    PRIMARY KEY(pk_id_peliculas)
);

CREATE TABLE IF NOT EXISTS tipo_contenido
(
    pk_id_tipo_contenido INTEGER NOT NULL,
    tipo_contenido VARCHAR(100),
    "decripcion_contenido " TEXT,
    valor_generado INTEGER,
    PRIMARY KEY(pk_id_tipo_contenido)
);

CREATE TABLE IF NOT EXISTS tabla_generos
(
    pk_genero INTEGER NOT NULL,
    nombre_genero VARCHAR(100),
    PRIMARY KEY(pk_genero)
);

CREATE TABLE IF NOT EXISTS union_peliculas_generos
(
    pk_id_peliculas INTEGER NOT NULL,
    pk_genero INTEGER NOT NULL,
    PRIMARY KEY(pk_id_peliculas, pk_genero)
);


-- Create FKs
ALTER TABLE tabla_pokemon
    ADD    FOREIGN KEY (pk_id_pokemon)
    REFERENCES union_pokemones_habilidades(pk_id_pokemon)
    MATCH SIMPLE
;
    
ALTER TABLE tabla_pokemon
    ADD    FOREIGN KEY (fk_especie)
    REFERENCES especie_pokemon(pk_especie)
    MATCH SIMPLE
;
    
ALTER TABLE union_pokemones_habilidades
    ADD    FOREIGN KEY (pk_id_habilidades)
    REFERENCES tabla_habilidades(pk_id_habilidades)
    MATCH SIMPLE
;
    
ALTER TABLE tabla_contenido_imdb
    ADD    FOREIGN KEY (fk_id_tipo_contenido)
    REFERENCES tipo_contenido(pk_id_tipo_contenido)
    MATCH SIMPLE
;
    
ALTER TABLE union_peliculas_generos
    ADD    FOREIGN KEY (pk_genero)
    REFERENCES tabla_generos(pk_genero)
    MATCH SIMPLE
;
    
ALTER TABLE tabla_contenido_imdb
    ADD    FOREIGN KEY (pk_id_peliculas)
    REFERENCES union_peliculas_generos(pk_id_peliculas)
    MATCH SIMPLE
;
    

-- Create Indexes

