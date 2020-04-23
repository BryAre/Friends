-- The User login system that will be used for authentication.
CREATE TABLE IF NOT EXISTS Users(
    UserName VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Pass VARCHAR(255),
    PRIMARY KEY (UserName)
);


--- The group names and their identiable information.
CREATE TABLE IF NOT EXISTS Groups(
    GroupID INT UNSIGNED,
    GroupName VARCHAR(255),
    PRIMARY KEY (GroupID)
);


--- The Users status based on their respective groups.
CREATE TABLE IF NOT EXISTS UserData(
    UserName VARCHAR(255),
    GroupID INT UNSIGNED,
    UserTypes INT UNSIGNED,
    NumPoints INT,
    PRIMARY KEY (UserName),
    FOREIGN KEY (UserName) REFERENCES Users(UserName) 
    ON DELETE CASCADE,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
    ON DELETE CASCADE
);


--- Users that are automatically accepted from their respective group.
CREATE TABLE IF NOT EXISTS WhiteBox(
UserName VARCHAR(255),
GroupID INT UNSIGNED,
FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
ON DELETE CASCADE,
FOREIGN KEY (UserName) REFERENCES Users(UserName)
ON DELETE CASCADE
);


 --- Users that are banned from their respective groups.
CREATE TABLE IF NOT EXISTS BlackBox(
UserName VARCHAR(255),
GroupID INT UNSIGNED,
FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
ON DELETE CASCADE,
FOREIGN KEY (UserName) REFERENCES Users(UserName)
ON DELETE CASCADE
);


--- Users that are banned from the entire system.
CREATE TABLE IF NOT EXISTS BlackList(
UserName VARCHAR(255),
PRIMARY KEY (UserName)
FOREIGN KEY (UserName) REFERENCES Users(UserName)
);