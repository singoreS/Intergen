
SELECT programme
FROM 
    Intergen.programme
JOIN
    Intergen.association
JOIN
    Intergen.programme_association
ON
    programme_association.programme.id = programme.id
AND
    programme_association,association.id = association.id
ORDER BY 
programme.datestart;
