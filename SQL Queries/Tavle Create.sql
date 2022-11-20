CREATE TABLE Users(
 UserId int IDENTITY(1,1) PRIMARY KEY,
 Username varchar(255) NOT NULL,
 PasswordHash varchar(255) NOT NULL,
 ProfilePicture image,
);

GO

CREATE TABLE Quiz(
	QIndex int IDENTITY(1,1) PRIMARY KEY,
	QName varchar(255) NOT NULL,
	QuestionsJson text NOT NULL,
	TimeOfCreation dateTime,
	Creator int FOREIGN KEY REFERENCES Users(UserId)
);

GO

CREATE TABLE Guess(
	GId int IDENTITY(1,1) PRIMARY KEY,
	QIndex int FOREIGN KEY REFERENCES Quiz(QIndex) NOT NULL,
	UserId int FOREIGN KEY REFERENCES Users(UserId),
	AnswerJson text NOT NULL,
	Points int NOT NULL,
	TimeOfAnswer datetime
);

GO

ALTER TABLE Quiz
ADD HighScore int FOREIGN KEY REFERENCES Guess(GId);
