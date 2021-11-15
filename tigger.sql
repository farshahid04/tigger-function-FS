SELECT * FROM synthea.Shahid_Faryal;
INSERT INTO Shahid_Faryal (patientUID, lastname, fasting, 2hrspostmeal) VALUES (43418,‘hoe’,400,100);

SELECT * FROM synthea.Shahid_Faryal;
delimiter $$
CREATE TRIGGER qualityValues BEFORE INSERT ON Shahid_Faryal
FOR EACH ROW
BEGIN
 IF NEW.fasting >= 70 THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'ERROR: fasting level MUST BE BELOW 70 mg!';
 END IF;
END; $$
delimiter ;