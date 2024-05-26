def distance_from_functions(x1, x2):
    # Получаем расстояния между значениями наших функций y1(x) и y(2)
    return abs(function_y2(x1) - function_y1(x2))

def find_bridge_location(y1, y2, dx=0.001):
    # Изначальные значения в задаче
    default = 0
    current_x = 0.0

    # Приближение первой функции
    x1 = current_x + dx
    while (distance_from_functions(current_x, default) - distance_from_functions(x1, default)) > 0:
        current_x = x1
        x1 = current_x + dx
    x1_bridge = default

    # Теперь приближение второй функции
    current_x = 0.0
    default = current_x
    x1 = current_x + dx
    while (distance_from_functions(default, current_x) - distance_from_functions(default, x1)) > 0:
        current_x = x1
        x1 = current_x + dx
    x2_bridge = current_x

    return x1_bridge, x2_bridge

def function_y1(x):
    return x ** 2

def function_y2(x):
    return 4

# Пример
x1, x2 = find_bridge_location(function_y1, function_y2)
print(f"Оптимальные x-координаты для моста: x1 = {x1}, x2 = {x2}")
