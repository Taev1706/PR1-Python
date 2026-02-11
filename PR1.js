const users = [
  { id: 1, name: "Anna", age: 22, city: "Moscow", isActive: true },
  { id: 2, name: "Oleg", age: 17, city: "Kazan", isActive: false },
  { id: 3, name: "Ivan", age: 30, city: "Moscow", isActive: true },
  { id: 4, name: "Maria", age: 25, city: "Sochi", isActive: false }
];

function getActiveUsers(usersArray) {
  return usersArray.filter(user => user.isActive);
}

console.log("Задание 1");
console.log(getActiveUsers(users));

const getUserNames = (usersArray) => {
  return usersArray.map(user => user.name);
}

console.log("Задание 2");
console.log(getUserNames(users));

function findUserById(users,id){
    return users.find(user => user.id === id) || null;
}

console.log("Задание 3");
console.log(findUserById(users, 4))
console.log(findUserById(users, 42))

function getUsersStatistics(usersArray) {
  const total = usersArray.length;
  const active = usersArray.filter(user => user.isActive).length;
  return {
    total: total,
    active: active,
    inactive: total - active
  };
}

console.log("Задание 4");
console.log(getUsersStatistics(users));

function getAverageAge(users) {
  const sum = users.reduce((acc, user) => acc + user.age, 0);
  return users.length === 0 ? 0 : sum / users.length;
}

console.log("Задание 5");
console.log(getAverageAge(users).toFixed(2));

function groupUsersByCity(usersArray) {
  return usersArray.reduce((result, user) => {
    if (!result[user.city]) {
      result[user.city] = [];
    }
    result[user.city].push(user);
    return result;
  }, {});
}

console.log("Задание 6");
console.log(groupUsersByCity(users));
