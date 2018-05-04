var steamServerStatus = require('steam-server-status');
steamServerStatus.getServerStatus(
    process.argv[2] || 'localhost', +process.argv[3] || 27015, function(serverInfo) {
	if (serverInfo.error) {
		console.log('\tServer unreachable');
		process.exit(1);
	} else {
		console.log('\tOnline, players: ', serverInfo.numberOfPlayers);
		process.exit(0);
	}
	process.exit((serverInfo.error)? 1 : 0);
});
