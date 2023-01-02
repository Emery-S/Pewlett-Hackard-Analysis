SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
on e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
--INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

SELECT COUNT(ut.emp_no),
    ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
	ON (e.emp_no = de.emp_no)
Left outer Join titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;