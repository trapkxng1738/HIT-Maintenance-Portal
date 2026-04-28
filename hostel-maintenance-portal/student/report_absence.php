<?php
session_start();
include("../config/database.php");

$request_id = $_GET['id'];

$conn->query("
UPDATE requests
SET status='pending',
    assigned_staff=NULL,
    technician_arrived=0
WHERE id='$request_id'
");

/* ALERT SUPERVISOR (optional flag) */

$conn->query("
UPDATE requests
SET alert_supervisor = 1
WHERE id='$request_id'
");

header("Location: view_requests.php");
?>