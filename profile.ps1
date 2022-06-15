# Basta colocar esse arquivo na pasta do PS no System32.
clear-host;

function prompt {
    $path = (get-location).path;

    write-host "`n$path" -ForegroundColor DarkGreen;
    "> ";
}
