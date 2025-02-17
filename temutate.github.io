<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Karaoke Song Search</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        #searchBox { width: 80%; padding: 10px; margin: 20px; }
        #results { margin-top: 20px; }
        .song-item { padding: 10px; border-bottom: 1px solid #ccc; cursor: pointer; }
        #qrCode { margin-top: 20px; }
    </style>
</head>
<body>

    <h1>Karaoke Song Finder</h1>
    <input type="text" id="searchBox" placeholder="Search by song, artist, or code">
    <div id="results"></div>
    <canvas id="qrCode"></canvas>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcode-generator/1.4.4/qrcode.min.js"></script>
    <script>
        let songs = [
            { name: "Shape of You", artist: "Ed Sheeran", code: "101" },
            { name: "Someone Like You", artist: "Adele", code: "102" },
            { name: "Bohemian Rhapsody", artist: "Queen", code: "103" }
        ];

        document.getElementById("searchBox").addEventListener("input", function() {
            let query = this.value.toLowerCase();
            let resultsDiv = document.getElementById("results");
            resultsDiv.innerHTML = "";

            let filteredSongs = songs.filter(song => 
                song.name.toLowerCase().includes(query) || 
                song.artist.toLowerCase().includes(query) ||
                song.code.includes(query)
            );

            filteredSongs.forEach(song => {
                let songDiv = document.createElement("div");
                songDiv.className = "song-item";
                songDiv.innerHTML = `${song.name} - ${song.artist} (Code: ${song.code})`;
                songDiv.onclick = function() { generateQRCode(song.code); };
                resultsDiv.appendChild(songDiv);
            });
        });

        function generateQRCode(songCode) {
            let qr = qrcode(0, "L");
            qr.addData(`https://karaoke.com/song/${songCode}`);
            qr.make();
            document.getElementById("qrCode").innerHTML = qr.createImgTag();
        }
    </script>

</body>
</html>
