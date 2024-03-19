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
	$db->query('SELECT username FROM members WHERE id = ?');
	$db->execute([$user]);
	# If the user exists it returns the data with some protection included just incase some bad code gets in otherwise function does nothing
	if ($db->count()) {
		$info = $db->fetch();
		return htmlentities(stripslashes($info['username']));
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

