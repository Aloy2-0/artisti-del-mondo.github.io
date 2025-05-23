<?php
    session_start();
    //se l'email non è settata rimanda alla registrazione
    if(!isset($_SESSION['email'])) {
        header("Location: registrazione.html");
    }

    //altrimenti si connette ed inserisce i dati

    // acquisizione dati dal form HTML, presi grazie al name
	$email = $_POST["email"];
	$password = $_POST["password"];
    $nome=$_POST["nome"];
    $cognome=$_POST["cognome"];
    $data_nascita=$_POST["data_nascita"];
    $nazionalita=$_POST["nazionalita"];

    //parametri base
    $host="localhost";
	$username="root";
	$psw="";
	$db_nome="utenti";

	//impostato il nome della tabella
	$tab_nome="persone";

	//controllo
	mysqli_connect($host, $username, $psw, $db_nome) or die('Impossibile connettersi al server: ' . mysqli_error());
	$db_conn = mysqli_connect($host, $username, $psw, $db_nome);


    // protezione per SQL injection
    //stripslashes() elimina inserimento \ usate da md5()
    //mysqli_real_escape_string() sanifica stringa
    //email
    $email = mysqli_real_escape_string($db_conn, stripslashes($email));      
    //password   
    $password = mysqli_real_escape_string($db_conn, stripslashes($password));
    $passmd5 = $password;  // per decrittografare md5($password);
    //dati personali
    $nome = mysqli_real_escape_string($db_conn, stripslashes($nome));
    $cognome = mysqli_real_escape_string($db_conn, stripslashes($cognome));
    $data_nascita = mysqli_real_escape_string($db_conn, stripslashes($data_nascita));
    $nazionalita = mysqli_real_escape_string($db_conn, stripslashes($nazionalita));


    //inserimento
    $sql="INSERT INTO $tab_nome(email, pass, nome, cognome, data_nascita, nazionalita) VALUES ('$email', '$passmd5', '$nome', '$cognome', '$data_nascita', '$nazionalita')";


    if($db_conn->query($sql)){
        header("Location: login.html");
        exit();
    }else{
        header("Location: registrazione.html");
        exit();
    }
    
    $db_conn->close(); //chiude la connessione
?>