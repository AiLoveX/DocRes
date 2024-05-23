import sys
from PIL import Image

def compare_images(img1_path, img2_path):
    try:
        img1 = Image.open(img1_path)
        img2 = Image.open(img2_path)

        im1 = img1.load()
        im2 = img2.load()

        i = 0  

        if img1.size == img2.size:
            x1, y1 = img1.size 

            for x in range(x1):
                for y in range(y1):
                    if im1[x, y] != im2[x, y]:
                        i += 1 

            if i == 0:
                print("Изображения идентичны.")
            else:
                print(f"Количество разных пикселей: {i}")
        else:
            print("Размер изображений не совпадает!")
    except Exception as e:
        print("Произошла ошибка при обработке изображений:", e)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Использование: python script.py <path_to_img1> <path_to_img2>")
    else:
        img1_path = sys.argv[1]
        img2_path = sys.argv[2]
        compare_images(img1_path, img2_path)
