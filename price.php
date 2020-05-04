<?php
include 'db.php';
try
{ 
    $conn=new PDO($dsn,$user,$pass);
   
}
catch(PDOException $e)
{
    print "ERROR!".$e->getMessage()."<br/>";
    die();
}
$sql="SELECT name, price FROM items WHERE price >= :minPrice AND price <= :maxPrice";

    $sth=$conn->prepare($sql);
    $sth->execute(array(':minPrice' => $_GET['minPrice'], ':maxPrice' => $_GET['maxPrice']));
    $result=$sth->fetchAll();


    echo"<table border=1><tr><th>Name</th><th>Price</th></tr>";    
        foreach($result as $row)
            {
                print("<tr><td>$row[0]</td><td>$row[1]</td></tr>");
            }
    echo"</table>";
  $conn=null;