<?php
include("../config/database.php");

/* Find requests that should be assigned now */

$requests = $conn->query("
SELECT * FROM requests
WHERE status='pending'
AND available_time <= NOW()
");

while($row = $requests->fetch_assoc()){

    $request_id = $row['id'];
    $issue_type = $row['issue_type_id'];

    // Determine specialization
    if($issue_type == 1){
        $specialization = "plumber";
    } elseif($issue_type == 2){
        $specialization = "electrician";
    } else {
        $specialization = "carpenter";
    }

    // Find FREE staff (controlled by supervisor)
    $staff = $conn->query("
        SELECT * FROM staff
        WHERE specialization='$specialization'
        AND status='free'
        LIMIT 1
    ");

    if($staff->num_rows > 0){

        $staff_row = $staff->fetch_assoc();
        $staff_id = $staff_row['id'];

        // Assign
        $conn->query("
            UPDATE requests
            SET assigned_staff='$staff_id',
                status='in_progress'
            WHERE id='$request_id'
        ");

        // Mark staff occupied
        $conn->query("
            UPDATE staff
            SET status='occupied'
            WHERE id='$staff_id'
        ");

    }

}
?>