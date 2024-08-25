SELECT
Code, "<h2>" || Name || "</h2><em>" || REPLACE(Times,"runs for ",'') || " (" || Cost || ")</em><p>" || 
Description || ' <a href="" target = "_new"><strong>[ Enrol ]</strong></a></p>'
AS Html
FROM
course_list
