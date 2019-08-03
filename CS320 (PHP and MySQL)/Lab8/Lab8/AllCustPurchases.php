<?php error_reporting(E_ALL); ?>


<html>

<head>
	<meta charset="utf-8">
	<title>All Customer Purchases</title>
</head>

<body>
<?php

//Connect to the MySQL database

	mysql_connect("dario.cs.uwec.edu","FORSSMG","RLCYKFG7")

		or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error()); 

//Specify the database

	mysql_select_db("FORSSMG")

		or die("Could not connect to the database.The reported SQL error is:<br />" . mysql_error()); 

	$query = "SELECT DISTINCT cust.cust_name, prod.prod_desc, CONVERT(DATE_FORMAT(pur.purch_date, '%b %e, %Y') USING latin1) AS purch_date, CONVERT(DATE_FORMAT(pur.delivery_date, '%b %e, %Y') USING latin1) AS delivery_date, FORMAT(pur.pounds, 2) AS pounds
FROM candy_purchase pur JOIN candy_customer cust
ON pur.cust_id = cust.cust_id
JOIN candy_purchase JOIN candy_product prod
ON pur.prod_id = prod.prod_id
ORDER BY cust.cust_name;";

	$result = mysql_query($query)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");

?>

	<table border="4" cellpadding="3" cellspacing="1">

		<tr><th>Customer</th><th>Product</th><th>Purchase Date</th><th>Delivery Date</th><th>Pounds</th>

		<?php while ($row = mysql_fetch_array($result)) { ?>

		<tr><td><?php echo $row["cust_name"] ?></td>

		<td><?php echo $row["prod_desc"] ?></td>

		<td><?php echo $row["purch_date"] ?></td>
  
		<td><?php echo $row["delivery_date"] ?></td>
  
		<td><?php echo $row["pounds"] ?></td>

		</tr>

		<?php } ?>

	</table>
	
</body>

</html>
