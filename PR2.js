// Объект управления приложением
const expenseTracker = {
    expenses: [],
    nextId: 1,

    // Добавление расхода
    addExpense: function (title, amount, category) {
        if (!title || typeof title !== 'string') {
            console.log("Название должно быть строкой.");
            return;
        }
        if (typeof amount !== 'number' || amount <= 0) {
            console.log("Сумма должна быть положительным числом.");
            return;
        }
        if (!category || typeof category !== 'string') {
            console.log("Категория обязательна.");
            return;
        }

        const newExpense = {
            id: this.nextId,
            title: title,
            amount: amount,
            category: category
        };

        this.nextId++;
        this.expenses.push(newExpense);
        console.log("Расход добавлен: " + title);
    },

    // Вывод всех расходов
    printAllExpenses: function () {
        console.log("Список всех расходов:");
        if (this.expenses.length === 0) {
            console.log("Список пуст.");
            return;
        }
        for (let i = 0; i < this.expenses.length; i++) {
            let item = this.expenses[i];
            console.log("ID: " + item.id + " | " + item.title + " - " + item.amount + " руб. (" + item.category + ")");
        }
    },

    // Подсчёт общего баланса
    getTotalAmount: function () {
        let total = 0;
        for (let i = 0; i < this.expenses.length; i++) {
            total += this.expenses[i].amount;
        }
        console.log("ЧЕК: Общий баланс расходов: " + total + " руб.");
        return total;
    },

    // Фильтрация по категории
    getExpensesByCategory: function (category) {
        console.log("Поиск категории: " + category);
        let foundItems = [];
        let categorySum = 0;

        for (let i = 0; i < this.expenses.length; i++) {
            if (this.expenses[i].category === category) {
                foundItems.push(this.expenses[i]);
                categorySum += this.expenses[i].amount;
            }
        }

        if (foundItems.length === 0) {
            console.log("Расходов в этой категории не найдено.");
            return [];
        }

        for (let i = 0; i < foundItems.length; i++) {
            console.log("- " + foundItems[i].title + ": " + foundItems[i].amount + " руб.");
        }
        console.log("Итого на категорию '" + category + "' потрачено: " + categorySum + " руб.");

        return foundItems;
    },

    // Поиск расхода
    findExpenseByTitle: function (searchString) {
        console.log("Поиск по названию: " + searchString);

        for (let i = 0; i < this.expenses.length; i++) {
            if (this.expenses[i].title.includes(searchString)) {
                console.log("Найдено:", this.expenses[i]);
                console.log(">> Вы можете добавить заметку к этому расходу.");
                return this.expenses[i];
            }
        }

        console.log("Ничего не найдено.");
        return null;
    },

    // Удаление по ID
    deleteExpense: function (id) {
        for (let i = 0; i < this.expenses.length; i++) {
            if (this.expenses[i].id === id) {
                this.expenses.splice(i, 1);
                console.log("Расход с ID " + id + " удален.");
                return true;
            }
        }
        console.log("Расход с ID " + id + " не найден.");
        return false;
    },

    // Статистика по категориям
    getCategoryStats: function () {
        console.log("Статистика по категориям:");
        let stats = {};

        for (let i = 0; i < this.expenses.length; i++) {
            let cat = this.expenses[i].category;
            let amount = this.expenses[i].amount;

            if (!stats[cat]) {
                stats[cat] = 0;
            }
            stats[cat] += amount;
        }

        for (let cat in stats) {
            console.log(cat + ": " + stats[cat] + " руб.");
        }
    }
};

// Добавляем расходы
expenseTracker.addExpense("стим дек", 48000, "Игры");
expenseTracker.addExpense("деф стрендинг 2", 5000, "Игры");
expenseTracker.addExpense("форза хорайзон 5", 5000, "Игры");
expenseTracker.addExpense("Тортик", 800, "Еда");
expenseTracker.addExpense("Мафин", 300, "Еда");
expenseTracker.addExpense("Ручка", 100, "Концтовары");
expenseTracker.addExpense("Карандаш", 50, "Концтовары");

// Проверка валидации
expenseTracker.addExpense("", -100, "");

// Выводим всё
expenseTracker.printAllExpenses();

// Считаем общую сумму
expenseTracker.getTotalAmount();

// Фильтруем по категории "Игры"
expenseTracker.getExpensesByCategory("Игры");

// Ищем расход
expenseTracker.findExpenseByTitle("стим");

// Статистика
expenseTracker.getCategoryStats();

// Удаляем расход
expenseTracker.deleteExpense(4);

// Проверяем список после удаления
expenseTracker.printAllExpenses();
