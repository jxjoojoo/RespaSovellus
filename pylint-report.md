# Pylint-raportti

pylint --disable=C0114,C0116 *.py
Docstring ilmoitukset C0114 ja C0116 ovat jätetty pois raportista. Sovelluksen kehityksessä on tehty tietoisesti päätös, ettei käytetä docstring-kommentteja, joten tämä selkeyttää raporttia.

```
************* Module app
app.py:102:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
app.py:127:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:400:8: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
app.py:390:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:407:0: R0914: Too many local variables (25/15) (too-many-locals)
app.py:407:0: R0912: Too many branches (19/12) (too-many-branches)
app.py:407:0: R0915: Too many statements (59/50) (too-many-statements)
app.py:407:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:525:0: R0913: Too many arguments (11/5) (too-many-arguments)
app.py:525:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:559:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
************* Module config
config.py:1:0: C0103: Constant name "secret_key" doesn't conform to UPPER_CASE naming style (invalid-name)
************* Module db
db.py:10:0: W0102: Dangerous default value [] as argument (dangerous-default-value)
db.py:25:0: W0102: Dangerous default value [] as argument (dangerous-default-value)
************* Module recipes
recipes.py:4:0: R0913: Too many arguments (7/5) (too-many-arguments)
recipes.py:68:0: R0913: Too many arguments (6/5) (too-many-arguments)
recipes.py:68:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
************* Module seed
seed.py:6:0: C0103: Constant name "user_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:7:0: C0103: Constant name "recipe_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:8:0: C0103: Constant name "comment_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:16:4: C0103: Constant name "time" doesn't conform to UPPER_CASE naming style (invalid-name)
************* Module users
users.py:40:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
users.py:46:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)

------------------------------------------------------------------
Your code has been rated at 9.61/10 (previous run: 9.59/10, +0.02)

```


# Selitykset virheviesteille:
```
app.py:102:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
app.py:400:8: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
users.py:40:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
users.py:46:4: R1705: Unnecessary "else" after "return", remove the "else" and de-indent the code inside it (no-else-return)
```
  Koodi on ymmärrettävämpää, kun if lausekkeista löytyy myös else haara.
```
app.py:127:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:390:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:407:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:525:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
app.py:559:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
recipes.py:68:0: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)
```
  Tämä johtuu siitä, että flaskia käyttävä funktio voi mennä joko return tai abort() haaraan.
  Abort haaraan kuitenkin mennään vain kun sivua ei löydy, tai kun käyttäjä tekee jotain, mitä
  html-pohja ei salli. Ongelma ei täten ole todellinen.
```
app.py:407:0: R0914: Too many local variables (25/15) (too-many-locals)
app.py:407:0: R0912: Too many branches (19/12) (too-many-branches)
app.py:407:0: R0915: Too many statements (59/50) (too-many-statements)
app.py:525:0: R0913: Too many arguments (11/5) (too-many-arguments)
recipes.py:4:0: R0913: Too many arguments (7/5) (too-many-arguments)
recipes.py:68:0: R0913: Too many arguments (6/5) (too-many-arguments)
```
  Tämän tyyppisiä ilmoituksia tulee, kun muuttujia on pylintin mielestä liikaa.
  Flask funktiot sisältävät paljon erilaista dataa joka pitää lähettää html-pohjalle.
  Viestit saisi korjattua esimerkiksi sanakirjan avulla mutta mielestäni koodi pysyy
  selkeämpänä sellaisena, kuin se nyt on. Myös recipes.py puolella 
```  
config.py:1:0: C0103: Constant name "secret_key" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:6:0: C0103: Constant name "user_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:7:0: C0103: Constant name "recipe_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:8:0: C0103: Constant name "comment_count" doesn't conform to UPPER_CASE naming style (invalid-name)
seed.py:16:4: C0103: Constant name "time" doesn't conform to UPPER_CASE naming style (invalid-name)
```
  Muuttuja nimeäminen pienellä kirjoitettuna on tyyliltään mielestäni parempi kuin isolla.
```  
db.py:10:0: W0102: Dangerous default value [] as argument (dangerous-default-value)
db.py:25:0: W0102: Dangerous default value [] as argument (dangerous-default-value)
```  
  SQL funktioissa oletusparametrina on tyhjä lista. Koodissa SQL kyselyiden parametrit välitetään funktiolle  listassa ja jos parametrejä ei ole, kysely toimii ilman niitä. Listalla ei ole vaaraa muuttua sql kyselyissä, joten ilmoitus ei oleongelma.
