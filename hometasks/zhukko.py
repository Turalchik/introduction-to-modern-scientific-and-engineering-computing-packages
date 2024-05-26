import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp


def zhukko(room_side, speed):
    # Начальные позиции жуков в углах комнаты
    initial_positions = [
        [0, 0],
        [room_side, 0],
        [room_side, room_side],
        [0, room_side]
    ]

    # Функция для расчета уравнений движения жуков
    def equations(t, positions):
        x1, y1, x2, y2, x3, y3, x4, y4 = positions

        def compute_derivatives(xa, ya, xb, yb):
            distance = np.linalg.norm([xb - xa, yb - ya])
            dx = speed * (xb - xa) / distance
            dy = speed * (yb - ya) / distance
            return dx, dy

        dx1, dy1 = compute_derivatives(x1, y1, x2, y2)
        dx2, dy2 = compute_derivatives(x2, y2, x3, y3)
        dx3, dy3 = compute_derivatives(x3, y3, x4, y4)
        dx4, dy4 = compute_derivatives(x4, y4, x1, y1)

        return [dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4]

    # Начальные условия, взятые из начальных позиций
    initial_conditions = [coord for pos in initial_positions for coord in pos]

    # Временные параметры для решения ОДУ
    t_span = (0, 10)
    t_eval = np.linspace(t_span[0], t_span[1], 1000)

    # Решение системы ОДУ
    sol = solve_ivp(equations, t_span, initial_conditions, t_eval=t_eval)

    # Разделение решения на координаты жуков
    x1, y1, x2, y2, x3, y3, x4, y4 = sol.y

    # Построение траекторий движения жуков
    plt.plot(x1, y1, label='Жук 1')
    plt.plot(x2, y2, label='Жук 2')
    plt.plot(x3, y3, label='Жук 3')
    plt.plot(x4, y4, label='Жук 4')

    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Траектории движения жуков')
    plt.legend()
    plt.grid(True)
    plt.show()

