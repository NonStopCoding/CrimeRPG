<?php
require_once __DIR__ .'/includes/outerstyleheader.php';

if (array_key_exists('submit', $_POST)) {
    $_POST['password'] = (array_key_exists('password', $_POST) && is_string($_POST['password'])) ? stripslashes(strip_tags($_POST['password'])) : null;
    $_POST['username'] = (array_key_exists('username', $_POST) && is_string($_POST['username'])) ? stripslashes(strip_tags($_POST['username'])) : null;
    $_POST['email'] = $_POST['email'];
    if (empty($_POST['password']) || empty($_POST['username'])) {
        error('Invalid Data..');
    }

    $db->query('SELECT COUNT(usr_id) FROM members WHERE usr_name = ?');
    $db->execute([$_POST['username']]);
    if ($db->count()) {
        error('Sorry this username has been taken.');
    }
    $db->query('SELECT COUNT(usr_id) FROM members WHERE usr_email = ?');
    $db->execute([$_POST['email']]);
    if ($db->count()) {
        error('Sorry this username has been taken.');
    }

}
