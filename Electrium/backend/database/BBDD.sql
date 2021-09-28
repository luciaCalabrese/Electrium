DROP DATABASE if exists Electrium;
Create DATABASE Electrium;
use Electrium;

Create table Usuario(
    Nick VARCHAR(255),
    Contraseña VARCHAR(255),
    Email VARCHAR(255),
    ID_Rango int NOT NULL,
    Localidad VARCHAR(255),
    Foto VARCHAR(255),
    ID_Reseña INT NOT NULL,
    PRIMARY KEY(Nick)
);

CREATE Table Vehiculos(
ID_Vehiculos INT AUTO_INCREMENT,
Nombre VARCHAR(255),
Modelo VARCHAR(255),
ID_Tipo INT NOT NULL,
Descripción VARCHAR(255),
Foto VARCHAR(255),
ID_Concesionario INT NOT NULL,
Precio INT NOT NULL,
Valoracion INT NOT NULL,
PRIMARY KEY(ID_Vehiculos)
);

CREATE Table Concesionario(
    ID_Concesionario INT AUTO_INCREMENT,
    Nombre VARCHAR(255),
    ID_Compañia INT NOT NULL,
    Ubicacion VARCHAR(255),
    Telefono INT NOT NULL,
    Pag_web VARCHAR(255),
    Email VARCHAR(255),
    PRIMARY KEY (ID_Concesionario)
);

CREATE Table Favorito(
    ID_Usuario VARCHAR(255),
    ID_Vehiculos INT
);

CREATE Table Rango(
    ID_Rango INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    PRIMARY KEY (ID_Rango)
);

CREATE Table Reseña(
    ID_Reseña INT NOT NULL AUTO_INCREMENT,
    Opinion VARCHAR(255),
    Valoracion INT,
    PRIMARY KEY (ID_Reseña)
);

Create Table Tipo(
    ID_Tipo INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(255),
    PRIMARY KEY (ID_Tipo)
);

CREATE Table Compañia(
    ID_Compañia INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255),
    CIF INT,
    PRIMARY KEY(ID_Compañia) 
);

ALTER Table Usuario
ADD FOREIGN KEY (ID_Rango) References Rango (ID_Rango);

ALTER Table Usuario
ADD FOREIGN KEY (ID_Reseña) References Reseña (ID_Reseña);

ALTER Table Vehiculos
ADD FOREIGN KEY (ID_Tipo) References Tipo (ID_Tipo);
ALTER Table Vehiculos
ADD FOREIGN KEY (ID_Concesionario) References Concesionario (ID_Concesionario);
ALTER Table Concesionario
ADD FOREIGN KEY (ID_Compañia) References Compañia (ID_Compañia);
ALTER Table Favorito
ADD FOREIGN KEY (ID_Usuario) References Usuario (Nick);
ALTER Table Favorito
ADD FOREIGN KEY (ID_Vehiculos) References Vehiculos (ID_Vehiculos);