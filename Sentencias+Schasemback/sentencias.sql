CREATE USER usuario1@localhost;
    GRANT SELECT ON *.* TO usuario1@localhost;
    SHOW GRANTS FOR usuario1@localhost;

CREATE USER usuario2@localhost;
    GRANT SELECT, INSERT, UPDATE ON *.* TO usuario2@localhost;
    SHOW GRANTS FOR usuario2@localhost;