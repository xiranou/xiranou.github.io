---
layout: post
title: SQL Injection
week: 7
categories: technical
---
SQL Injection is a technique use by malicious attackers to inject SQL commands via user inputs. A successful attack can read and modify sensitive data from database or even perform administrative operations such as shutting down the DBMS (Database management system).

SQL Injection attacks are very common. When a user input is not validated and is being use in a SQL statement, it becomes vulnerable to an SQL Injection attack. For example, if a SQL statement is written like this:

{% highlight ruby linenos=table %}
  sql_statement = "SELECT * FROM table_1 WHERE user_id = #{input_id}"
{% endhighlight %}

The 'input_id' is being added to the string of the SELECT statement. If, a malicious user were to input something like '101 OR 1=1', the SELECT statement will then becomes:

{% highlight sql linenos=table %}
  SELECT * FROM table_1 WHERE user_id = 101 OR 1 = 1
{% endhighlight %}

Since '1 = 1' will always return 'true', the query will then returns everything from the 'table_1', including it's sensitive information.

There are also SQL Injection attacks based on batched SQL statements. What if the attacker enters something like '101 OR 1=1; DROP TABLE table_1'. The SQL statement then becomes:

{% highlight sql linenos=table %}
  SELECT * FROM table_1 WHERE user_id = 101 or 1 = 1; DROP TABLE table_1
{% endhighlight %}

This will then returns everything from 'table_1' and then deletes it from the database!

SQL Injection is very dangerous indeed, but there are ways to combat this issue. One of them would be setting up a blacklist to search against SQL Injection attacks. However, this is not an efficient way to combat this issue. Words and characters like 'delete', 'drop', ';', and '=' are very commonly used. Also, it is perfectly legal for a database filed to contain SQL statements.

One proven way to protect your database from SQL Injections is to use SQL parameters. The parameters are marked with '@' in a SQL statement, while in Ruby, you can use '?' as a placeholder for the parameter. Using parameters will let the SQL engine to treat them literally instead of executing them as part of a statement. For example, if we change our previous statement string to:

{% highlight ruby linenos=table %}
  sql_statement = "SELECT * FROM table_1 WHERE user_id = ?"
  db.Execute(sql_statement, user_input)
{% endhighlight %}

When the attacker enters '101 OR 1=1' as the input, SQL will treat it literally, looking for an user_id that is exactly '101 OR 1=1' and not treating and executing the 'OR 1=1' as a part of the statement.