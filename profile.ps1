# Basta colocar esse arquivo na pasta do PS no System32.
# > explorer $PSHOME // Abre a pasta
clear-host;

function prompt {
    $path = (get-location).path;

    write-host $path -ForegroundColor DarkGreen;
    return "> ";
}
