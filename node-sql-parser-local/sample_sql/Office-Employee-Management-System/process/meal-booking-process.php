<?php

session_start();
$employee_email = $_SESSION['employee_email'];
$employee_name = $_SESSION['employee_name'];



if(!isset($_SESSION['employee_email'])){
	header("location: ../index.php");

}
include("../admin/config/connect.php");
include("../l.php");
$get_last_meal_status_query = "SELECT id FROM admin_set_meal ORDER BY id DESC LIMIT 1";

$get_last_meal_status = mysqli_query($con,$get_last_meal_status_query);

$row = mysqli_fetch_assoc($get_last_meal_status);

$admin_set_meal_last_id = $row['id'];

$show_last_meal_status_query = "SELECT * FROM admin_set_meal WHERE id = '$admin_set_meal_last_id'";
$set_last_meal_status = mysqli_query($con,$show_last_meal_status_query);

$show_meal = mysqli_fetch_assoc($set_last_meal_status);

$show_last_meal_day = $show_meal['day'];
$show_last_meal_date = $show_meal['date'];

if(isset($_POST['book_meal'])){
	header("location: ../meal-booking.php");

	$date = new DateTime('now', new DateTimezone('Asia/Dhaka'));
	$datetime = $date->format('F j, Y');
	$day = date("l");


	$employee_name = $employee_name;
	$meal_date = $datetime;
	$meal_day = $day;
	$booking_status = "booked";
	$for_meal = $show_last_meal_day;
	$for_meal_date = $show_last_meal_date;

	$insert_booking_info_query = "INSERT INTO meal_booking (name, date, day, status, for_meal, for_meal_date)VALUES('$employee_name', '$meal_date', '$meal_day','$booking_status', '$show_last_meal_day', '$for_meal_date' )";
	$insert_booking_info = mysqli_query($con, $insert_booking_info_query);

// $last_insert_booking_info_id = mysqli_insert_id($con);

// echo $last_insert_booking_info_id;


}

?>