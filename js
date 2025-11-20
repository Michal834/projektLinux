<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<title>Lista zakupów – jQuery</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .highlight {
        background-color: #ffeaa7;
    }
    .many-items {
        background-color: #f8c291; /* >5 sztuk */
    }
</style>
</head>
<body>

<h2>Lista zakupów</h2>

Nazwa: <input type="text" id="nazwa"><br>
Cena: <input type="number" id="cena" step="0.01"><br>
Ilość: <input type="number" id="ilosc"><br><br>

<button id="dodaj">Dodaj</button>
<button id="wyczysc">Wyczyść listę</button>

<ul id="lista"></ul>

<div id="podsumowanie">Brak pozycji na liście</div>

<script>
$(function(){

    let ilosc_zakupow = 0;
    let cena_za_wszystko = 0;

    function aktualizujPodsumowanie() {
        if (ilosc_zakupow === 0) {
            $("#podsumowanie").text("Brak pozycji na liście");
        } else {
            $("#podsumowanie").text(
                "Ilość zakupów: " + ilosc_zakupow + 
                " | Cena za wszystko: " + cena_za_wszystko.toFixed(2) + " zł"
            );
        }
    }

    $("#dodaj").click(function() {
        let nazwa = $("#nazwa").val().trim();
        let cena = parseFloat($("#cena").val());
        let ilosc = parseInt($("#ilosc").val());

        // Walidacja
        if (nazwa === "" || isNaN(cena) || isNaN(ilosc)) {
            alert("Wszystkie pola muszą być uzupełnione!");
            return;
        }

        let wartosc = cena * ilosc;
        let tekst = `${nazwa} – cena: ${cena} zł × ${ilosc} = ${wartosc.toFixed(2)} zł`;

        // Dodaj emoji jeśli wartosc > 10
        if (wartosc > 10) tekst += " 💲";

        let li = $("<li>").text(tekst);

        // Podświetl jeśli ilość > 5
        if (ilosc > 5) {
            li.addClass("many-items");
        }

        // Krótkie podświetlenie po dodaniu
        li.addClass("highlight");
        setTimeout(() => li.removeClass("highlight"), 300);

        $("#lista").append(li);

        // Aktualizacja zmiennych
        ilosc_zakupow++;
        cena_za_wszystko += wartosc;

        aktualizujPodsumowanie();

        // Wyczyść inputy
        $("#nazwa").val("");
        $("#cena").val("");
        $("#ilosc").val("");
    });

    $("#wyczysc").click(function() {
        $("#lista").empty();
        ilosc_zakupow = 0;
        cena_za_wszystko = 0;
        aktualizujPodsumowanie();
    });

});
</script>

</body>
</html>