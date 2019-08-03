<?php error_reporting(E_ALL); ?>


<html>

<head>
	<meta charset="utf-8">
	<title>Alyssa's Pending Orders</title>
</head>

<body>
<?php

//Connect to the MySQL database

	mysql_connect("dario.cs.uwec.edu","FORSSMG","RLCYKFG7")

		or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error()); 

//Specify the database

	mysql_select_db("FORSSMG")

		or die("Could not connect to the database.The reported SQL error is:<br />" . mysql_error()); 

	$query = "SELECT DISTINCT cust.cust_name, pur.purch_id, pur.purch_date, prod.prod_desc, pur.pounds, pur.status
	FROM candy_purchase pur JOIN candy_customer cust
	ON pur.cust_id = cust.cust_id
	JOIN candy_purchase JOIN candy_product prod
	ON pur.prod_id = prod.prod_id
	WHERE pur.delivery_date IS NULL
	ORDER BY purch_id;";

	$result = mysql_query($query)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");

?>

	<table border="4" cellpadding="3" cellspacing="1">

		<tr><th>Name</th><th>Purchase ID</th><th>Purchase Date</th><th>Product</th><th>Pounds</th><th>Status</th>

		<?php while ($row = mysql_fetch_array($result)) { ?>

		<tr><td><?php echo $row["cust_name"] ?></td>

		<td><?php echo $row["purch_id"] ?></td>

		<td><?php echo $row["purch_date"] ?></td>
  
		<td><?php echo $row["prod_desc"] ?></td>
  
		<td><?php echo $row["pounds"] ?></td>
  
		<td><?php echo $row["status"] ?></td>

		</tr>

		<?php } ?>

	</table>
	
</body>

</html>
