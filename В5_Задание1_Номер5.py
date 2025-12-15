import csv
import json

with open("animals.csv", "w", encoding="utf-8") as f:
    f.write("Животное,Возраст,Чем питается\n")
    f.write("Тигр,12,Мясо\n")
    f.write("Слон,60,Растения\n")
    f.write("Пингвин,15,Рыба\n")
    f.write("Енот,8,Всёядный\n")
    f.write("Ястреб,10,Мелкие птицы\n")

with open("animals.csv", "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    zoo = list(reader)

with open("zoo.json", "w", encoding="utf-8") as f:
    json.dump(zoo, f, ensure_ascii=False, indent=4)
