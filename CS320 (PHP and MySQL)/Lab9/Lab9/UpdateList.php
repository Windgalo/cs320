<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Henry's Bookstore | Update Book</title>
</head>

<body>
<?php

//Connect to the MySQL database

	mysql_connect("dario.cs.uwec.edu","FORSSMG","RLCYKFG7")

		or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error()); 

//Specify the database

	mysql_select_db("FORSSMG")

		or die("Could not connect to the database.The reported SQL error is:<br />" . mysql_error()); 

	$queryBooks = "SELECT book_code, title
		FROM henry_book
		ORDER BY title;";
	
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
<h1><a href="Index.html">Henry's Bookstore </a></h1>
<form action="ShowBookFields.php" method="get">
  <h3>Update Book Title:</h3>
  <p>
    <select name="book_code">
	  <?php while ($row = mysql_fetch_array($resultBooks)) { ?> 
      <option value="<?php echo $row["book_code"]?>"><?php echo $row["title"]?></option>
	  <?php } ?>
    </select>    
  </p>
  <input type="submit" value="Update" />
</form>
</body>
</html>