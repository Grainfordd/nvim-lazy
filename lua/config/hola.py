

import sys
import pygame


def main():
    screen = pygame.display.set_mode((1280, 720))
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()


    screen.fill('orange')
    pygame.display.flip()



if __name__ == "__main__":
    main()
