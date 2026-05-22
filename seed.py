import random
import sqlite3

db = sqlite3.connect("database.db")

user_count = 1000
recipe_count = 10**6
comment_count = 10**7

for i in range(1, user_count + 1):
    db.execute("INSERT INTO Users (username) VALUES (?)",
            ["user" + str(i)])

for i in range(1, recipe_count + 1):
    user_id = random.randint(1, user_count)
    time = 260
    description = f"Testi{str(i)}"
    db.execute("INSERT INTO Recipes (name, user_id, time, description) VALUES (?, ?, ?, ?)",
            ["resepti " + str(i), user_id, time, description])
    for i in range(1,100):
        pass

for i in range(1, comment_count + 1):
    user_id = random.randint(1, user_count)
    recipe_id = random.randint(1, recipe_count)
    db.execute("""INSERT INTO Comments (comment_str, user_id, recipe_id)
                VALUES (?, ?, ?)""",
            ["message" + str(i), user_id, recipe_id])

db.commit()
db.close()
