def hanoi_solver(num):
    a=list(range(num, 0, -1))
    b=[]
    c=[]
    jumlah=[f"{a} {b} {c}"]

    def pindah(angka, asal, tujuan,bantu):
        if angka == 0:
            return

        pindah(angka - 1, asal, bantu , tujuan)
        tujuan.append(asal.pop())
        jumlah.append(f'{a} {b} {c}')

        pindah(angka - 1, bantu, tujuan, asal)
    
    pindah(num, a, c, b)
    return "\n".join(jumlah)

    print(jumlah)

print(hanoi_solver(10))


    