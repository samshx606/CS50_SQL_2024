SELECT s.name , e.per_pupil_expenditure , g.graduated
FROM expenditures e JOIN schools s ON e.district_id = s.district_id
JOIN graduation_rates g ON g.school_id = s.id
ORDER BY e.per_pupil_expenditure DESC , s.name;
