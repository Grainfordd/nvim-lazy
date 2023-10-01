import pygame
import sys

def suma(num1, num2):
    return num1 + num2


def main():
    screen = pygame.display.set_mode((1280, 720))
    pygame.display.set_caption('Juego')

    while True:
        for event in pygame.event.get():
            if event.type == pygame.KEYDOWN:
                sys.exit()

        screen.fill('gray')
        pygame.display.flip()

if __name__ == "__main__":
    main()
