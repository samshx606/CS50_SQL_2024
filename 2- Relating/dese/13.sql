SELECT name,per_pupil_expenditure FROM districts d
JOIN expenditures e ON d.id = e.district_id
WHERE d.type = 'Public School District'
ORDER BY per_pupil_expenditure DESC
LIMIT 10;
