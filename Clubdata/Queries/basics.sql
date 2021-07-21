--everything from table facilities
SELECT * FROM facilities;

--print out a list of all of the facilities and their cost to members
SELECT name, membercost FROM facilities;

--list of facilities that charge a fee to members
SELECT * FROM facilities
WHERE membercost>0 AND guestcost>0 AND initialoutlay>0 AND monthlymaintenance>0;

--list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost
SELECT facid, name, membercost, monthlymaintenance FROM facilities
WHERE membercost > 0 AND (membercost < monthlymaintenance / 50.0);


--produce a list of all facilities with the word 'Tennis' in their name
SELECT * FROM facilities
WHERE name like '%Tennis%';

--retrieve the details of facilities with ID 1 and 5

