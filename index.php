<?php
  include "config/database.php";
  $prospects = new Database();
  $prospects = $prospects->getAllProspect();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Prospection</title>
  <link rel="stylesheet" href="styles/style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
  <div class="container my-5">
    <table class="table table-bordered text-center">
      <thead>
      <tr>
        <th colspan="2" scope="col">Informations Clients</th>
        <th colspan="8" scope="col">Actions</th>
      </tr>
      <tr>
        <th rowspan="2"><div class="mb-3">Id</div></th>
        <th rowspan="2"><div class="mb-3">Clients</div></th>
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
        <th>XPF</th>
      </tr>
      </thead>
      <tbody>
      <?php foreach ($prospects as $prospect) : ?>
      <tr>
        <td scope="row"><?php echo $prospect["id_prospect"]?></td>
        <td scope="row"><?php echo $prospect["name_prospect"]?></td>
        <!-- Mailing -->
        <td><?php echo $prospect["date_mailing"]; ?></td>
        <td>
          <?php
            if ($prospect["result_mailing"] === "RDV")
              echo $prospect["result_mailing"] . " : " . $prospect["date_rdv_mailing"];
            else
              echo $prospect["result_mailing"];
          ?>
        </td>
        <!-- Relance -->
        <td><?php echo $prospect["date_relance"]; ?></td>
        <td>
          <?php
            if ($prospect["result_relance"] === "RDV")
              echo $prospect["result_relance"] . " : " . $prospect["date_rdv_relance"];
            else
              echo $prospect["result_relance"];
          ?>
        </td>
        <!-- Visite -->
        <td><?php echo $prospect["date_visite"]; ?></td>
        <td><?php echo $prospect["result_visite"]; ?></td>
        <!-- Commande -->
        <td><?php echo $prospect["date_commande"]; ?></td>
        <td><?php echo $prospect["price_commande"]; ?></td>
      </tr>
      <?php endforeach; ?>
    </tbody>
    </table>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>