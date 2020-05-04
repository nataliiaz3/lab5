<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Zaporozhets lab1</title>
</head>
<body>
<form action="vendor.php" method="GET">
  <label>Товары производителя:</label>
  <select name='vendor'>
			<?php
				include 'db.php';
				$vendors = "SELECT name FROM vendors";
				$sth = $conn->prepare($vendors);
				$sth->execute();
				
				$result = $sth->fetchAll(PDO::FETCH_NUM);

				echo '<option selected = "selected">Выберите производителя</option>';

				foreach($result as $name)
				{
					echo "<option>$name[0]</option>";
				}
				$conn=null;
			?>
			</select>
		<input type="submit" value="Показать">
</form>
<br>
<form action="category.php" method="GET">
  <label>Товары категории:</label>
  <select name='category'>
			<?php
				include 'db.php';
				$category = "SELECT name FROM category";
				$sth = $conn->prepare($category);
				$sth->execute();
				
				$result = $sth->fetchAll(PDO::FETCH_NUM);

				echo '<option selected = "selected">Выберите категорию</option>';

				foreach($result as $name)
				{
					echo "<option>$name[0]</option>";
				}
				$conn=null;
			?>
			</select>
		<input type="submit" value="Показать">
</form>
<br>
<form action="price.php" method="GET">
  <label>Товары в ценовом диапазоне: </label>
		с <input type="number" name = "minPrice">
		по <input type="number" name = "maxPrice">
		<input type="submit" value="Показать">
</form>
</body>
</html>
