# b2c2casusb2d22

Het inladen van de database:
Er staan in deze repository twee sql dumps (in het mapje DatabaseScripts), eentje in Unicode en eentje in ANSI. Dit omdat wij er gaandeweg achter kwamen dat
niet elke file bij iedereen correct ingeladen werd. Bij sommige pakte de unicode meteen en sommige hadden meer baat bij de
ANSI file. (Beide gewoon geëxporteert via Microsoft SQL Server Management Studio)

Na het inladen van de database, en om de applicatie te gaan bekijken/testen hoeven er maar twee connectionstrings aangepast
te worden -->
              - bij de web.config file
              - in de Dal.cs file
              
In de files staan verdere comments die verduidelijken waar de connectionstrings moeten komen te staan.

