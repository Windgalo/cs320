<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Henry's Bookstore | New Book Inserted</title>
<link href="Henrys.css" rel="stylesheet" type="text/css" />
</head>

<body>

<?php

//Connect to the MySQL database

	mysql_connect("dario.cs.uwec.edu","FORSSMG","RLCYKFG7")

		or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error()); 

//Specify the database

	mysql_select_db("FORSSMG")

		or die("Could not connect to the database.The reported SQL error is:<br />" . mysql_error()); 

	$book_code = $_REQUEST["book_code"];
	$title = $_REQUEST["title"];
	$publisher_code = $_REQUEST["publisher_code"];
	$type = $_REQUEST["type"];
	$price = $_REQUEST["price"];
	$paperback = $_REQUEST["paperback"];
	
	$query = "INSERT INTO henry_book
		VALUES
		('$book_code','$title','$publisher_code','$type', $price, '$paperback');";
	echo $query;
	
	$result = mysql_query($query)
		or die("SQL Error: <b>" . mysql_error() . "<b><br />");
	
	$queryBooks = "SELECT * FROM henry_book;";
	
	$resultBooks = mysql_query($queryBooks)
		or die("SQL Error: <b>" . mysql_error() . "<b><br />");	
?>

<!-- heading table and images -->
<table width="200" border="3" bordercolor="#CC3366" cellpadding="5">
  <tr>
    <td><img src="Images/books1.jpg" width="104" height="70"></td>
    <td> </td>
    <td><img src="Images/elephant.jpg" width="116" height="122"></td>
    <td></td>
    <td><img src="Images/books2.jpg" width="98" height="105"></td>
  </tr>
</table>
<h1>Henry's Bookstore</h1>
<h3>New Book Successfully Inserted!</h3>
<table width="535" border="1">
  <tr>
    <th width="38">Book Code</th>
    <th width="149">Title</th>
    <th width="92">Publisher</th>
    <th width="31">Type</th>
    <th width="45">Price</th>
    <th width="140">Paperback?</th>
  </tr>
  
  <?php while ($row = mysql_fetch_array($resultBooks)) { ?>  
	<tr>
		<td><?php echo $row["BOOK_CODE"] ?></td>           	
		<td><?php echo $row["TITLE"] ?></td> 
		<td><?php echo $row["PUBLISHER_CODE"] ?></td> 
		<td><?php echo $row["TYPE"] ?></td> 
		<td><?php echo $row["PRICE"] ?></td> 
		<?php if($row["PAPERBACK"] == 'Y'){
			$paperbackExt = "Yes";
		} else {
			$paperbackExt = "No";
		} ?>
		<td><?php echo $paperbackExt ?></td>
	</tr>
  <?php } ?>

</table>

</body>
</html>
<?php 
	mysql_close();
?>