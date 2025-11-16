#!/bin/bash

# Komputer memilih angka random dan akan dicari sisa bagi dari 3
com=$((RANDOM%3))
comChoice=""
case $com in
    0) comChoice="Gunting";;
    1) comChoice="Batu";;
    2) comChoice="Kertas";;
esac

clear

while ( true ); do
    # Menu Game
    echo " _________________________________"
    echo "|== Selamat Datang di Permainan ==|"
    echo "|==== Gunting, Batu, Kertas ======|"
    echo "|                                 |"
    echo "|                                 |"
    echo "|      1. Mulai Permainan         |"
    echo "|           2. Keluar             |"
    echo "|                                 |"
    echo "|_________________________________|"

    pilihMenu=0
    echo ""
    read -p "Pilih : " pilihMenu

        # Validasi Input Pilihan Menu
        if [[ "$pilihMenu" -lt 1 || "$pilihMenu" -gt 2 ]]; then
            clear
            echo "Input Salah Silahkan pilih antara angka 1 atau 2"
            continue
        fi

        case $pilihMenu in
            1) clear 
                break;;
            2) clear
                echo "Terima Kasih Sudah Bermain..."
                exit;;
        esac
done



    echo " _________________________________________"
    echo "|== Musuhmu sudah menentukan pilihannya ==|"
    echo "|==           Ini Giliranmu..!!!        ==|"
    echo "|====     Gunting, Batu, Kertas       ====|"
    echo "|                                         |"
    echo "|              1. Gunting                 |"
    echo "|              2. Batu                    |"
    echo "|              3. Kertas                  |"
    echo "|_________________________________________|"
    
    playerPil=0
    echo ""
    read -p "Tentukan pihanmu sekarang : " playerPil
    playerChoice=""

    case $playerPil in
        1) playerChoice="Gunting";;
        2) playerChoice="Batu";;
        3) playerChoice="Kertas";;
    esac

    echo "Hasilnya adalah"
    echo "Kamu Memilih     : $playerChoice"
    echo "Computer Memilih : $comChoice"
    echo ""

    # Jika pilihan player dan Computer sama maka Hasilnya Draw dan keduanya tidak dapat poin
    if [[ "$playerChoice" == "$comChoice" ]]; then
        echo "Woow Hasilnya Seri"
    # Jika Player Menang akan Mendapat poin 10
    elif [[ ("$playerChoice" == "Gunting" && "$comChoice" == "Kertas") || ("$playerChoice" == "Batu" && "$comChoice" == "Gunting") || ("$playerChoice" == "Kertas" && "$comChoice" == "Batu") ]]; then
        echo "Selamat Kamu Menang"
    # Jika Player kalah maka komputer akan mendapat Poin 10
    else 
        echo "Sayang sekali Kamu Kalah"
    fi
