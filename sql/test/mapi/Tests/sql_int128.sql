DECLARE a HUGEINT, b HUGEINT, c HUGEINT, d HUGEINT, e HUGEINT;
explain SET a = 1234567890987654321;
explain SET b = 10000000000;
explain SET c = a * b;
explain SET d = c * b;
explain SET e = d + a;
        SET a = 1234567890987654321;
        SET b = 10000000000;
        SET c = a * b;
        SET d = c * b;
        SET e = d + a;
SELECT a, b, c, d, e;
SELECT 123456789098765432101234567890987654321;
START TRANSACTION;
CREATE TABLE sql_int128 (i HUGEINT);
explain INSERT INTO sql_int128 VALUES (123456789098765432101234567890987654321);
        INSERT INTO sql_int128 VALUES (123456789098765432101234567890987654321);
SELECT * FROM sql_int128;