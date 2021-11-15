SELECT * FROM ahi.shahidF_diabetes;

delimiter $$
CREATE TRIGGER qualityvalues BEFORE INSERT ON shahidf_diabetes
FOR EACH ROW
BEGIN
 IF NEW.fasting >= 70 THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'ERROR: fasting MUST BE BELOW 70 mg!';
 END IF;
END; $$
delimiter ; 

DELIMITER $$
CREATE FUNCTION MedicationCost(cost DECIMAL(10,2))
RETURNS VARCHAR(20)
BEGIN
 DECLARE highdiabetes VARCHAR(20);
 IF fasting >= 100 THEN
SET fastingvalue = ‘high’;
 END IF;
 ELSEIF fasting < 100 THEN
 SET fastingvalue = ‘normal’;
 END IF;
RETURN (fastingvalue);
END
$$ DELIMITER;
