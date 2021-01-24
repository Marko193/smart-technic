<?php require_once("include/connection.php");?>
<?php session_start();?>
<?php
if($_SERVER["REQUEST_METHOD"] == "POST"){

  $login    = $_POST['login'];
  $password = $_POST['password'];

  $query = mysqli_query($connection, "SELECT * FROM `reg_user` WHERE login = '".$login."' AND password = '".$password."'");
  $numrows = mysqli_num_rows($query);

  if($numrows != 0) {
  	while($row = mysqli_fetch_assoc($query)) {
    	$dblogin = $row['login'];
    	$dbpassword = $row['password'];
           
    $_SESSION['auth'] = 'yes_auth'; 
    $_SESSION['auth_pass'] = $row["pass"];
    $_SESSION['auth_login'] = $row["login"];
    $_SESSION['auth_surname'] = $row["surname"];
    $_SESSION['auth_name'] = $row["name"];
    $_SESSION['auth_patronymic'] = $row["patronymic"];
    $_SESSION['auth_address'] = $row["address"];
    $_SESSION['auth_phone'] = $row["phone"];
    $_SESSION['auth_email'] = $row["email"];
        
    }

    if($login == $dblogin && $password == $dbpassword) {

    $_SESSION['session_name'] = $name;
    $_SESSION['session_username'] = $login;
      //print_r($_SESSION);      
    /* Redirect browser */
    header("location:index.php");
    }
  } else {
			$message = "Wrong login or password!";
  }
}
?>
<?php $title = 'Authority'; ?>
<?php if (!empty($message)) { echo "<p class=\"error\">" . $message . "</p>"; } ?>

<!DOCTYPE HTML>
<html>
<head>
      
	<meta http-equiv="content-type" content="text/html; charset = utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
      <link href="css/style2.css" rel="stylesheet" type="text/css" />
     <link href="trackbar/trackbar.css" rel="stylesheet" type="text/css" />
     <link href="css/style_login.css" rel="stylesheet" type="text/css" />
      <link href="css/style3.css" rel="stylesheet" type="text/css" />    
          
     <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>   
    <script type="text/javascript" src="/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="/js/shopscript.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script type="text/javascript" src="/trackbar/jquery.trackbar.js"></script>
    
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.js"></script>  
    <script type="text/javascript" src="/js/TextChange.js"></script>  
</head>
<body>
<div class="container mlogin">
	<div id="login">
		<h1>Authority</h1>
		<form action="" id="loginform" method="post" name="loginform">

			<label for="user_login">Login<br>
				<input class="input" id="username"  name="login" type="text" required>
			</label><br>

			<label for="user_pass">Password<br>
	 			<input class="input" id="password"  name="password" type="password" required>
	 		</label>

			<p class="submit"><input class="button" name="log-in" type="submit" value="Log in"></p>
	<p class="regtext">Still not registered?<br/><a href="registration.php">Registration!</a></p>
   	</form>
 	</div>
</div>
</body>
</html>