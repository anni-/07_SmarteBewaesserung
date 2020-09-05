# Open Farming Hackdays Challenge 07
## Smarte Bewässerung – Eine Entscheidungshilfe

### Start with a Plan - Big Data Management Canvas
Der Big Data Management Canvas ist der perfekte Ausgangspunkt für ein Daten Projekt. Hierbei schaut man das Projekt aus der Business sowie aus der technischen Sicht an. 
![](./img/BDM.jpg)

### Umsetzbare Teilaufgaben
Während den Hackdays haben wir uns auf folgende "Felder" des BDM Canvas konzentriert:

- Analytics
- Datafication
- Interaction

### Analytics
Was: Können wir aus den bestehenden Daten (Sonden / Saugspanne und Wetterdaten) ein Modell erstellen, welches die Saugspanne vorraussagt?

Wie: Explatory Data Analysis. Gibt es zwischen den verfügbaren Parametern einen Zusammenhang zur Zielvariable? Hierbei wird eine Station mit Bodensonde mit den passenden Wetterdaten zu einem Datenset zusammengefügt. Die Hypothese ist: Wenn es viel regnet, dann ist der Boden nass :-) Mit Rolling Windows werden jeweils die letzten 5 Tage an Regenfällen zusammen summiert. 

Resultat: Nein :-) Rein auf Wetterdaten basierend kann kein zuverlässiges Modell erstellt werden. Was ist das Problem? Wir haben keine "naturbelassenen" Daten. Wenn ein Feld trocken wird, dann wird es bewässert. Hierbei müssten Messdaten in diversen Bodenbeschaffenheiten gesammelt werden, welche über längere Zeit "in Ruhe" gelassen werden. 

Update 30min nachdem der Text oben geschrieben wurde:
Y = x1 + x1*x2
x1 = Regenfall in mm in den letzten 25 Tagen
x2 = Temperatur der letzten 7 Tage

![](./img/Modell.png)

![](./img/modelsummary.png)
![](./img/something.jpg)


Weiteres: Können wir GIS / Satelitendaten verwenden um die Bodenbeschaffenheit vorrauszusagen? TBD


### Datafication
Was: Welche Daten benötigen wir und wie kommen wir genau an diese Daten?

### Interaction
