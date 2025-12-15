import csv

with open("csv_file.csv", "w", encoding="utf-8") as f:
    f.write("Имя,Возраст,Город,Должность\n")
    f.write("Динис,23,Москва,Разработчик\n")
    f.write("Борис,42,Ростов-на-Дону,Менеджер\n")
    f.write("Илья,24,Новосибирск,Дизайнер\n")

salary_rules = {
    "Разработчик": 120000,
    "Менеджер": 100000,
    "Дизайнер": 90000
}

rows = []
with open("csv_file.csv", "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    fieldnames = reader.fieldnames + ["Зарплата"]
    for row in reader:
        position = row["Должность"]
        row["Зарплата"] = salary_rules[position]
        rows.append(row)

with open("employees_with_salary.csv", "w", encoding="utf-8", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(rows)
