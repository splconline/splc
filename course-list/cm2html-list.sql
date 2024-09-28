SELECT
Code, "<p><strong>" || Name || "</strong><br><em>" || REPLACE(Times,"runs for ",'') || " (" || Cost || ')</em><br><a href="" target = "_new"><strong>[ Enrol ]</strong></a></p>'
AS Html
FROM
languages
