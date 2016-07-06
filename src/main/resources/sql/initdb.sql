CREATE USER IF NOT EXISTS ADMIN SALT '6d4bd0f935601dde' HASH 'b52093f150bde2026992fd1474d8e56e26424aa060b5d7ca6962af944bd2d6d8' ADMIN;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4494B833_B8B6_4A0E_AC3D_31DF19E96E02 START WITH 2 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4D6DB628_4FB9_4DB8_865D_7DB14E3F9061 START WITH 4 BELONGS_TO_TABLE;
CREATE CACHED TABLE PUBLIC.CUSTOMER(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_4D6DB628_4FB9_4DB8_865D_7DB14E3F9061) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4D6DB628_4FB9_4DB8_865D_7DB14E3F9061,
    FIRSTNAME VARCHAR(255) NOT NULL,
    LASTNAME VARCHAR(255) NOT NULL
);
ALTER TABLE PUBLIC.CUSTOMER ADD CONSTRAINT PUBLIC.CONSTRAINT_5 PRIMARY KEY(ID);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.CUSTOMER;
INSERT INTO PUBLIC.CUSTOMER(ID, FIRSTNAME, LASTNAME) VALUES
(1, 'Joe', 'Bloggs'),
(2, 'Alice', 'Doe'),
(3, 'Harry', 'Wizard');
CREATE CACHED TABLE PUBLIC.FILE(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_4494B833_B8B6_4A0E_AC3D_31DF19E96E02) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4494B833_B8B6_4A0E_AC3D_31DF19E96E02,
    CREATED TIMESTAMP NOT NULL,
    EXTENSION VARCHAR(255) NOT NULL,
    FILEDATA BLOB,
    FILENAME VARCHAR(255) NOT NULL,
    UPDATED TIMESTAMP NOT NULL,
    CUSTOMERID BIGINT
);
ALTER TABLE PUBLIC.FILE ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(ID);
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.FILE;
INSERT INTO PUBLIC.FILE(ID, CREATED, EXTENSION, FILEDATA, FILENAME, UPDATED, CUSTOMERID) VALUES
(1, TIMESTAMP '2016-07-06 11:21:53.992', 'zip', X'504b03040a00000000001182db4800000000000000000000000005001c00526f6f742f5554090003514371575143715775780b000104e803000004e8030000504b03040a0000000000e981db4800000000000000000000000009001c00526f6f742f4f6e652f5554090003054371570643715775780b000104e803000004e8030000504b03040a0000000000f481db4800000000000000000000000010001c00526f6f742f4f6e652f4f6e654f6e652f55540900031b4371574843715775780b000104e803000004e8030000504b03040a0000000000f081db480000000000000000000000001a001c00526f6f742f4f6e652f4f6e654f6e652f6f6e656f6e652e7478745554090003134371574843715775780b000104e803000004e8030000504b03040a0000000000fb81db4800000000000000000000000009001c00526f6f742f54776f2f55540900032a4371572a43715775780b000104e803000004e8030000504b03040a0000000000fb81db4800000000000000000000000010001c00526f6f742f54776f2f74776f2e74787455540900032a4371574843715775780b000104e803000004e8030000504b01021e030a00000000001182db48000000000000000000000000050018000000000000001000fd4100000000526f6f742f55540500035143715775780b000104e803000004e8030000504b01021e030a0000000000e981db48000000000000000000000000090018000000000000001000fd413f000000526f6f742f4f6e652f55540500030543715775780b000104e803000004e8030000504b01021e030a0000000000f481db48000000000000000000000000100018000000000000001000fd4182000000526f6f742f4f6e652f4f6e654f6e652f55540500031b43715775780b000104e803000004e8030000504b01021e030a0000000000f081db480000000000000000000000001a0018000000000000000000b481cc000000526f6f742f4f6e652f4f6e654f6e652f6f6e656f6e652e74787455540500031343715775780b000104e803000004e8030000504b01021e030a0000000000fb81db48000000000000000000000000090018000000000000001000fd4120010000526f6f742f54776f2f55540500032a43715775780b000104e803000004e8030000504b01021e030a0000000000fb81db48000000000000000000000000100018000000000000000000b48163010000526f6f742f54776f2f74776f2e74787455540500032a43715775780b000104e803000004e8030000504b05060000000006000600f5010000ad0100000000', 'root', TIMESTAMP '2016-07-06 11:21:53.992', 1);
ALTER TABLE PUBLIC.FILE ADD CONSTRAINT PUBLIC.FK_8EWNEF0B1M08LOXXPNEPS3TWX FOREIGN KEY(CUSTOMERID) REFERENCES PUBLIC.CUSTOMER(ID) NOCHECK;