DROP TABLE IF EXISTS personne_habitation;
DROP TABLE IF EXISTS Personne;
DROP TABLE IF EXISTS Habitation;


# Conception de la table Personne
CREATE TABLE IF NOT EXISTS Personne  (
    personne_id INT AUTO_INCREMENT PRIMARY KEY,
    taille VARCHAR(255),
    poids FLOAT,
    prenom VARCHAR(255),
    nom VARCHAR(255)
);

#Conception de la table Habitation
CREATE TABLE IF NOT EXISTS Habitation(
    habitation_id INT AUTO_INCREMENT,
    PRIMARY KEY (habitation_id),
    surface FLOAT,
    nombre_piece INT
);

#Conception de la table personne_habitation
CREATE TABLE IF NOT EXISTS personne_habitation(
    personne_id INT,
    habitation_id INT,
    FOREIGN KEY (personne_id) REFERENCES Personne(personne_id),
    FOREIGN KEY (habitation_id) REFERENCES Habitation(habitation_id),
    PRIMARY KEY (personne_id,habitation_id)
);

#Insertion jeux de données
INSERT INTO Personne(taille, poids, prenom, nom) VALUES 
('15',5,'ose','dupont');
INSERT INTO Personne(taille, poids, prenom, nom) VALUES 
('15',5,'jose','dupont');
INSERT INTO Habitation(surface, nombre_piece) VALUES (15,5);
INSERT INTO Habitation(surface, nombre_piece) VALUES (15,5);
INSERT INTO Habitation(surface, nombre_piece) VALUES (15,5);
INSERT INTO Habitation(surface, nombre_piece) VALUES (15,5);
INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (1,1);
INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (1,2);
INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (1,3);
INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (1,4);
INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (2,2);


# Ajout de la colonne prix dans habitation
ALTER TABLE Habitation ADD COLUMN prix float;

#mise à jour de tous les prix des habitations à deux
UPDATE Habitation SET prix=2;

#suppression de la colonne prix de la table habitation
ALTER TABLE Habitation DROP COLUMN prix;

#ajout de données dans la table habitation
INSERT INTO Habitation(surface, nombre_piece) VALUES (14,5);
INSERT INTO Habitation(surface, nombre_piece) VALUES (14,5);

#suppression par exemple de toutes toutes les habitations avec une surface 
de 15
DELETE FROM Habitation WHERE surface=14;

#Parfois, il peut arriver que nous voulons une table, qui soit 'recalculé'
#en fonction d'autre table
#Je veux qu'une table 'possession' affiche l'id d'une personne et le 
nombre d'habitation
# qu'il possede
# la solution : une vue

CREATE VIEW personneid_habitationnbr AS
SELECT ph.personne_id, p.prenom,Count(*) as "nombre habitation"
FROM personne_habitation as ph
INNER JOIN Personne as p ON p.personne_id = ph.personne_id
GROUP BY personne_id;


INSERT INTO personne_habitation(personne_id, habitation_id) VALUES (2,4);

SELECT * FROM personneid_habitationnbr;





