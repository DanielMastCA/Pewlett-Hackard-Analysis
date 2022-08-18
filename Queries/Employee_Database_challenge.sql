-- Create a table of retiring employees with their latest titles
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	t.title
INTO unique_titles
FROM employees AS e
INNER JOIN titles AS t
    ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

-- Find total retiring employees grouped by their title
SELECT COUNT(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- find employees elegible for mentorship
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;