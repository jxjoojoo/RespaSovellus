# Resepti-tietokanta sovellus

- Käyttäjä pystyy luomaan tunnuksen ja kirjautumaan sisään sovellukseen
- Käyttäjä pystyy lisäämään, muokkaamaan ja poistamaan reseptejä
- Käyttäjä näkee kaikki lisätyt reseptit
- Käyttäjä pystyy etsimään reseptiä hakusanalla
- Reseptejä pystyy luokittelemaan esim. alku-, pää-, jälkiruoka, ranskalainen, vegaaninen yms.
- Sovelluksessa on käyttäjäsivut, joilla näkyy tilastoja ja ilmoituksia käyttäjään liittyen
- Sovelluksessa pystyy kommentoimaan muiden käyttäjien reseptejä


# Miten testata:

1. Kloonaa repo koneellesi
2. Mene kansioon
3. Lataa flask
4. Tee kansioon "database.db" -tiedosto ja luo sinne sqlitella "schema.sql"-tiedoston mukaiset taulut
6. Suorita database -tiedostossa myös init.sql -tiedoston sisältö
7. Käynnistä sovellus: flask run
8. Avaa selaimessa

_____________________________________________________________________________________________________________

# Suuri tietomäärä:

Testauksessa on ajettu seed.py tiedosto. Testauksessa sovelluksessa on 1000 käyttäjää, 1 000 000 reseptiä ja 10 000 000 satunnaisesti resepteihin jakautunutta kommenttia.
> tiedoston koko: 520 MB.

Eri sivujen lataaminen vei seuraavan verran aikaa:

Etusivun lataaminen: 0.01s  
Tunnuksen luonti: 0,11s  
Kirjautuminen: 0,10s  
Reseptin lisäys: 0,01s  
Kuvan lisäys/poisto: 0,01s  
Kommentin lisäys/poisto: 0,01s  

/user/: 0,0s  
/login ja /register: 0.0s  
/newrecipe: 0,01s  
/edit_recipe/: 0,01s  
/images/: 0,01s  
/recipe/ { resepti, jossa 100(maksimimäärä) kommenttia }: 0,01s  
/leaderboard: 0.11s  
>  recipes_count() funktio hidastaa hieman, kun 5:llä käyttäjällä on
>  kullakin yli 1000 julkaistua reseptiä, jotka lasketaan sql:ssä COUNT() funktiolla.
>  Ei kuitenkaan vakavaa, koska viive ei ole normaalin käyttäjän huomattavissa näinkään isolla datamäärällä

/find recipe: 

- hakusana "r" (1 000 000 hakutulosta): 0.25s  
- hakusanana numerot 0-9 (esim. 613 186 hakutulosta): 0.31s  
- hakusanana numerot 10-99 (esim. 68 343 hakutulosta): 0.37s  
- hakusanana numerot 100-999 (esim. 5 003 hakutulosta): 0.37s  
- hakusanana numerot 1 000-9 999 (esim. 291 hakutulosta): 0.39s  
- hakusanana numerot 10 000-99 999 (esim. 19 hakutulosta): 0.58s  
- hakusanana numerot 100 000+ (1 (tai 0) hakutulosta): 0.74s  

>  Eli mitä pidempi hakusana, sitä kauemmin kestää ladata tulokset.
>  Lisäksi mitä pidemmällä hakusivun sivuissa ollaan, sitä kauemmin sivun lataaminen kestää.
>  Esimerkiksi kun hakusana on 4 merkkiä pitkä, aikaa kuluu ensimmäisen sivun lataamiseen 0.39s,
>  mutta viimeisen sivun(30/30) lataus kestää melkein tuplasti kauemmin: 0.75s.
  
>  LIKE ? kyselyt vievät kauan, koska hakusanoja ei saa tehostettua indekseillä.
