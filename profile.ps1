clear-host;

function prompt {
    $path = (get-location).path;

    write-host $path -ForegroundColor DarkGreen;
    return "> ";
}