import socket
import threading
 
def receive_messages(client_socket):
    while True:
        try:
            data = client_socket.recv(1024)
            if not data:
                print("Соединение с сервером разорвано.")
                break
            print("Получино:", data.decode("utf-8"))
        except:
            print("Соединение с сервером потеряно.")
            break
    client_socket.close()
 
def send_messages(client_socket):
    while True:
        try:
            message = input()
            if not message:
                continue
            client_socket.send(message.encode("utf-8"))
        except:
            break
 
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    client_socket.connect(("127.0.0.1", 5001))
except ConnectionRefusedError:
    print("Не удалось подключиться к серверу.")
    exit()
 
receive_thread = threading.Thread(target=receive_messages, args=(client_socket,), daemon=True)
send_thread = threading.Thread(target=send_messages, args=(client_socket,), daemon=True)
 
receive_thread.start()
send_thread.start()
 
receive_thread.join()