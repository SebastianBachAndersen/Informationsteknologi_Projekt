<?php
        $servername = "localhost";
        $username = "root";
        $password = "Prutabe88";
        $dbname = "informationsteknologi";
        
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }