<?php
if (!isset($_SESSION)) {
    session_start();
}
$pagename = "Login";
require("includes/config.php");
require("includes/functions.php");
if (isset($_POST['submit'])) {
    $password = mysqli_real_escape_string($dbc,sha1($_POST['password']));
    $sql = "SELECT * FROM users WHERE username = '" . $_POST['username'] . "' AND password = '" . $password . "';";
    $result = mysqli_query($dbc, $sql);
    $numrows = mysqli_num_rows($result);
    if ($numrows == 1) {
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
        if ($row['active'] == 1 && $row['ban']==0) {
            
            $_SESSION['USERNAME'] = $row['username'];
            $_SESSION['USERID'] = $row['id'];
            $_SESSION['USERIMG'] = $row['img'];

            if ($row['usertype'] == 1) {
                //session_register("ADMIN");
                $_SESSION['ADMIN'] = $row['username'];
            }
            switch ($_GET['ref']) {
                case "newpost":
                    if (!isset($_GET['id'])) {
                        header("Location: " . $config_basedir . "/newtopic.php");
                    } else {
                        header("Location: " . $config_basedir . "/newtopic.php?id=" . $_GET['id']);
                    }
                    break;
                case "reply":
                    if (!isset($_GET['id'])) {
                        header("Location: " . $config_basedir . "/newtopic.php");
                    } else {
                        header("Location: " . $config_basedir . "/reply.php?id=" . $_GET['id']);
                    }
                    break;
                default:
                    header("Location: " . $config_basedir);
                    break;
            }
        }
    }
}
require("includes/header.php");
require ("includes/inner-top.php");
if (isset($_POST['submit'])) {                                                                  
    $sql = "SELECT * FROM users WHERE username = '" . $_POST['username'] . "' AND password = '" . $password . "';";
    $result = mysqli_query($dbc, $sql);
    $numrows = mysqli_num_rows($result);
    //if($row['ban']==1){
     if ((isset ($row['ban'])) AND $row['ban']==1){ // it has to be declared like this since when you misstyped the email/addres it throwd error unassigned value
        echo"<p class='error'><small>You have been banned</small></p>";
        
    }
    if ($numrows == 1 && $row['active'] != 1) {
        echo "<p class='error'><small>This account is not verified yet. You were emailed a link
			to verify the account. Please click on the link in the email to
			continue.</small></p>";
    }

    if ($result && $numrows != 1) {
        echo "<p class='error'><small>Incorrect login, please try again!</small></p>";
    }

    else {
         echo "<p> Login Successful</p>";
    }
}
?>

<form action="login.php" method="POST">
    <table>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Login!"></td>
        </tr>
    </table>
</form>
Don't have an account? <a href="register.php">Click here to register <br></a>
Forgot your password? No worries we got you! <a href="rest_pass_no_log_in.php"> Reset your password</a>!

<?php
require ("includes/inner-bottom.php");
require("includes/footer.php");
?>