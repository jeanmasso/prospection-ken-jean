<?php

include "../layout/header.php";
include "../classes/tableClass.php";

//$posts = new Table();
//$posts = $posts->getAllData();

?>
<?php
$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = 'prospection';

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

//query for posts
$stmt = $conn->query('SELECT .*, users.firstname, categories.name FROM posts JOIN categories ON posts.Categories_id = categories.id JOIN users ON posts.Users_id = users.id WHERE posts.id='. $_GET['id']);
$stmt->execute();
$post = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<div class="container my-5">
  <table class="table table-bordered text-center">
    <thead>
    <tr>
      <th colspan="4" scope="col">Informations Clients</th>
      <th colspan="8" scope="col">Actions</th>
    </tr>
    <tr>
      <th rowspan="2">Clients</th>
      <th rowspan="2">Adresse</th>
      <th rowspan="2">Mail</th>
      <th rowspan="2">Téléphone</th>
      <th colspan="2">Mailing</th>
      <th colspan="2">Relance</th>
      <th colspan="2">Visite</th>
      <th colspan="2">Commande</th>
    </tr>
    <tr>
      <th>Date</th>
      <th>Résultat</th>
      <th>Date</th>
      <th>Résultat</th>
      <th>Date</th>
      <th>Résultat</th>
      <th>Date</th>
      <th>Résultat</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <th scope="row"></th>
      <td><?=$prospect['name']?></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    </tbody>
  </table>
</div>
<?php

include "../layout/footer.php";

?>
    