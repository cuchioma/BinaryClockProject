 #include <stdio.h>
  2 #include <time.h>
  3 #include <unistd.h>
  4 #include "FBCurses.h"
  5
  6 void convertTime(int val1, colorcode_t oncolor, colorcode_t offcolor, int column){
  7         int count = 7;
  8         while(val1 != 0){
  9                 if( val1 %2 == 0){
 10                         setPixel(count,column,offcolor);
 11                 }
 12                 else{
 13                         setPixel(count,column,oncolor);
 14                 }
 15                 val1 = val1 /2;
 16                 count --;
 17         }
 18         for (int i = count; i >= 0; i--) {
 19                 setPixel(i,column, offcolor);
 20         }
 21 }
 22 void showTime(colorcode_t oncolor, colorcode_t offcolor){
 23         time_t realtime;
 24         struct tm * timeinfo;
 25         time ( &rawtime );
 26         timeinfo = localtime ( &rawtime );
 27
 28         binaryTime(timeinfo->tm_hour, oncolor, offcolor, 1);
 29         binaryTime(timeinfo->tm_min, oncolor, offcolor, 3);
 30         binaryTime(timeinfo->tm_sec, oncolor, offcolor, 5);
 31
 32
 33 int main(){
 34         initScreen();
 35         //feel free to change the color scheme to your liking.
 36         colorcode_t background=initColor(COLOR_RED);
 37         colorcode_t offcolor=initColor(COLOR_BLACK);
 38         colorcode_t oncolor=initColor(COLOR_WHITE);
 39         clearScreen(background);
 40         while (!kbhit()){
 41                 showTime(oncolor,offcolor);
 42                 sleep(1);  //sleep for 1 second
 43         }
 44         cleanupScreen();
 45 }
