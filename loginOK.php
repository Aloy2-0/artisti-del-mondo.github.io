<?php
    session_start();
    if(!isset($_SESSION['email'])) {
        header("Location: login.html");
    }
?>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Profilo Utente - Artisti del Mondo</title>

  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html, body {
      height: 100%;
      font-family: 'Segoe UI', sans-serif;
      background: url('img/sfondo.jpg') no-repeat center center fixed;
      background-size: cover;
      color: #2c3e50;
      display: flex;
      flex-direction: column;
    }

    header {
      background-color: rgba(15, 24, 106, 0.95);
      color: white;
      padding: 20px;
    }

    .header-content {
      max-width: 1200px;
      margin: auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }

    .logo-title {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .logo {
      width: 40px;
      height: 40px;
      object-fit: cover;
      border-radius: 50%;
    }

    .logo-title h1 {
      font-size: 24px;
    }

    .menu-select {
      padding: 6px 10px;
      border-radius: 6px;
      border: none;
      background-color: #fff;
      color: #293b98;
      font-weight: bold;
      cursor: pointer;
    }

    .container {
      max-width: 960px;
      margin: 40px auto;
      background: rgba(255, 255, 255, 0.95);
      border-radius: 16px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
      backdrop-filter: blur(6px);
      width: 90%;
    }

    h2 {
      margin-bottom: 20px;
      font-size: 26px;
      border-bottom: 2px solid #2c3e50;
      padding-bottom: 5px;
    }

    .user-data {
      font-size: 18px;
      line-height: 1.8;
    }

    .user-data p {
      margin: 10px 0;
    }

    .user-data strong {
      color: #224365;
    }

    footer {
      background-color: rgba(15, 24, 106, 0.95);
      color: white;
      text-align: center;
      padding: 15px 10px;
      margin-top: auto;
    }

    @media screen and (max-width: 768px) {
      .logo-title h1 {
        font-size: 20px;
      }

      .container {
        margin: 20px;
        padding: 20px;
      }

      .header-content {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      footer {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>

  <!-- Header -->
  <header>
    <div class="header-content">
      <div class="logo-title">
        <img src="img/logo.PNG" alt="Logo" class="logo" />
        <h1>Artisti del Mondo</h1>
      </div>

      <div class="header-icons">
        <select class="menu-select" onchange="location = this.value;">
          <option value="#">Menu</option>
          <option value="index.html">Home</option>
          <option value="profiloUtente.html" selected>Pagina Personale</option>
          <option value="contatti.html">Contatti</option>
          <option value="info.html">Info</option>
          <option value="logout.php">Logout</option>
        </select>
      </div>
    </div>
  </header>

  <!-- Contenuto principale -->
  <div class="container">
    <h2>Il tuo Profilo</h2>
    <div class="user-data">
      <?php
        $email = $_SESSION['email'];
        $host = "localhost";
        $username = "root";
        $password = "";
        $db_nome = "utenti";
        $tab_nome = "persone";

        $db_conn = mysqli_connect($host, $username, $password, $db_nome) 
          or die('Impossibile connettersi al server: ' . mysqli_connect_error());

        $sql = "SELECT email, nome, cognome, data_nascita, nazionalita FROM persone WHERE email='$email'";
        $result = $db_conn->query($sql);

        while ($row = $result->fetch_assoc()) {
          echo '<p><strong>Email: </strong>' . $row['email'] . '</p>';
          echo '<p><strong>Nome: </strong>' . $row['nome'] . '</p>';
          echo '<p><strong>Cognome: </strong>' . $row['cognome'] . '</p>';
          echo '<p><strong>Data di nascita: </strong>' . $row['data_nascita'] . '</p>';
          echo '<p><strong>Nazionalità: </strong>' . $row['nazionalita'] . '</p>';
        }

        mysqli_close($db_conn);
      ?>
    </div>
  </div>

  <footer>
    &copy; 2025 Associazione Artisti del Mondo | Tutti i diritti riservati
  </footer>
          

</body>
</html>
