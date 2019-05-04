---
title: c笔记
updated: 1554459508
date: 2019-01-20 11:03:07
tags:
 - c
 - 正则表达式
---

## 随机数

```c
#include<cstdlib>
#include<ctime>
int main()
{
  srand((unsigned)time(NULL)); 
  rand()%x;                 //  取得(0,x)的随机整数：
  rand()%(b - a);             //  取得(a,b)的随机整数：
  rand()%(b - a) + a;           //  取得[a,b)的随机整数：
  rand()%(b - a + 1) + a;         //  取得[a,b]的随机整数：
  rand()%(b - a) + a + 1;         //  取得(a,b]的随机整数：
  rand()/double(RAND_MAX);  //  取得0-1之间的浮点数：
  return 0; 
}
```

## struct

### [strcut的声明](https://blog.csdn.net/dawn_after_dark/article/details/73555562)

```c
// 1
struct $struct_name
{
  ...;
};
struct $struct_name $variable_name;

// 2
typedef struct $struct_name
{
  ...;
}$struct_alias;
struct $struct_name $variable_name;
$struct_alias $variable_name;

// 3
struct $struct_name
{
  ...;
}$variable_name;
struct $struct_name $variable_name;

// 4
struct
{
  ...;
}$variable_name;
```

### [struct的创建和初始化](https://blog.csdn.net/fuyufjh/article/details/46040095)

```c
#define new(type, ...) ({\
       type* __t = (type*) malloc(sizeof(type));\
       *__t = (type){__VA_ARGS__};\
       __t; })
```

## 正则表达式

```c
#include <sys/types.h>
#include <stdio.h>
#include <regex.h>

int main()
{
  int status, i;
  int cflags = REG_EXTENDED;

  regmatch_t time_match[1];
  const size_t nmatch = 1;
  regex_t reg;
  const char *pattern = "s";
  char *buf = "sdsdfdfdffdfdfdf";

  regcomp(&reg, pattern, cflags);
  status = regexec(&reg, buf, nmatch, time_match, 0);
  if (status == REG_NOMATCH)
    Log("No match");
  else if (status == 0)
  {
    Log("Match:");
    for (i = time_match[0].rm_so; i < time_match[0].rm_eo; i ++)
    {
      putchar(buf[i]);
    }
    putchar('\n');
  }
  regfree(&reg);
  return 0;
}
```

## 画图

```c
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>


void draw_rect(int color_num, int x, int y, int w, int h);
void init_screen();
void move_cursor(int direct_num, int dis);

enum colors{BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE};
enum direct{UP, DOWN, RIGHT, LEFT};
const int height = 30;

  int
main()
{
  int i = 0, j = 0;
  char position[32];
  system("tput clear");
  init_screen();
  draw_rect(RED, 7, 0, 5, 5);
  draw_rect(GREEN, 17, 0, 5, 10);
  draw_rect(CYAN, 0, 11, 20, 6);
  while (1);
  return 0;
}

void draw_rect(int color_num, int x, int y, int w, int h)
{
  char offset[16];
  move_cursor(RIGHT, x);
  move_cursor(DOWN, y);
  for (int i = 0; i < h; i ++)
  {
    for (int j = 0; j < w; j ++)
      switch (color_num)
      {
        case BLACK:
          printf("\033[40m \33[0m");
          break;
        case RED:
          printf("\033[41m \33[0m");
          break;
        case GREEN:
          printf("\033[42m \33[0m");
          break;
        case YELLOW:
          printf("\033[43m \33[0m");
          break;
        case BLUE:
          printf("\033[44m \33[0m");
          break;
        case MAGENTA:
          printf("\033[45m \33[0m");
          break;
        case CYAN:
          printf("\033[46m \33[0m");
          break;
        case WHITE:
          printf("\033[47m \33[0m");
          break;
      }
    printf("\n");
    move_cursor(RIGHT, x);
  }
  move_cursor(LEFT, x + w);
  move_cursor(UP, y + h);
}

void move_cursor(int direct_num, int dis)
{
  for (int i = 0; i < dis; i ++)
    switch (direct_num)
    {
      case UP:
        printf("\033[A");
        break;
      case DOWN:
        printf("\033[B");
        break;
      case RIGHT:
        printf("\033[C");
        break;
      case LEFT:
        printf("\033[D");
        break;
    }
}

void init_screen()
{
  for (int i = 0; i < height; i ++)
    printf("\n");
  move_cursor(UP, height);
}
```

## 信号处理

- [菜鸟教程](http://www.runoob.com/cplusplus/cpp-signal-handling.html)
