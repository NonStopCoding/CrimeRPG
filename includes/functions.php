<?php

function formatNumber($num = 0, $length = 0) {
	if (!$num) {
		return false;
	}
	if (!ctype_digit($num) {
		return false;
	}
	return htmlentities(stripcslashes(number_format($num, $length)));
}

function getUserName($user = 0) {
	global $db;
	# Check if id is a number and nother else otherwise function returns false and fails
	if (!ctype_digit($user)) {
		return false;
	}
	# Since the data input is a number as expected we can scan the database for the username of the id inputed
	$db->query('SELECT usr_username FROM members WHERE usr_id = ?');
	$db->execute([$user]);
	# If the user exists it returns the data with some protection included just incase some bad code gets in otherwise function does nothing
	if ($db->count()) {
		$info = $db->fetch();
		return htmlentities(stripslashes($info['usr_username']));
	}
}

function showItems($id = 0) {
	global $db;
	# Check if id is a number and nother else otherwise function returns false and fails
	if (!ctype_digit($id)) {
		return false;
	}
	# Decided it would be quicker if i joined the query rather than multiple queries this produces faster results and less strain on the server
	$db->query('SELECT id, name, typeid, typename FROM items INNER JOIN user_types ON id = typeid WHERE id = ?');
	$db->execute([$id]);
	if ($db->count()) {
		while ($info = $db->fetch()) {
			# List items and item type
		}
	}
}

function createLog($logtype = '``', $user = 0, $page = $_SERVER['PHP_SELF']) {
	global $db;
	$ip = $_SERVER['REMOTE_ADDR'];
	$ipbackup = $_SERVER['HTTP_X_FORWARDED_FOR'];
	$logtype = (!empty($logtype) && strlen($logtype) < 255) ? $logtype : false;
	$user = abs(intval($user));
	$page = full_url($page);
	$text = addslashes(htmlentities($text));
}

function url_origin($s, $use_forwarded_host = false ) {
    $ssl = ( ! empty( $s['HTTPS'] ) && $s['HTTPS'] == 'on' );
    $sp = strtolower( $s['SERVER_PROTOCOL'] );
    $protocol = substr( $sp, 0, strpos( $sp, '/' ) ) . ( ( $ssl ) ? 's' : '' );
    $port = $s['SERVER_PORT'];
    $port = ( ( ! $ssl && $port=='80' ) || ( $ssl && $port=='443' ) ) ? '' : ':'.$port;
    $host = ( $use_forwarded_host && isset( $s['HTTP_X_FORWARDED_HOST'] ) ) ? $s['HTTP_X_FORWARDED_HOST'] : ( isset( $s['HTTP_HOST'] ) ? $s['HTTP_HOST'] : null );
    $host = isset( $host ) ? $host : $s['SERVER_NAME'] . $port;
    return $protocol . '://' . $host;
}

function full_url( $s, $use_forwarded_host = false ) {
    return url_origin($s, $use_forwarded_host ).$s['REQUEST_URI'];
}