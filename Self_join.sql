-- Question 1

SELECT COUNT(*) FROM stops

-- Question 2

SELECT id FROM stops WHERE name = 'Craiglockhart'

-- Question 3

SELECT id, name FROM stops JOIN route ON stops.id = stop WHERE num = '4'

-- Question 4

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*) = 2

-- Question 5

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- Question 6

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name= 'London Road'

-- Question 7

SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) WHERE (a.stop = 115 AND b.stop = 137) OR (a.stop = 137 AND b.stop = 115)

-- Question 8

SELECT a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) WHERE (a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart') AND b.stop = (SELECT id FROM stops WHERE name = 'Tollcross'))

-- Question 9

SELECT DISTINCT d.name, a.company, a.num FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num) JOIN stops c ON (a.stop = c.id)
JOIN stops d ON (b.stop = d.id)
WHERE (c.name = 'Craiglockhart') AND a.company = 'LRT'

-- Question 10

SELECT DISTINCT a.num, b.company, y.name, d.num, d.company 
from route a
JOIN stops x ON (a.stop = x.id) 
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops y ON (b.stop = y.id)
JOIN route c ON (b.stop = c.stop AND b.num != c.num)
JOIN stops z ON (c.stop = z.id)
JOIN route d ON (c.company = d.company AND c.num = d.num)
JOIN stops w ON (d.stop = w.id)
WHERE x.name = 'Craiglockhart' AND w.name = 'Lochend' AND y.name = z.name
ORDER BY b.num, y.name, 4