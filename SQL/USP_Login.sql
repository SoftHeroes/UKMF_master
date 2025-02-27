DROP procedure IF EXISTS `USP_login`;

DELIMITER $$
CREATE PROCEDURE `USP_login` ( IN p_Username VARCHAR(255),IN p_Password VARCHAR(255) ,IN p_Language VARCHAR(255) )
proc_Call:BEGIN
	DECLARE RowCount INT DEFAULT 0;

  -- Language check block : START
  IF ( p_Language IS NULL OR TRIM(p_Language) = '' ) THEN
  BEGIN
    SELECT `Code`,`ErrorFound`,`Message`,`version`,`language` FROM `messagemaster` WHERE `Code` = 'ERR00012' AND `language` = 'English';
    LEAVE proc_Call;
  END;
  ELSEIF NOT EXISTS (select 1 from languagelookup where language = p_Language) THEN
    BEGIN
      SELECT `Code`,`ErrorFound`,`Message`,`version`,`language` FROM `messagemaster` WHERE `Code` = 'ERR00009' AND `language` = 'English';
      LEAVE proc_Call;
    END;
  END IF;
  -- Language check block : END
  
  -- Input check block : START
  IF(  p_Username IS NULL OR TRIM(p_Username) = '' ) THEN
    BEGIN
    SELECT * FROM `messagemaster` WHERE `Code` = 'ERR00010' AND `language` = p_Language;
    LEAVE proc_Call;
    END;
  ELSEIF ( p_Password IS NULL OR TRIM(p_Password) = '' ) THEN
    BEGIN
      SELECT * FROM `messagemaster` WHERE `Code` = 'ERR00011' AND `language` = p_Language;
      LEAVE proc_Call;
    END;
  END IF;
	-- Input check block : END
    
  -- Credentials validation block : START
	SET RowCount = ( SELECT 1 FROM `UserInformation` WHERE (emailID = p_Username OR phoneNumber = p_Username) AND password = PASSWORD(p_Password) );
    
  IF(RowCount > 0 ) THEN 
  SELECT `Code`,`ErrorFound`,`Message`,`version`,`language` FROM `messagemaster` WHERE `Code` = 'ERR00006' AND `language` = p_Language;
  ELSE
  SELECT `Code`,`ErrorFound`,`Message`,`version`,`language` FROM `messagemaster` WHERE `Code` = 'ERR00008' AND `language` = p_Language;
  END IF;
  -- Credentials validation block : END
END$$

DELIMITER ;

-- call USP_login('9074200979','Test123!','English')