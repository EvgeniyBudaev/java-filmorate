CREATE TABLE IF NOT EXISTS FILM (
    FilmID int  NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name varchar(200) NOT NULL,
    Description varchar(200),
    ReleaseDate date NOT NULL,
    Duration int NOT NULL,
    RatingID int NOT NULL,
    CONSTRAINT pk_Film PRIMARY KEY (FilmID)
);

CREATE TABLE IF NOT EXISTS LIKES (
    LikeID int   NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    UserID int NOT NULL,
    FilmID int NOT NULL,
    CONSTRAINT pk_Like PRIMARY KEY (LikeID)
);

CREATE TABLE IF NOT EXISTS GENRE (
    GenreID int NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name varchar(200) NOT NULL,
    CONSTRAINT pk_Genre PRIMARY KEY (GenreID),
    CONSTRAINT uc_Genre_Name UNIQUE (Name)
);

CREATE TABLE IF NOT EXISTS FILMGENRE (
     FilmID int NOT NULL,
     GenreID int NOT NULL,
     CONSTRAINT pk_Filmgenre PRIMARY KEY (FilmID, GenreID)
);

CREATE TABLE IF NOT EXISTS RatingMPA (
    RatingID int NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name varchar(10)  NOT NULL,
    Description varchar(200) NOT NULL,
    CONSTRAINT pk_RatingMPA PRIMARY KEY (RatingID),
    CONSTRAINT uc_RatingMPA_Name UNIQUE (Name)
);

CREATE TABLE IF NOT EXISTS Users (
    UserID int NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Email varchar(200) NOT NULL,
    Login varchar(50) NOT NULL,
    Name varchar(200) NOT NULL,
    Birthday date NOT NULL,
    CONSTRAINT pk_User PRIMARY KEY (UserID),
    CONSTRAINT uc_User_Email UNIQUE (Email)
);

CREATE TABLE IF NOT EXISTS FRIENDSHIP (
    UserID int NOT NULL,
    FriendID int NOT NULL,
    Status bool NOT NULL,
    CONSTRAINT pk_Friendship PRIMARY KEY (UserID, FriendID)
);

ALTER TABLE FILM ADD CONSTRAINT IF NOT EXISTS fk_Film_RatingID FOREIGN KEY (RatingID)
    REFERENCES RatingMPA (RatingID) ON DELETE RESTRICT;

ALTER TABLE LIKES ADD CONSTRAINT IF NOT EXISTS fk_Like_FilmID FOREIGN KEY(FilmID)
    REFERENCES FILM (FilmID) ON DELETE CASCADE;

ALTER TABLE LIKES ADD CONSTRAINT IF NOT EXISTS fk_Like_UserID FOREIGN KEY (UserID)
    REFERENCES USERS (UserID) ON DELETE CASCADE;

ALTER TABLE FILMGENRE
    ADD CONSTRAINT IF NOT EXISTS fk_Filmgenre_FilmID FOREIGN KEY (FilmID)
    REFERENCES FILM (FilmID) ON DELETE CASCADE;

ALTER TABLE FILMGENRE
    ADD CONSTRAINT IF NOT EXISTS fk_Filmgenre_GenreID FOREIGN KEY (GenreID)
    REFERENCES GENRE (GenreID) ON DELETE RESTRICT;

ALTER TABLE FRIENDSHIP ADD CONSTRAINT IF NOT EXISTS fk_Friendship_UserID FOREIGN KEY (UserID)
    REFERENCES USERS (UserID) ON DELETE CASCADE;

ALTER TABLE FRIENDSHIP ADD CONSTRAINT IF NOT EXISTS fk_Friendship_FriendID FOREIGN KEY (FriendID)
    REFERENCES USERS (UserID) ON DELETE CASCADE;