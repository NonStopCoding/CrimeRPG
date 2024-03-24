<?php
// Include the file for connecting to the database which connects to the database wrapper pdo.class.php
require_once __DIR__.'/connect.php';
// Include the file which handles all the Classes for game (Coming Soon)
//require_once __DIR__.'/classes.php';
// Set the time for the server
$time = date('F d, Y g:i:sa');
ob_start();
$info = array();
$db->query('SELECT * FROM `settings`');
$db->execute();
$rows = $db->fetch();
foreach ($rows as $row) {
    $info[$row['conf_name']] = $row['conf_value'];
}
$back = basename($_SERVER['PHP_SELF']);
register_shutdown_function('outerfooter');
function outerfooter() {
    global $db, $session;
    if (!defined('DEBUG_NO_KILL')) {
        $file = array_key_exists('usr_id', $_SESSION) ? '' : 'outerstyle';
        require_once __DIR__.'/'.$file.'footer.php';
    }
}
?>