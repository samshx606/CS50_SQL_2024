SELECT count(*) FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L')
OR ("bats" = 'L' AND "throws" = 'R')
ORDER BY "debut" DESC,"first_name","last_name";
