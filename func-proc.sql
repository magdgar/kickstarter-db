CREATE DEFINER=`root`@`%` FUNCTION `check_if_user_can_pass_this_amount`(user_id int, amount int) RETURNS tinyint(1)
BEGIN
	if (SELECT count(id) FROM kickstarter.users where id = user_id and money >= amount) 
	then return true;
    end if;
    
	return false;
END

CREATE DEFINER=`root`@`%` FUNCTION `check_if_project_in_database`(project_id int) RETURNS tinyint(1)
BEGIN
	if (SELECT count(id) FROM kickstarter.projects where id = project_id) 
	then return true;
    end if;
	return false;
END

CREATE DEFINER=`root`@`%` PROCEDURE `transfer_money`(user_id int,  project_id int, amount int)
    MODIFIES SQL DATA
BEGIN
start transaction;
if (select check_if_user_can_pass_this_amount(user_id, amount) and check_if_project_in_database(project_id))
then
	update users set money = money - amount where id = user_id;
	update projects set money = money + amount where id = project_id;
    insert into transactions (project_id, user_id, money, timestamp, state) values (project_id, user_id, amount, now(), 'accepted' );
else
	insert into transactions (project_id,user_id, money, timestamp, state) values (project_id, user_id, amount, now(), 'failed' );
end if;
commit;
END