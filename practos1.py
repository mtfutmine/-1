import abc
import os

class Person(abc.ABC):
    """Абстрактный человек."""
    def __init__(self, name):
        self._name = name

    @property
    def name(self):
        return self._name

    @abc.abstractmethod
    def show_menu(self, library):
        """Полиморфный метод для меню."""
        pass

class Librarian(Person):
    """Библиотекарь."""
    def show_menu(self, library):
        while True:
            print("--- Библиотекарь ---")
            print("1 - добавить книгу")
            print("2 - удалить книгу")
            print("3 - регистрация пользователя")
            print("4 - список всех пользователей")
            print("5 - список всех книг")
            print("6 - выйти")
            choice = input("выберите: ")

            if choice == "1":
                title = input("название: ")
                author = input("автор: ")
                library.add_book(title, author)

            elif choice == "2":
                title = input("название: ")
                library.remove_book(title)

            elif choice == "3":
                name = input("имя: ")
                library.register_user(name)

            elif choice == "4":
                library.show_all_users()

            elif choice == "5":
                library.show_all_books()

            elif choice == "6":
                break

class User(Person):
    """Обычный пользователь."""
    def __init__(self, name):
        super().__init__(name)
        self._borrowed = []

    @property
    def borrowed(self):
        return self._borrowed

    def take_book(self, book):
        self._borrowed.append(book)

    def return_book(self, book):
        if book in self._borrowed:
            self._borrowed.remove(book)

    def show_menu(self, library):
        while True:
            print(f"--- Пользователь {self.name} ---")
            print("1 - доступные книги")
            print("2 - взять книгу")
            print("3 - выйти")
            choice = input("выберите: ")

            if choice == "1":
                library.show_available_books()

            elif choice == "2":
                title = input("название: ")
                library.borrow_book(self, title)

            elif choice == "3":
                break

class Book:
    """Модель книги."""
    def __init__(self, title, author, status="available"):
        self._title = title
        self._author = author
        self._status = status

    @property
    def title(self):
        return self._title

    @property
    def author(self):
        return self._author

    @property
    def status(self):
        return self._status

    @status.setter
    def status(self, value):
        self._status = value

    def __str__(self):
        return f"{self._title} — {self._author} ({self._status})"

class Library:
    def __init__(self):
        self._books = []
        self._users = []
        self._librarians = []

    def load_data(self):
        """Читаем данные из текстовых файлов."""
        if os.path.exists("books.txt"):
            with open("books.txt", "r", encoding="utf-8") as f:
                for line in f:
                    parts = line.strip().split(",")
                    if len(parts) >= 3:
                        b = Book(parts[0], parts[1], parts[2])
                        self._books.append(b)

        if os.path.exists("users.txt"):
            with open("users.txt", "r", encoding="utf-8") as f:
                for line in f:
                    parts = line.strip().split(",")
                    name = parts[0]
                    user = User(name)
                    for title in parts[1:]:
                        book = self._find_book(title)
                        if book:
                            user.take_book(book)
                            book.status = "issued"
                    self._users.append(user)

        if os.path.exists("librarians.txt"):
            with open("librarians.txt", "r", encoding="utf-8") as f:
                for line in f:
                    name = line.strip()
                    if name:
                        self._librarians.append(Librarian(name))
        else:
            self._librarians.append(Librarian("Vlados"))
            self._save_librarians()

    def save_data(self):
        """Записываем все данные в файлы."""
        with open("books.txt", "w", encoding="utf-8") as f:
            for b in self._books:
                f.write(f"{b.title},{b.author},{b.status}\n")

        with open("users.txt", "w", encoding="utf-8") as f:
            for u in self._users:
                line = u.name
                for b in u.borrowed:
                    line += f",{b.title}"
                f.write(line + "\n")

        self._save_librarians()

    def _save_librarians(self):
        with open("librarians.txt", "w", encoding="utf-8") as f:
            for lib in self._librarians:
                f.write(lib.name + "\n")

    def _find_book(self, title):
        """Ищет книгу по точному названию (без учёта регистра)."""
        for book in self._books:
            if book.title.lower() == title.lower():
                return book
        return None

    def find_user(self, name):
        for user in self._users:
            if user.name.lower() == name.lower():
                return user
        return None

    def find_librarian(self, name):
        for lib in self._librarians:
            if lib.name.lower() == name.lower():
                return lib
        return None

    def add_book(self, title, author):
        book = Book(title, author)
        self._books.append(book)
        print(f"Книга '{title}' добавлена.")
        self.save_data()

    def remove_book(self, title):
        book = self._find_book(title)
        if book:
            self._books.remove(book)
            for user in self._users:
                user.return_book(book)
            print(f"Книга '{title}' удалена.")
            self.save_data()
        else:
            print("Книга не найдена.")

    def register_user(self, name):
        if self.find_user(name):
            print("Пользователь с таким именем уже есть.")
        else:
            self._users.append(User(name))
            print(f"Пользователь '{name}' зарегистрирован.")
            self.save_data()

    def show_all_users(self):
        if not self._users:
            print("Нет зарегистрированных пользователей.")
        else:
            print("\n--- Пользователи ---")
            for u in self._users:
                taken = ", ".join(b.title for b in u.borrowed)
                if not taken:
                    taken = "нет"
                print(f"{u.name} : {taken}")

    def show_all_books(self):
        if not self._books:
            print("В библиотеке нет книг.")
        else:
            print("\n--- Все книги ---")
            for b in self._books:
                print(b)

    def show_available_books(self):
        available = [b for b in self._books if b.status == "available"]
        if not available:
            print("Сейчас нет доступных книг.")
        else:
            print("--- Доступные книги ---")
            for b in available:
                print(b)

    def borrow_book(self, user, title):
        book = self._find_book(title)
        if not book:
            print("Книга не найдена.")
        elif book.status == "issued":
            print("Эта книга уже выдана.")
        else:
            book.status = "issued"
            user.take_book(book)
            print(f"Книга '{title}' выдана пользователю {user.name}.")
            self.save_data()

def main():
    lib = Library()
    lib.load_data()

    while True:
        print("=== Система управления библиотекой ===")
        print("1 - войти как библиотекарь")
        print("2 - войти как пользователь")
        print("3 - выход")
        cmd = input("выберите: ")

        if cmd == "1":
            name = input("Имя библиотекаря: ")
            librarian = lib.find_librarian(name)
            if librarian:
                librarian.show_menu(lib)
            else:
                print("Доступ запрещён. Библиотекарь не найден.")

        elif cmd == "2":
            name = input("Имя пользователя: ")
            user = lib.find_user(name)
            if user:
                user.show_menu(lib)
            else:
                print("Пользователь не зарегистрирован. Обратитесь к библиотекарю.")

        elif cmd == "3":
            lib.save_data()
            print("Данные сохранены. До свидания!")
            break

if __name__ == "__main__":
    main()