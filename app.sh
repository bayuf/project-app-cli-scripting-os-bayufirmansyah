#!/bin/bash
clear
# Definisi warna
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Live Score dari hasil pertandingan
# scores[0] = player
# scores[1] = computer
scores=(0 0)

# Function untuk menghitung skor akhir dan menentukan pemenang
ShowTheWinner() {
    echo "====================================================================="
    echo ""
    if [[ "$1" -eq "$2" ]]; then
        echo -e "${YELLOW}Draw Bukanlah Sebuah Kegagalan${NC}"
    elif [[ "$1" > "$2" ]]; then
        echo -e "${GREEN}Selamatt.. Kamulah Juaranya${NC}"
    else
        echo -e "${RED}Sayang Sekali. Komputer Terlalu Perkasa Buat Kamu${NC}"
    fi
    echo ""
    echo "====================================================================="
}

# Mendapatkan hasil pertarungan
GetResult() {

    # Jika pilihan player dan Computer sama maka Hasilnya Draw dan keduanya tidak dapat poin
    if [[ "$1" == "$2" ]]; then
        echo -e "${YELLOW}Woow Hasilnya Seri${NC}"

    # Jika Player Menang akan Mendapat poin 10
    elif [[ ("$1" == "Gunting" && "$2" == "Kertas") || ("$1" == "Batu" && "$2" == "Gunting") || ("$1" == "Kertas" && "$2" == "Batu") ]]; then
        echo -e "${GREEN}Selamat Kamu Menang, Kamu mendapat 10 Points${NC}"
        scores[0]=$((scores[0] + 10))

    # Jika Player kalah maka komputer akan mendapat Poin 10
    else 
        echo -e "${RED}Sayang sekali Kamu Kalah, Musuh Mendapat 10 Points${NC}"
        scores[1]=$((scores[1] + 10))
    fi
}

# Memulai Game
MulaiGame() {
    # Player harus menentukan ronde maksimal yang ingin dimainkan
    while (true); do
        echo " _________________________________________"
        echo "|==   Tentukan Jumlah Ronde Permainan   ==|"
        echo "|==       Mau Berapa Ronde (max 10)     ==|"
        echo "|_________________________________________|"

        maxRounds=0
        read -p "Silahkan Masukkan Jumlah Ronde : " maxRounds

        if [[ "$maxRounds" -gt 10 || "$maxRounds" -lt 1 ]]; then
            clear
            echo -e "${RED}Invalid Input: Masukkan satu Angka dari 1 sampai 10${NC}"
            continue
        fi
        break
    done

    clear

    round=1

    # Ulangi Pertandingan sampai ronde habis
    while [ $round -le $maxRounds ]; do

        while [ true ]; do
            echo " _________________________________________"
            echo "|== Musuhmu sudah menentukan pilihannya ==|"
            echo "|==           Ini Giliranmu..!!!        ==|"
            echo "|====     Gunting, Batu, Kertas       ====|"
            echo "|                                         |"
            echo "|               1. Gunting                |"
            echo "|               2. Batu                   |"
            echo "|               3. Kertas                 |"
            echo "|_________________________________________|"
            
            echo ""
            echo "===   Live Score ronde $round dari $maxRounds ronde  ==="
            echo -e "${GREEN} Player    : ${scores[0]}pts"
            echo -e "${RED} Computer  : ${scores[1]}pts${NC} "

            playerPil=0
            read -p "Tentukan pihanmu sekarang : " playerPil

            if [[ "$playerPil" -lt 1 || "$playerPil" -gt 3 ]]; then
                clear
                echo -e "${RED}Invalid Input: Pilih angka 1 sampai 3 ${NC}"
                continue
            fi

            clear
            break
        done

        playerChoice=""
        comChoice=$(GetComChoice)

        case $playerPil in
            1) playerChoice="Gunting";;
            2) playerChoice="Batu";;
            3) playerChoice="Kertas";;
        esac

        echo "Hasilnya adalah"
        echo -e "${GREEN}Kamu Memilih     : $playerChoice"
        echo -e "${RED}Computer Memilih : $comChoice${NC}"
        echo ""
        GetResult "$playerChoice" "$comChoice"



        round=$((round + 1))
        if [[ "$round" -lt "$((maxRounds+1))" ]]; then
            read -p "tekan enter untuk lanjut ronde berikutnya ...."
        else
            read -p "tekan enter untuk melihat Siapa Sang Juara ...."
        fi
        clear
    done

    # Manampilkan Pemenang 
    ShowTheWinner "${scores[0]}" "${scores[1]}"
}

# Function untuk mendapat pilihan dari komputer
GetComChoice() {
    local com=$(shuf -i 1-3 -n 1)
    local comChoice=""
    case $com in
        1) comChoice="Gunting";;
        2) comChoice="Batu";;
        3) comChoice="Kertas";;
    esac
    echo "$comChoice"
}

# Menu Game
MainMenu() {
    while ( true ); do

        echo " _________________________________"
        echo "|==  Selamat Datang di GO-Suit  ==|"
        echo "|                                 |"
        echo "|                                 |"
        echo -e "|${GREEN}      1. Mulai Permainan         ${NC}|"
        echo -e "|${RED}           2. Keluar             ${NC}|"
        echo "|                                 |"
        echo "|_________________________________|"

        pilihMenu=0
        echo ""
        read -p "Pilih : " pilihMenu

        # Validasi Input Pilihan Menu
        if [[ "$pilihMenu" -lt 1 || "$pilihMenu" -gt 2 ]]; then
            clear
            echo -e "${RED}Invalid Input: Silahkan pilih antara angka 1 atau 2${NC} "
            echo ""
            continue
        fi

        case $pilihMenu in
            1) clear 
                # Memulai game
                MulaiGame;;
            2) clear
                # Keluar dari Game
                echo "Terima Kasih Sudah Bermain..."
                exit;;
        esac
    done
}

# Menjalanlan Menu Utama dari Game
MainMenu





