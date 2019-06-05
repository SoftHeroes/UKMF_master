INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00000','YES','Invalid Exception.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00000' AND  `Message` = 'Invalid Exception.'
) LIMIT 1;

INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00001','YES','Invalid EMail ID.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00001' AND `Message` = 'Invalid EMail ID.'
) LIMIT 1;


INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00002','YES','Invalid Phone Number.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00002' AND `Message` = 'Invalid Phone Number.'
) LIMIT 1;


INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00003','YES','Phone Number Already Exists.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00003' AND `Message` = 'Phone Number Already Exists.'
) LIMIT 1;

INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00004','YES','EMail ID Already Exists.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00004' AND `Message` = 'EMail ID Already Exists.'
) LIMIT 1;


INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00005','YES','User Policy cannot be null.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00005' AND `Message` = 'User Policy cannot be null.'
) LIMIT 1;


INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00006','NO','Login successfully.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00006' AND  `Message` = 'Login successfully.'
) LIMIT 1;

INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00007','NO','Signup successfully.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00007' AND  `Message` = 'Signup successfully.'
) LIMIT 1;

INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00008','YES','Invalid username/password.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00008' AND  `Message` = 'Invalid username/password'
) LIMIT 1;

INSERT INTO `messagemaster` (`Code`,`ErrorFound`, `Message`, `version`, `language`)
SELECT * FROM (SELECT 'ERR00009','YES','Invalid language.','1.0.0','English') AS tmp
WHERE NOT EXISTS (
    SELECT `Code` FROM `messagemaster` WHERE `Code` = 'ERR00009' AND  `Message` = 'Invalid language.'
) LIMIT 1;
