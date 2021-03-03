# StatisticHypothes
 Project makes the validation of statistical hypotheses
 
 ## Описание 
 Реализованы следующие задачи:  
 1. Проверка гипотезы о равенстве средних **однофакторным дисперсионным анализом** (DispersionAnalizOneFactor)  
 2. Проверка гипотезы об истинности **линейного контраста** (LinearContrast)  
 3. Проверка гипотезы о сдвиге (исп. KrZnakEq)  
 4. Проверка гипотезы об однородности генеральных совокупностей критерием **знаков** (KrZnakEq)  
 5. Проверка гипотезы об однородности генеральных совокупностей критерием **серий** (ValfVolfoviz_2)  
 6. Проверка гипотезы об однородности генеральных совокупностей критерием **Вилкинсона-Манна-Уитни** (VilkinsonMannWitny_2)  
 7. Проверка гипотезы о независимости генеральных совокупностей критерием **квадратной корреляции** (SquareCorr)  
 8. Проверка гипотезы о независимости генеральных совокупностей критерием **Спирмена** (Spirman)  
 9. Проверка гипотезы о независимости генеральных совокупностей критерием **Кендэлла** (Kendal)  
 
 Основано на курсе МИЭТ по математической статистике. Теорию можно посмотреть в книге Лесин, Виктор Васильевич "Теория вероятностей и математическая статистика"
 

## Установка
Для запуска необходима среда Matlab

## Применение  
Все функции принимают параметры:  
- x, y - массивы выборок проверяемых генеральных совокупностей
- alpha - уровень значимости
- H1 - альтернативная гипотеза:
     - -1 - меньше
     - 0 - не равно
     - 1 - больше  
Все функции имеют параметры по умолчанию. Внутри файла-функции можно посмотреть пример задания параметров для конкретной функции.  

**Замечание 1:**   
Функция для критерия знаков имеет три реализации, KrZnakEq0, KrZnakEq1, KrZnakEq2. Отличие в том, какой метод оценки применяется внутри:  
KrZnakEq0 - бинарное распределение  
KrZnakEq1 - нормальный закон    
KrZnakEq2 - распределение Фишера  
По входным данным и возвращаемому значению полностью идентичны.  

**Замечание 2:**   
Функция DispersionAnalizOneFactor принимает не сами массивы, а cell array массивов. Пример применения есть в самой функции.  

 ## Пример
 Проверка критерием Кендала гипотезы о независимости генеральных совокупностей (корреляция = 0) на уровне значимости 0.05 с альтернативой - "генеральные совокупности обратно зависимы" (корреляция < 0).  
 ``` matlab
 x = [88.1 92.2 90.1 84.5 91.8 90.9 90.2 84.4 86.1 90.8 90.3 90.7 92.8 87.5 90.4 91.5 85.1 91.2 87.7 85.1];
y = [88.8 91.1 84.2 84.4 92.2 84.6 84.8 89.1 90.1 89.3 85.5 93.3 84.9 87.1 89.5 87.6 84.3 85.3 89.7 89.9];
H1 = -1;
alpha=0.05;

fprintf('\nКритерий Кендала:\n');
Kendal(x,y,H1,alpha);
```
 ![image](https://user-images.githubusercontent.com/47564437/109806469-ced35780-7c35-11eb-99f2-20b5b73f0762.png)  
  
 Больше примеров на каждую функцию можно посмотреть в файле A_launcher.
