DELIMITER $$

CREATE FUNCTION Sec_to_time(seconds int) 
  RETURNS varchar(250)
  DETERMINISTIC
BEGIN
  DECLARE result varchar(250);
  DECLARE days_value int DEFAULT 0;
  DECLARE hours_value int DEFAULT 0;
  DECLARE minutes_value int DEFAULT 0;

  IF seconds >= 86400 THEN
    SET days_value = seconds DIV 86400;
    SET seconds = seconds % 86400;
  END IF;

  IF seconds >= 3600 THEN
    SET hours_value = seconds DIV 3600;
    SET seconds = seconds % 3600; 
  END IF;

  IF seconds >=60 THEN
    SET minutes_value = seconds DIV 60;
    SET seconds = seconds % 60;
  END IF;
  
  SET result = CONCAT(
                    CAST(days_value AS CHAR), ' дней ',
                    CAST(hours_value AS CHAR), ' час ',
                    CAST(minutes_value AS CHAR), 'мин.');

  SET result = CONCAT(result, CAST(seconds AS CHAR), ' сек.');
  
  RETURN result;
END$$

DELIMITER ;