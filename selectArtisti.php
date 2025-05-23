<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Associazione artisti del mondo</title>

  <style>

    footer {
      background-color: rgba(15, 24, 106, 0.95);
      color: white;
      text-align: center;
      padding: 15px 10px;
      margin-top: auto;
    }


    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f4f4;
      background: url('img/sfondo.jpg') no-repeat center center fixed;
      background-size: cover;
      color: #2c3e50;
    }


    header {
      background-color: rgba(15, 24, 106, 0.95);
      color: white;
      padding: 20px 0;
      width: 100%;
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

    .header-icons select {
      padding: 6px 10px;
      border-radius: 6px;
      border: none;
      background-color: #fff;
      color: #293b98;
      font-weight: bold;
      cursor: pointer;
    }

    /* Contenitore principale con margine sotto l’header */
    .content {
      margin: 40px auto;
      width: 80%;
    }

    /* Stile per le opere */
    .art-box {
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      padding: 20px;
      margin-bottom: 25px;
      display: flex;
      gap: 30px;
      align-items: center;
    }

    .art-box img {
      width: 200px;
      height: auto;
      border-radius: 8px;
      object-fit: cover;
      background-color: #ddd;
    }

    .art-info {
      flex: 1;
    }

    .art-info h3 {
      margin-bottom: 10px;
      color: #1f3a93;
    }

    .art-info p {
      margin: 6px 0;
    }

    .art-info strong {
      color: #34495e;
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
        <select class="menu-select" onchange="window.location.href=this.value">
          <option value="#">Menu</option>
          <option value="index.html">Home</option>
          <option value="login.html">Pagina Personale</option>
          <option value="contatti.html">Contatti</option>
          <option value="info.html">Info</option>
        </select>
      </div>
    </div>
  </header>

  <div class="content">
    <?php
    $nome = $_POST["nome"] ?? '';
    $cognome = $_POST["cognome"] ?? '';

    $host = "localhost";
    $user = "root";
    $password = "";
    $db_nome = "opere";

    $db_conn = mysqli_connect($host, $user, $password, $db_nome) or die('Errore connessione: ' . mysqli_error($db_conn));

    $nome = mysqli_real_escape_string($db_conn, $nome);
    $cognome = mysqli_real_escape_string($db_conn, $cognome);

    $sql = "SELECT artista.nomeA, artista.cognomeA, opera.titolo, opera.valore, opera.immagine, opera.descrizione, museo.nomeM, museo.citta
            FROM artista
            INNER JOIN opera ON artista.codA = opera.CodA_FK
            INNER JOIN museo ON museo.codM = opera.CodM_FK
            WHERE artista.nomeA = '$nome' AND artista.cognomeA = '$cognome'";

    $result = $db_conn->query($sql);
    $conta=mysqli_num_rows($result);
    if($conta>=1){
      while ($row = $result->fetch_assoc()) {
          echo "<div class='art-box'>";
          echo "<img src='" . htmlspecialchars($row['immagine']) . "' alt='" . htmlspecialchars($row['titolo']) . "' />";
          echo "<div class='art-info'>";
          echo "<h3>" . htmlspecialchars($row['nomeA']) . " " . htmlspecialchars($row['cognomeA']) . "</h3>";
          echo "<p><strong>Titolo:</strong> " . htmlspecialchars($row['titolo']) . "</p>";
          echo "<p><strong>Valore:</strong> €" . htmlspecialchars($row['valore']) . "</p>";
          echo "<p><strong>Descrizione:</strong> " . nl2br(htmlspecialchars($row['descrizione'])) . "</p>";
          echo "<p><strong>Museo:</strong> " . htmlspecialchars($row['nomeM']) . " - " . htmlspecialchars($row['citta']) . "</p>";
          echo "</div></div>";
      }
    }else{
      header("location: sitoWebMuseo.html");
    }
    

    $result->free();
    $db_conn->close();
    ?>
  </div>

  <footer>
  &copy; 2025 Associazione Artisti del Mondo | Tutti i diritti riservati
  </footer>


</body>
</html>
