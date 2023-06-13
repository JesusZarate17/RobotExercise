import pyautogui


def move_cursor_up():
    screen_width, screen_height = pyautogui.size()
    pyautogui.moveTo(screen_width // 2, screen_height // 2, duration=0)
    return pyautogui.moveTo(screen_width // 2, 0, duration=1)
