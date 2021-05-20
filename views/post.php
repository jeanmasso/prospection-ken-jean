<?php

include "../layout/header.php";
include "../classes/tableClass.php";

//$posts = new Table();
//$posts = $posts->getAllData();

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
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
    </tbody>
  </table>
</div>
<?php

include "../layout/footer.php";

?>
    