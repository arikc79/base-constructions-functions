// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FunctionParameters {

    // ===== 1) ЗМІННІ СТАНУ =====
    string public courseName;
    uint public lessons;
    bool public isActive;
    address public teacher;

    // setCourse приймає 4 параметри і записує їх у змінні стану
    function setCourse(
        string memory _name,
        uint _lessons,
        bool _isActive,
        address _teacher
    ) public {
        courseName = _name;
        lessons = _lessons;
        isActive = _isActive;
        teacher = _teacher;
    }

    // ===== 2) memory =====
    // Приймає рядок через memory, повертає його назад
    function reverseName(string memory name) public pure returns (string memory) {
        bytes memory b = bytes(name);
        uint len = b.length;
        bytes memory reversed = new bytes(len);
        for (uint i = 0; i < len; i++) {
            reversed[i] = b[len - 1 - i];
        }
        return string(reversed);
    }

    // ===== 3) calldata =====
    // external + calldata — найдешевший варіант для рядків ззовні
    function checkName(string calldata name) external pure returns (string memory) {
        return name;
    }

    // ===== 4) Масиви через memory =====
    function sumArray(uint[] memory arr) public pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }

    // ===== 5) Структура Student =====
    struct Student {
        string name;
        uint age;
    }

    Student public student;

    // Приймає структуру через memory, зберігає у storage
    function saveStudent(Student memory s) public {
        student = s;
    }

    // ===== 6) storage =====
    uint[] public numbers;

    // internal — викликається лише зсередини контракту
    // ref — посилання на storage, зміни йдуть одразу в numbers
    function fillStorage() internal {
        uint[] storage ref = numbers;
        ref.push(10);
        ref.push(20);
        ref.push(30);
    }

    function testStorage() public {
        fillStorage();
    }

    // ===== 7) Повернення кількох значень =====
    function calculate(uint a, uint b) public pure returns (
        uint sum,
        uint difference,
        uint product,
        uint quotient
    ) {
        sum = a + b;
        // якщо a < b — різниця буде 0 (uint не від'ємний)
        difference = a >= b ? a - b : 0;
        product = a * b;
        // захист від ділення на нуль
        quotient = b != 0 ? a / b : 0;
    }

    // ===== 8) Іменовані повернені значення =====
    function statistics(uint a, uint b, uint c) public pure returns (
        uint maxVal,
        uint minVal,
        uint total
    ) {
        // max
        maxVal = a;
        if (b > maxVal) maxVal = b;
        if (c > maxVal) maxVal = c;
        // min
        minVal = a;
        if (b < minVal) minVal = b;
        if (c < minVal) minVal = c;
        // sum
        total = a + b + c;
    }

    // ===== 9) Повернення масиву =====
    function createArray() public pure returns (uint[] memory) {
        uint[] memory arr = new uint[](5);
        arr[0] = 100;
        arr[1] = 200;
        arr[2] = 300;
        arr[3] = 400;
        arr[4] = 500;
        return arr;
    }

    // ===== 10) Комплексне завдання =====
    struct Product {
        string name;
        uint price;
        uint quantity;
    }

    Product[] public products;

    // Приймає структуру через memory, пушить у масив
    function addProduct(Product memory p) public {
        products.push(p);
    }

    // Повертає один товар за індексом
    function getProduct(uint index) public view returns (Product memory) {
        require(index < products.length, "Index out of range");
        return products[index];
    }

    // Повертає весь масив
    function getAllProducts() public view returns (Product[] memory) {
        return products;
    }

    // storage-посилання на масив — додаємо через ref
    function copyProducts() public {
        Product[] storage ref = products;
        ref.push(Product("Copy Item", 999, 1));
    }
}
