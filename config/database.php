<?php

class Database
{
  private $servername = 'localhost';
  private $database = 'prospection';
  private $username = 'root';
  private $password = 'root';

  public function connect()
  {
    $connection = new PDO("mysql:host=$this->servername;dbname=$this->database", $this->username, $this->password);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $connection;
  }

  public function getAllProspect()
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN visite ON visite.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN commande ON commande.prospect_id_prospect = prospect.id_prospect
            ORDER BY prospect.name_prospect';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }

  /*public function errorProspect() // 1) Liste des entreprises aux coordonnées erronées > secrétaire
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            WHERE result_mailing = "N.P.A.I"';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }
  public function relanceProspect() // 2) Liste des entreprises à relancer > assistance commerciale
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            WHERE result_mailing = "RDV"
            AND result_relance = "RDV"';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }
  public function meetingProspect() // 3) Liste des devis et des RDV > commerciaux
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN visite ON visite.prospect_id_prospect = prospect.id_prospect
            WHERE result_mailing = "RDV" AND result_mailing = "Devis"
            AND result_relance = "RDV" AND result_relance = "Devis"
            AND result_visite = "RDV" AND result_visite = "Devis"';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }
  public function orderedProspect() // 3b) Liste des entreprises qui ont commandé > Livreurs
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN visite ON visite.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN commande ON commande.prospect_id_prospect = prospect.id_prospect
            ORDER BY prospect.name_prospect';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }
  public function errorProspect() // 4) Tableau de nombre de RDV, Devis, Commandes > Manager
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN visite ON visite.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN commande ON commande.prospect_id_prospect = prospect.id_prospect
            ORDER BY prospect.name_prospect';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }
  public function errorProspect() // 4b) Tableau du nombre de Relances, Visites et Commandes > Manager
  {
    $sql = 'SELECT * FROM prospect
            LEFT JOIN mailing ON mailing.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN relance ON relance.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN visite ON visite.prospect_id_prospect = prospect.id_prospect
            LEFT JOIN commande ON commande.prospect_id_prospect = prospect.id_prospect
            ORDER BY prospect.name_prospect';
    $stmt = $this->connect()->prepare($sql);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $result = $stmt->fetchAll();
  }*/

}

?>