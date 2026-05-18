import os
import time
from multiprocessing import Pool, cpu_count
from PIL import Image

INPUT_DIR = "images"
OUTPUT_DIR = "processed"
NEW_SIZE = (800, 600)

def process_image(filename):
    input_path = os.path.join(INPUT_DIR, filename)
    output_path = os.path.join(OUTPUT_DIR, f"out_{filename}")

    with Image.open(input_path) as img:
        img = img.rotate(-90, expand=True)
        img = img.resize(NEW_SIZE, Image.LANCZOS)
        img = img.convert("L")
        img.save(output_path)


def sequential_processing(files):
    start_time = time.perf_counter()

    for filename in files:
        process_image(filename)

    return time.perf_counter() - start_time


def multiprocessing_processing(files):
    start_time = time.perf_counter()

    with Pool(processes=cpu_count()) as pool:
        pool.map(process_image, files)

    return time.perf_counter() - start_time


if __name__ == "__main__":
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    if not os.path.isdir(INPUT_DIR):
        print("Папки images нет. Создайте её и добавьте фотографии.")
        raise SystemExit

    files = sorted(
        f for f in os.listdir(INPUT_DIR)
        if f.lower().endswith(".jpg")
    )

    if not files:
        print("Папка images пуста. Заполните её фотографиями.")
        raise SystemExit

    print(f"Найдено изображений: {len(files)}")

    print("Режим 1: Последовательная обработка")
    seq_time = sequential_processing(files)
    print(f"Время выполнения: {seq_time:.4f} сек")

    print("Режим 2: multiprocessing.Pool")
    mp_time = multiprocessing_processing(files)
    print(f"Время выполнения: {mp_time:.4f} сек")

    print("Сравнение времени:")
    if mp_time < seq_time:
        speedup = seq_time / mp_time
        print(f"Multiprocessing быстрее в {speedup:.2f} раз(а).")
    elif seq_time < mp_time:
        slowdown = mp_time / seq_time
        print(f"Последовательный режим быстрее в {slowdown:.2f} раз(а).")
    else:
        print("Оба режима показали одинаковое время.")

    print()
    print("Обработка завершена.")
