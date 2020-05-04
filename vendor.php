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

$sql="SELECT items.name, items.price FROM vendors JOIN items ON items.FID_Vendor = vendors.ID_Vendors 
WHERE vendors.name = :vendor";

    $sth=$conn->prepare($sql);
    $sth->execute(array(':vendor' => $_GET['vendor']));
    $result=$sth->fetchAll();


    echo"<table border=1><tr><th>Name</th><th>Price</th></tr>";    
        foreach($result as $row)
            {
                print("<tr><td>$row[0]</td><td>$row[1]</td></tr>");
            }
    echo"</table>";
  $conn=null;