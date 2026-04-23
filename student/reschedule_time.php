<?php
session_start();
include("../config/database.php");
include("../includes/assign_staff.php");

if(isset($_POST['request_id'])){

    $request_id = $_POST['request_id'];
    $new_time = $_POST['new_time'];

    // 🔹 Get current request
    $request = $conn->query("
        SELECT * FROM requests WHERE id='$request_id'
    ")->fetch_assoc();

    $old_time = $request['available_time'];

    /* ===============================
       VALIDATION: TIME MUST CHANGE
    =============================== */

    if($new_time == $old_time){

        echo "<div class='alert alert-danger'>
        Please choose a different time from your previous selection.
        </div>";
        exit();
    }

    /* ===============================
       UPDATE REQUEST TIME
    =============================== */

    $conn->query("
        UPDATE requests
        SET available_time='$new_time',
            status='pending',
            assigned_staff=NULL
        WHERE id='$request_id'
    ");

    /* ===============================
       TRY ASSIGN AGAIN
    =============================== */

    $assigned = assignTechnician(
        $conn,
        $request['issue_type_id'],
        $request_id,
        $new_time
    );

    if($assigned){
        header("Location: view_requests.php?success=reassigned");
    } else {
        header("Location: view_requests.php?error=still_unavailable");
    }

}
?>