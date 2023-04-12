#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ncurses.h>

static bool display_opened = false;

int open_display(void) {
    if (display_opened) {
        return 0;
    }
    if (initscr() == NULL) {
        return 0;
    }
    cbreak();
    noecho();
    curs_set(0);
    display_opened = true;
    return 1;
}

void display_colons(void) {
    mvprintw(2, 12, ":");
    mvprintw(2, 15, ":");
}

void display_hours(int hours) {
    mvprintw(2, 9, "%02d", hours);
}

void display_minutes(int minutes) {
    mvprintw(2, 13, "%02d", minutes);
}

void display_seconds(int seconds) {
    mvprintw(2, 16, "%02d", seconds);
}

void display_time(int hours, int minutes, int seconds) {
    if (!display_opened) {
        return;
    }
    clear();
    display_colons();
    display_hours(hours);
    display_minutes(minutes);
    display_seconds(seconds);
    refresh();
}

void close_display(void) {
    if (display_opened) {
        endwin();
        display_opened = false;
    }
}
