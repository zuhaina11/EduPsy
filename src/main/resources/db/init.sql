--  todo: ukloniti drop nakon development-a
/*
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS SUBJECT;
DROP TABLE IF EXISTS QUESTION;
DROP TABLE IF EXISTS INDEX;
*/

CREATE TABLE IF NOT EXISTS USER (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  username  TEXT NOT NULL,
  password  TEXT NOT NULL,
  firstName TEXT NOT NULL,
  lastname  TEXT,
  email     TEXT,
  status    TEXT CHECK (status IN ('ADMIN', 'TEACHER', 'STUDENT'))
);

CREATE TABLE IF NOT EXISTS SUBJECT (
  id       INT PRIMARY KEY AUTO_INCREMENT,
  title    TEXT NOT NULL,
  keywords TEXT,
  url      TEXT
);

CREATE TABLE IF NOT EXISTS QUESTION (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  subjectId INT  NOT NULL,
  titleId   TEXT NOT NULL,
  question  TEXT NOT NULL,
  answers   TEXT NOT NULL,
  points    INT  NOT NULL
);

CREATE TABLE IF NOT EXISTS INDEX (
  id    INT PRIMARY KEY AUTO_INCREMENT,
  dummy TEXT
)



