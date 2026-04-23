import socket
import threading

def receive_messages(socket):
    while True:
        try:
            data = socket.recv(1024)
            if not data:
                print("Сервер отключился.")
                break
            print(data.decode('utf-8'))
        except:
            break
        

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(("127.0.0.1", 5001))

threading.Thread(target=receive_messages, args=(client_socket,), daemon=True).start()

print("Вы вошли в чат. Пишите сообщения (для выхода пропишите: exit)")

while True:
    message = input("Ваше сообщение: ")
    if message.lower() == "exit":
        break
    if message:
        client_socket.send(message.encode("utf-8"))
        
client_socket.close()