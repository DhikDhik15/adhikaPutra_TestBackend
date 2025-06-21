<?php
class Database
{
    public function getConnection()
    {
        try {
            $pdo = new PDO("pgsql:host='localhost';port='5432';dbname='testbe'", 'postgres', 'postgres');
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $exception) {
            die("Connection failed: " . $exception->getMessage());
        }

    }
}
