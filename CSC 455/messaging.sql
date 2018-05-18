
DROP TABLE person CASCADE CONSTRAINTS;
DROP TABLE contact_list CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;

/* =========================
Create the Person table. 
Table Name: person
Primary Key: person_id
========================= */
CREATE TABLE person ( 
    person_id NUMBER(8) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (person_id)
);

/* =========================
Create the Contact List table. 
Table Name: contact_list
Primary Key: connection_id
========================= */
CREATE TABLE contact_list ( 
    connection_id NUMBER(8) NOT NULL,
    person_id NUMBER(8) NOT NULL,
    contact_id NUMBER(8) NOT NULL,
    PRIMARY KEY (connection_id)
);

/* =========================
Create the Messages table. 
Table Name: message
Primary Key: message_id
========================= */
CREATE TABLE message ( 
    message_id NUMBER(8) NOT NULL,
    sender_id NUMBER(8) NOT NULL,
    receiver_id NUMBER(8) NOT NULL,
    message VARCHAR(255) NOT NULL,
    send_datetime TIMESTAMP NOT NULL,
    PRIMARY KEY (message_id)
);

/* =========================
Populate the Person table. 
========================= */
INSERT INTO person (person_id, first_name, last_name) VALUES (1,'Michael', 'Phelps');
INSERT INTO person (person_id, first_name, last_name) VALUES (2,'Katie', 'Ledecky');
INSERT INTO person (person_id, first_name, last_name) VALUES (3,'Usain', 'Bolt');
INSERT INTO person (person_id, first_name, last_name) VALUES (4,'Allyson', 'Felix');
INSERT INTO person (person_id, first_name, last_name) VALUES (5,'Kevin', 'Durant');
INSERT INTO person (person_id, first_name, last_name) VALUES (6,'Diana', 'Taurasi');

/* =========================
Populate the Contact List table. 
========================= */
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (1, 1, 2);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (2,1, 3);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (3,1, 4);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (4,1, 5);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (5,1, 6);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (6,2, 1);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (7,2, 3);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (8,2, 4);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (9,3, 1);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (10,3, 4);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (11,4, 5);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (12,4, 6);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (13,5, 1);
INSERT INTO contact_list (connection_id,person_id, contact_id) VALUES (14,5, 6);

/* =========================
Populate the Message table. 
========================= */
INSERT INTO message (message_id,sender_id, receiver_id, message, send_datetime) VALUES (1,1, 2, 'Congrats on winning the 800m Freestyle', to_date('2016-12-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO message (message_id,sender_id, receiver_id, message, send_datetime) VALUES (2,2, 1, 'Congrats on winning 23 gold medals!', to_date('2016-12-25 09:01:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO message (message_id,sender_id, receiver_id, message, send_datetime) VALUES (3,3, 1, 'You are the greatest swimmer ever', to_date('2016-12-25 09:02:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO message (message_id,sender_id, receiver_id, message, send_datetime) VALUES (4,1, 3, 'Thanks!  You are the greatest sprinter ever', to_date('2016-12-25 09:04:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO message (message_id,sender_id, receiver_id, message, send_datetime) VALUES (5,1, 4, 'Good luck on your race', to_date('2016-12-25 09:05:00','YYYY-MM-DD HH24:MI:SS'));



