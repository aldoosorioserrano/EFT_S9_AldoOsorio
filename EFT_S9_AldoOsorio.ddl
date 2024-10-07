-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-06 21:21:31 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE academias (
    academiaid            INTEGER GENERATED AlWAYS AS IDENTITY,
    directorname          VARCHAR2(200 BYTE),
    turnoprofesor         VARCHAR2(100 BYTE),
    profesores_profesorid INTEGER NOT NULL
);

ALTER TABLE academias ADD CONSTRAINT academias_pk PRIMARY KEY ( academiaid );

CREATE TABLE cursos (
    cursoid              INTEGER GENERATED AlWAYS AS IDENTITY,
    nombrecurso          VARCHAR2(200 BYTE),
    academias_academiaid INTEGER NOT NULL,
    numerosala           INTEGER,
    capacidadsala        INTEGER
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( cursoid );

CREATE TABLE municipalidades (
    municipalidadid      INTEGER GENERATED AlWAYS AS IDENTITY,
    nombremuni           VARCHAR2(100 BYTE),
    region               VARCHAR2(200 BYTE),
    academias_academiaid INTEGER NOT NULL
);

ALTER TABLE municipalidades ADD CONSTRAINT municipalidad_pk PRIMARY KEY ( municipalidadid );

CREATE TABLE profesores (
    profesorid           INTEGER GENERATED AlWAYS AS IDENTITY,
    tipocontrato         VARCHAR2(100 BYTE),
    nombreprofesor       VARCHAR2(200 BYTE),
    especialidadprofesor VARCHAR2(200 BYTE)
);

ALTER TABLE profesores ADD CONSTRAINT profesores_pk PRIMARY KEY ( profesorid );

ALTER TABLE profesores ADD CONSTRAINT nom_espprofe_un UNIQUE ( nombreprofesor,
                                                               especialidadprofesor );

ALTER TABLE academias
    ADD CONSTRAINT academias_profesores_fk FOREIGN KEY ( profesores_profesorid )
        REFERENCES profesores ( profesorid );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_academias_fk FOREIGN KEY ( academias_academiaid )
        REFERENCES academias ( academiaid );

ALTER TABLE municipalidades
    ADD CONSTRAINT municipalidad_academias_fk FOREIGN KEY ( academias_academiaid )
        REFERENCES academias ( academiaid );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
