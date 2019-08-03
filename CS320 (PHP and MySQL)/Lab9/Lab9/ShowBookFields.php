<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Henry's Bookstore | Update Book Details</title>
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
	
	$query = "SELECT title, publisher_code, type, price, paperback
		FROM henry_book
		WHERE book_code = '$book_code';";
	echo $query;
	
	$result = mysql_query($query)
		or die("SQL Error: <b>" . mysql_error() . "<b><br />");
		
	$queryPub = "SELECT publisher_code, publisher_name
		FROM henry_publisher
		ORDER BY publisher_name;";
	
	$resultPub = mysql_query($queryPub)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");
		
	$queryType = "SELECT DISTINCT type
		FROM henry_book
		ORDER BY type;";
	
	$resultType = mysql_query($queryType)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");
	
	$queryPaperback = "SELECT DISTINCT paperback
		FROM henry_book;";
	
	$resultPaperback = mysql_query($queryPaperback)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");
	
	
	
	  
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
<h1><a href="Index.html">Henry's Bookstore</a></h1>
<h3>Update selected book:</h3>
<form action="UpdateBook.php" method="get">
<input name="book_code" value="0180" type="hidden" id="book_code" />
<table width="295" border="1">

  <tr>
    <td class="textAlignRight">Title:</td>
    <td><input name="title" value="<?php $row = mysql_fetch_array($result); echo $row["title"] ?>" type="text" id="title" size="30" maxlength="30" /></td>
  </tr>
  <tr>
    <td class="textAlignRight">Publisher:</td>
    <td>
		<select name="publisher_code">
		<?php while ($row2 = mysql_fetch_array($resultPub)) { ?>       
		<option value="<?php echo $row2["publisher_code"] ?>"><?php echo $row2["publisher_code"] ?></option>              
		<?php } ?></select></td>
  </tr>
  <tr>
    <td class="textAlignRight">Type:</td>
    <td><select name="type" id="type">
		<?php while ($row3 = mysql_fetch_array($resultType)) { ?>       
		<option value="<?php echo $row3["type"] ?>"><?php echo $row3["type"] ?></option>              
		<?php } ?>
   	  </select></td>
  </tr>
  <tr>
    <td class="textAlignRight">Price:</td>
    <td><input name="price" value="<?php echo $row["price"] ?>" type="text" id="price" size="10" maxlength="10" /></td>
  </tr>
  <tr>
    <td class="textAlignRight">Paperback:</td>
    <td><select name="type" id="type">
		<?php while ($row4 = mysql_fetch_array($resultPaperback)) { ?>       
		<option value="<?php echo $row4["paperback"] ?>"><?php echo $row4["paperback"] ?></option>              
		<?php } ?>
   	  </select></td>
  </tr>
  <tr>
    <td class="textAlignRight"><input type="submit" name="submit" id="submit" value="Update" /></td>
    <td><input type="reset" name="submit" id="submit" value="Cancel" /></td>
  </tr>
</table>
</form>
</body>
</html>