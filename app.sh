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

while [ true ]; do
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
    read -p "Pilih : " pilihMenu

        # Validasi Input Pilihan Menu
        if [ "$pilihMenu" -lt 1 ] || [ "$pilihMenu" -gt 2 ]; then
            clear
            echo "Input Salah Silahkan pilih antara angka 1 atau 2"
            continue
        fi

        case $pilihMenu in
            1) echo "Mulai";;
            2) echo "Keluar";;
        esac
done


