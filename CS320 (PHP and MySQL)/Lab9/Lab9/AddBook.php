<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Henry's Bookstore | Add New Book</title>
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
<h1>Henry's Bookstore - Add New Book</h1>
<form action="InsertBook.php" method="get">
<table width="295" border="1">

  <tr>
    <td width="118" class="textAlignRight">Book Code:</td>
    <td width="161"><input name="book_code" type="text" id="book_code" size="8" maxlength="4" /></td>
  </tr>
  <tr>
    <td class="textAlignRight">Title:</td>
    <td><input name="title" type="text" id="title" size="30" maxlength="30" /></td>
  </tr>
  <tr>
    <td class="textAlignRight">Publisher:</td>
    <td><select name="publisher_code">
		<?php while ($row = mysql_fetch_array($resultPub)) { ?>       
		<option value="<?php echo $row["publisher_code"] ?>"><?php echo $row["publisher_name"] ?></option>              
		<?php } ?>
      </select></td>
  </tr>
  <tr>
    <td class="textAlignRight">Type:</td>
    <td><select name="type" id="type">
		<?php while ($row = mysql_fetch_array($resultType)) { ?>       
		<option value="<?php echo $row["type"] ?>"><?php echo $row["type"] ?></option>              
		<?php } ?>
   	  </select></td>
  </tr>
  <tr>
    <td class="textAlignRight">Price:</td>
    <td><input name="price" type="text" id="price" size="10" maxlength="10" /></td>
  </tr>
  <tr>
    <td class="textAlignRight">Paperback:</td>
    <td><select name="paperback" size="1" id="paperback">
    		<option value="N" selected="selected">No</option>
            <option value="Y">Yes</option>
   	  </select></td>
  </tr>
  <tr>
    <td class="textAlignRight"><input type="submit" name="submit" id="submit" value="Save" /></td>
    <td><input type="reset" name="submit" id="submit" value="Cancel" /></td>
  </tr>
</table>
</form>
</body>
</html>
<?php 
	mysql_close();
?>