CREATE SCHEMA relational_chirper;
USE relational_chirper;

CREATE TABLE users (
	id INT AUTO_INCREMENT,
    handle VARCHAR(50) UNIQUE,
    email VARCHAR(50) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE chirps (
	id INT AUTO_INCREMENT,
    user_id INT,
    body VARCHAR(500),
    location VARCHAR(200),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);



INSERT INTO users (handle , email) values
("crow", "croww@bing.com"), ("pidgeon", "whiteswan@gmail.com"), ("avocet", "americaw@hotmail.com"), ("flamingo", "longleg@gmail.com"), ("crocodile", "notacroc@protonmail.com");

INSERT INTO chirps (body, location, user_id) VALUES
("CAW", "top of building", "1"), ("CAWWWWW", "above building", "1"), ("caw?", "behind building", "1"), ("caww :(", "behind closed resturaunt", "1"), ("CAW", "in the park", "1"),
("i am great", "behind building", "2"), ("i see food gonna eat it", "tim hortons", "2"), ("that guy was rude smh", "hospital", "2"), ("still got the food tho", "hospital roof", "2"), ("i am still great", "in the park", "2"),
("i love america", "top of building", "3"), ("make sure to pay taxes today", "inside building", "3"), ("dont trust commies", "in the park", "3"), ("watch out for crocodiles", "hospital roof", "3"), ("back home", "inside building", "3"),
("i like shirmp", "swamp", "4"), ("that croc is here i gotta leave", "in the park", "4"), ("shirmp over there 0.0", "behind resturaunt", "4"), ("bleh this sucks", "behind resturaunt", "4"), ("back home", "swamp", "4"),
("hungry :(", "swamp", "5"), ("someone come hang out :/", "swamp", "5"), ("aight im coming there >:)", "in the park", "5"), ("met some friends :D", "hospital", "5"), ("got evicted D:", "swamp", "5");

-- i spent way too much effort on this section i dont know why

INSERT INTO users (handle, email) value
("frog", "ribbit@cricket.net");

SELECT 
	c.id as chirp_id,
    u.id as user_id,
    c.body
FROM chirps c
JOIN users u ON u.id = c.user_id; 

INSERT INTO chirps (body, location, user_id) Values
("go away @crocodile" , "swamp", "4"), 
("why D: im not doing anything wrong am I @flamingo", "swamp", "5"), 
("yeah @flamingo he isnt doing anything wrong let him be" , "inside building", "3");

CREATE TABLE mentions (
	chirp_id INT,
    user_id INT,
    PRIMARY KEY(chirp_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (chirp_id) REFERENCES chirps (id)
);

INSERT INTO mentions (chirp_id, user_id) Value
-- ("26", "5")
-- ("27", "4")
("28", "4")

;

SELECT 
	c.*,
   	u.handle,
    u.email
from mentions m
JOIN chirps c ON c.id = m.chirp_id
JOIN users u ON u.id = m.user_id; 