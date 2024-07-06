SELECT ROUND(AVG("height"),2) AS 'Average Height' , ROUND(AVG("weight"),2) AS 'Average Weight' FROM "players"
WHERE "debut" >= '2000-1-1'
ORDER BY "debut" DESC,"first_name","last_name";
