<?php
	$host="localhost";
	$username="root";
	$password="";
	$db_nome="utenti";
	
	$tab_nome="persone";
	
	mysqli_connect($host, $username, $password, $db_nome) or die('Impossibile connettersi al server: ' . mysqli_error());
	$db_conn = mysqli_connect($host, $username, $password, $db_nome);
	
	// acquisizione dati dal form HTML, presi grazie al name
	$email = $_POST["email"];
	$password = $_POST["password"];
	
	// protezione per SQL injection
	$email = stripslashes($email);      //stripslashes() elimina inserimento \ usate da md5()
	$password = stripslashes($password);
	$email = mysqli_real_escape_string($db_conn, $email);  //mysqli_real_escape_string() sanifica stringa
	$password = mysqli_real_escape_string($db_conn, $password);
	$passmd5 = $password;  // per decrittografare md5($password);
	
	
	// lettura della tabella utenti
	$sql="SELECT * FROM $tab_nome WHERE email='$email' and pass='$passmd5'";
	$result=$db_conn->query($sql);
	
	$conta=mysqli_num_rows($result);
	if($conta==1){
		session_start();
		$_SESSION['email'] = $email;
		$_SESSION['password'] = $passmd5;
		header("Location: loginOK.php");
	}
	else {
        header("Location: erroreLogIn.html");
	}
?>