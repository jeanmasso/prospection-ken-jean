<?php 

class Table {

    public $table;

    private $servername = 'localhost';
    private $database = 'prospection';
    private $username = 'root';
    private $password = 'root';

    public function connect() {
        $connection = new PDO("mysql:host=$this->servername;dbname=$this->database", $this->username, $this->password);
        $connection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $connection;
    }

    public function getAllData() {
        $sql = 'SELECT * FROM ' . $this->table;
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        return $result = $stmt->fetchAll();
    }

    public function getData() {
        $sql = 'SELECT * FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->connect()->prepare($sql);
        $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        return $stmt->fetch();
    }

    public function updateData($params) {
      $callback = function($key, $value) {return "$key = '$value'";};
      $query = array_map($callback, array_keys($params), $params);
      $query = implode(', ', $query);
      $sql = 'UPDATE ' . $this->table . ' SET ' . $query . ' WHERE id = :id';
      $stmt = $this->connect()->prepare($sql);
      $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
      $stmt->execute();
      header("Location: ../views/get-post.php?id=".$_GET['id']);
    }

    public function deleteData() {
      $sql = 'DELETE FROM ' . $this->table . ' WHERE id = :id';
      $stmt = $this->connect()->prepare($sql);
      $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
      $stmt->execute();
      header("Location: ../views/post.php");
    }

}

