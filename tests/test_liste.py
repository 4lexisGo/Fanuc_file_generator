import re


def test_di_liste(di_start, di_stop, do_start):
    is_alternated_do_value = True

    liste_di = list(range(di_start, di_stop+1))

    nb_prog = di_stop - di_start + 1
    do_stop = do_start + nb_prog*2 - 1

    liste_do_ec = []
    liste_do_end = []

    if is_alternated_do_value:
        for idx, i in enumerate(range(do_start, do_stop+1)):
            if idx % 2 == 0:
                liste_do_ec.append(i)
            else:
                liste_do_end.append(i)
    else:
        liste_do_ec = list(range(do_start, do_start + nb_prog))
        liste_do_end = list(range(do_start + nb_prog, do_stop+1))

    print(liste_di)
    print(liste_do_ec)
    print(liste_do_end)

def test_splitter_liste(di_liste_raw):
    is_di_liste = True

    di_liste = []
    if is_di_liste:
        for x in re.split(r"[,;:|\s]+", di_liste_raw.strip()):
            if not x:
                continue

            di_liste.append(int(x))

    print(di_liste)


#test_di_liste(1, 4, 10)

test_splitter_liste("1,2;3   4:5")