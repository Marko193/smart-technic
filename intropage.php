<?php require_once("include/connection.php");?>
<?php
	session_start();
	if(!isset($_SESSION["session_username"])):
	header("location:login.php");
	else:
?>
<?php 
	$title = 'Personal cabinet';
	$login = $_SESSION["session_username"];
	$queryInfo = mysqli_query($connection, "SELECT * FROM `reg_user` WHERE login = '".$login."'");
	$numrowsLogin = mysqli_num_rows($queryInfo);
?>

<?php  
	$oldPass1 = $_POST['oldpass1'];
  $oldPass2 = $_POST['oldpass2'];
  $newPass  = $_POST['newpass'];

  $row = mysqli_fetch_assoc($queryInfo);
  $nowPass = $row['password'];

?>



<?php // include("include/head.php"); ?>
<div id="welcome">
	<h2>Wellcome, <span><?php echo $_SESSION['session_username'];?>! </span></h2>
	<a href="index.php">Main page</a>
  <p><a href="logout.php">Log out</a> from the system</p>
  <div class="infoUser">
		<ul class="infoUser__list">
			<?php
				if($numrowsLogin != 0) {
					while($row = mysqli_fetch_assoc($queryInfo)) {
			    	echo '<li> Your email: ' . $row['email'] . '</li><br>';
			    	echo '<li> Your login: ' . $row['login'] . '</li><br>';
			    	echo '<li> Your name and surname: ' . $row['surname'] . ' ' . $row['name'] . '</li><br>';
			    }
				} else {
					echo '<li>Error of getting information.</li>';
				}
			?>
		</ul>
	</div>

	<div class="change-password">
		<h3>Change the password:</h3>
		<h3>
			<?php
				if($nowPass == $oldPass1 && $nowPass == $oldPass1) {
			  	$queryPass = mysqli_query($connection, "UPDATE `reg_user` SET `password`= '".$newPass."' WHERE `login`= '".$login."';");
			  }
			?>
		</h3>
		<form action="intropage.php" method="POST">
			<label for="oldpass1">The current password:<br>
	 			<input class="input" id="oldpass1" name="oldpass1" type="password" required>
	 		</label><br>
	 		<label for="oldpass2">Repeat the password:<br>
	 			<input class="input" id="oldpass2"  name="oldpass2" type="password" required>
	 		</label><br>
	 		<label for="newpass">New password:<br>
	 			<input class="input" id="newpass"  name="newpass" type="password" required>
	 		</label>

			<input class="button" name="change-pass" type="submit" value="Change the password">
 		</form>
	</div>
</div>

<?php // include("include/footer.php"); ?>
	
<?php endif; ?>