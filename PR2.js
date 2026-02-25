let expenses = [];
let nextId = 1;

function addExpense(title, amount, category) {
    if (title == "" || title == null) {
        alert("Название пустое");
        return false;
    }
    if (amount <= 0 || isNaN(amount)) {
        alert("Сумма должна быть числом и больше 0");
        return false;
    }
    if (category == "" || category == null) {
        alert("Категория пустая");
        return false;
    }

    let expense = {
        id: nextId,
        title: title,
        amount: Number(amount),
        category: category
    };

    expenses.push(expense);
    nextId++;
    alert("Расход добавлен: " + title + " - " + amount + " руб. (" + category + ")");
    return true;
}

function printAllExpenses() {
    let output = "";
    if (expenses.length == 0) {
        output += "Список пуст";
        alert(output);
        return;
    }
    for (let i = 0; i < expenses.length; i++) {
        let e = expenses[i];
        output += "ID: " + e.id + " | " + e.title + " | " + e.amount + " руб. | " + e.category + "\n";
    }
    alert(output);
}

function getTotalAmount() {
    let total = 0;
    for (let i = 0; i < expenses.length; i++) {
        total = total + expenses[i].amount;
    }
    alert("ЧЕК\nВсего потрачено: " + total + " руб.");
    return total;
}

function getExpensesByCategory(category) {
    let result = [];
    let sum = 0;
    for (let i = 0; i < expenses.length; i++) {
        if (expenses[i].category == category) {
            result.push(expenses[i]);
            sum = sum + expenses[i].amount;
        }
    }
    let output = "Категория: " + category + "\n";
    if (result.length == 0) {
        output += "Нет расходов в этой категории";
        alert(output);
        return [];
    }
    for (let j = 0; j < result.length; j++) {
        output += " - " + result[j].title + ": " + result[j].amount + " руб.\n";
    }
    output += "\nИтого по категории: " + sum + " руб. (" + result.length + " операций)";
    alert(output);
    return result;
}

function findExpenseByTitle(search) {
    if (search == "" || search == null) {
        alert("Строка поиска не может быть пустой");
        return null;
    }
    for (let i = 0; i < expenses.length; i++) {
        if (expenses[i].title.indexOf(search) != -1) {
            let output = "Найдено:\n";
            output += "  ID: " + expenses[i].id + "\n";
            output += "  Название: " + expenses[i].title + "\n";
            output += "  Сумма: " + expenses[i].amount + " руб.\n";
            output += "  Категория: " + expenses[i].category;

            alert(output);

            let note = prompt("Хотите добавить заметку к этому расходу? (введите текст или нажмите Отмена)");
            if (note != null && note != "") {
                if (expenses[i].note == null) {
                    expenses[i].note = [];
                }
                expenses[i].note.push(note);
                alert("Заметка добавлена: " + note);
            }
            return expenses[i];
        }
    }
    alert("Ничего не найдено по запросу: " + search);
    return null;
}

let expenseTracker = {
    expenses: expenses,

    addExpense: function (title, amount, category) {
        return addExpense(title, amount, category);
    },

    getTotalAmount: function () {
        return getTotalAmount();
    },

    getExpensesByCategory: function (category) {
        return getExpensesByCategory(category);
    },

    findExpenseByTitle: function (search) {
        return findExpenseByTitle(search);
    },

    deleteExpenseById: function (id) {
        for (let i = 0; i < expenses.length; i++) {
            if (expenses[i].id == id) {
                alert("Удалён расход: " + expenses[i].title + " (ID: " + id + ")");
                expenses.splice(i, 1);
                return true;
            }
        }
        alert("Расход с ID " + id + " не найден");
        return false;
    },

    printCategoryStats: function () {
        let output = "";
        if (expenses.length == 0) {
            output += "Нет данных для статистики";
            alert(output);
            return;
        }
        let stats = {};
        for (let i = 0; i < expenses.length; i++) {
            let cat = expenses[i].category;
            let amount = expenses[i].amount;
            if (stats[cat] == null) {
                stats[cat] = 0;
            }
            stats[cat] = stats[cat] + amount;
        }
        for (let cat in stats) {
            output += cat + ": " + stats[cat] + " руб.\n";
        }
        output += "Всего категорий: " + Object.keys(stats).length;
        alert(output);
    }
};

function getNumber(message) {
    let val = prompt(message);
    if (val == null) return null;
    return parseFloat(val);
}

function showMenu() {
    let text = "";
    text += "Всего расходов: " + expenses.length + "\n\n";
    text += "1. Добавить расход\n";
    text += "2. Показать все расходы\n";
    text += "3. Показать общую сумму\n";
    text += "4. Поиск по категории\n";
    text += "5. Поиск по названию\n";
    text += "6. Удалить по ID\n";
    text += "7. Статистика по категориям\n";
    text += "0. Выход\n\n";
    text += "Выберите действие (0-7):";
    return prompt(text);
}

function handleChoice(choice) {
    switch (choice) {
        case "1":
            let title = prompt("Введите название расхода:");
            if (title == null || title == "") {
                alert("Название не может быть пустым");
                break;
            }
            let amount = getNumber("Введите сумму:");
            if (amount == null || isNaN(amount) || amount <= 0) {
                alert("Сумма должна быть положительным числом");
                break;
            }
            let category = prompt("Введите категорию:");
            if (category == null || category == "") {
                alert("Категория не может быть пустой");
                break;
            }
            expenseTracker.addExpense(title, amount, category);
            break;

        case "2":
            printAllExpenses();
            break;

        case "3":
            getTotalAmount();
            break;

        case "4":
            let cat = prompt("Введите категорию для поиска:");
            if (cat != null && cat != "") {
                getExpensesByCategory(cat);
            }
            break;

        case "5":
            let search = prompt("Введите текст для поиска:");
            if (search != null && search != "") {
                findExpenseByTitle(search);
            }
            break;

        case "6":
            let id = getNumber("Введите ID для удаления:");
            if (id != null && !isNaN(id)) {
                expenseTracker.deleteExpenseById(id);
            }
            break;

        case "7":
            expenseTracker.printCategoryStats();
            break;

        case "0":
            alert("Программа завершена");
            return false;

        default:
            alert("Неверный выбор. Введите число от 0 до 7");
    }
    return true;
}

while (true) {
    let choice = showMenu();
    if (choice === null) break;
    if (!handleChoice(choice)) break;
}

window.expenseTracker = expenseTracker;
