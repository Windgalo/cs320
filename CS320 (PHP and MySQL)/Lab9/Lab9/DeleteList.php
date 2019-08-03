<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Henry's Bookstore | Delete Book</title>
</head>

<body>
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
<form action="DeleteBook.php" method="get">
  <h3>Delete Book Title:</h3>
  <p>
    <select name="book_code">
      <option value="0180">A Deepness in the Sky</option>
      <option value="0189">Magic Terror</option>
      <option value="0200">The Stranger</option>
    </select>    
  </p>
  <input type="submit" value="Delete" />
</form>
</body>
</html>