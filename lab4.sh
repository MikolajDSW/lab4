#!/bin/bash

DATE_FLAG="--date"
LOGS_FLAG="--logs"
HELP_FLAG="--help"
INIT_FLAG="--init"
ERROR_FLAG="--error"

SINGLE_DATE_FLAG="-d"
SINGLE_LOGS_FLAG="-l"
SINGLE_HELP_FLAG="-h"
SINGLE_INIT_FLAG="-i"
SINGLE_ERROR_FLAG="-e"

display_date() {
    echo "Dzisiejsza data: $(date)"
}

create_logs() {
    local num_files=${1:-100}
    mkdir -p logs
    for ((i=1; i<=num_files; i++)); do
        echo -e "Nazwa pliku: log$i.txt\nSkrypt: lab4.sh\nData: $(date)" > "logs/log$i.txt"
    done
}

display_help() {
    echo "Dostępne opcje:"
    echo "--date, -d          Wyświetla dzisiejszą datę"
    echo "--logs [n], -l [n] Tworzy n plików log (domyślnie 100)"
    echo "--help, -h          Wyświetla dostępne opcje"
    echo "--init, -i          Klonuje repozytorium i ustawia PATH"
    echo "--error [n], -e [n] Tworzy n plików error (domyślnie 100)"
}

initialize_repository() {
    git clone https://github.com/MikolajDSW/lab4.git
    export PATH=$PATH:$(pwd)/lab4
}

create_error_files() {
    local num_files=${1:-100}
    mkdir -p errors
    for ((i=1; i<=num_files; i++)); do
        echo -e "Nazwa pliku: error$i.txt\nSkrypt: lab4.sh\nData: $(date)" > "errors/error$i.txt"
    done
}

case "$1" in
    "$DATE_FLAG" | "$SINGLE_DATE_FLAG")
        display_date
        ;;
    "$LOGS_FLAG" | "$SINGLE_LOGS_FLAG")
        create_logs "$2"
        ;;
    "$HELP_FLAG" | "$SINGLE_HELP_FLAG")
        display_help
        ;;
    "$INIT_FLAG" | "$SINGLE_INIT_FLAG")
        initialize_repository
        ;;
    "$ERROR_FLAG" | "$SINGLE_ERROR_FLAG")
        create_error_files "$2"
        ;;
    *)
        echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
        ;;
esac



