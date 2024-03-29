#!/usr/bin/clisp
;; ---------------------------------------------------
;; (c) 2019 Jens Kallup  -  non-profit
;; Alle Rechte vorbehalten!
;;
;; Nicht für kommerzielle Zwecke !!!
;; ----------------------------------------------------------------------------
;; Rechenregeln:  geometrische Formeln
;;
(defun geoRechteck-Flaeche (h l) (* h l))               ; Rechteck Fläche:     Höhe h *     Länge l
(defun geoRechteck-Umfang  (h l) (+ (* 2 h) (* 2 l)))   ; Rechteck Umfang: 2 * Höhe h + 2 * Länge l
;;
(defun geoQuadrat-Flaeche  (a)   (* a a))               ; Quadrat-Fläche: a^2
(defun geoQuadrat-Umfang   (a)   (* 4 a))               ; Quadrat-Umfang: 4a
;;
(defun geoDreiech-Flaeche  (b h)   (* 0.5 (* b h)))     ; Dreieck-Fläche: A = 1/2 * bh
(defun geoDreieck-Umfang   (a b c) (+ a b c))           ; Dreieck-Umfang: a + b + c
;;
(defun geoRechtwinkligesDreieck-Flaeche (a b)   (* 0.5 (* a b)))  ; 90 Grad-Winkel
(defun geoRechtwinkligesDreieck-Umfang  (a b c) (+ a b c))
;;
(defun geoPythagorasSatz (a b c) (+ (* a a) (* b b) (* c c)))
;;
(defun geoTrapez-Flaeche (b d h)   (* (* 0.5 h) (b + h)))
(defun geoTrapez-Umfang  (a b c d) (+ a b c d))
;;
(defun geoRombus-Flaeche (a) (* 4 a))
(defun geoRombus-Umfang  (d1 d2) (/ 2 (* d1 d2)))
;;
(defun geoKreis-Flaeche (r) (* (* r r) 3.14)  )
(defun geoKreis-Umfang  (r) (* (* 2    3.14) r))

;; ----------------------------------------------------------------------------
;; Rechenregeln:
;;
;; 1.  Regel                      Beispiel
;; -----------------------------------------------------
;;     a^m * a^n = a^(m + n)      2^5 * 2^3   = 2^8
;;     a^m / a^n = a^(m - n)      5^7 / 5^3   = 5^4
;;     (a^m)^n   = a^(m * n)      (10^3)^7    = 10^21
;;     a^1       = a              17^1        = 17
;;     a^0       = 1              34^0        = 1
;;     (a/b)^m   = a^m / b^m      (5 / 6)^2   = 25 / 36
;;     a^-m      = 1 / a^m        9^-2        = 1 / 81
;;     a^(x/y)   = 4 sqrt(a^x)    49^(1/2)    = sqrt(49) = 7
;;
;; ----------------------------------------------------------------------------
;;
;; 1.  (a + b)^2 = (a^2 + b^2) * (a^2 + b^2)
;;
;;               = (a^2 * a^2)  = 2 * Wurzel aus a^2  = a * a = 1*a * 1*a = a
;;               + (b^2 * b^2)  = 2 * Wurzel aus b^2  = b * b = 1*a * 1*b = b
;;              -------------------------------------------------------------
;;                                                           = 2   *      ab
;;
;;               = a^2 + b^2  + 2*ab
;;
;; => der 1. binomischen Formel
;; ----------------------------------------------------------------------------
;;
;;  1. (a + b)^2 = a^2 + b^2 + 2ab
;;  2. (a - b)^2 = a^2 + b^2 - 2ab
;;
;;  3. a^2 - b^2 = (a + b) * (a - b)
;;
;;  4. a^2 + b^2 = (a + b)^2 - 2ab    oder:
;;     a^2 + b^2 = (a + b)^2 + 2ab
;;
;;  5. a^3 + b^3 = (a + b) * (a^2 - ab + b^2) = (a + b)^3 - 3ab * (a + b)
;;  6. a^3 - b^3 = (a - b) * (a^2 + ab + b^2) = (a - b)^3 + 3ab * (a - b)
;;
;;  7. 2 * (a^2 + b^2) = (a + b)^2 + (a - b)^2
;;
;;  8. (a + b)^2 - (a - b)^2 = 4ab
;;
;;  9. a^4 + b^4 = (a + b) * (a - b) * [(a + b)^2 - 2ab]
;;
;; 10. (a - b)^2 = (a + b)^2 - 4ab
;; 11. (a + b)^2 = (a - b)^2 + 4ab
;;
;; 12. a^4 + b^4 = [(a + b)^2 - 2ab]^2 - 2(ab)^2
;;
;; 13. (a + b + c)^2 = a^2 + b^2 + c^2 + 2ab + 2bc + 2ca
;; 14. (a + b - c)^2 = a^2 + b^2 + c^2 + 2ab - 2bc - 2ca
;; 15. (a - b - c)^2 = a^2 + b^2 + c^2 - 2ab + 2bc - 2ca
;;
;; 16. a^3 + b^3 + c^3 - 3abc = (a + b + c) * (a^2 + b^2 + c^2 - ab - bc - ca)
;;
;; 17. a^4 + a^2 * b^2 + b^4 = (a^2 + ab + b^2) * (a^2 - ab + b^2)
;; ----------------------------------------------------------------------------
;;
;; pq-Formel:
;;
;;  1. ax^2 + bx + c                = 0                   | -c
;;  2. ax^2 + bx                    = -c                  | dividiert: a
;;  3.  x^2 + (bx/a)                = -(c/a)              | quadratische Ergänzung
;;  4.  x^2 + (bx/a) + (b^2 / 4a^2) = -(c/a) + (b^2/4a^2) | wurzeln
;;  5. (x + b/2a)^2                 = -(c/a) + (b^2/4a^2)
;;  6. (x + b/2a)^2                 =  ((b^2 - 4ac) / 4a^2)
;;  7. +- sqrt((x + b/2a)^2)        =     +- sqrt((b^2 - 4ac) / 4a^2)
;;  8. x + (b/2a)                   =     +- sqrt((b^2 - 4ac) / 2a)
;;  9. x                            =     +- sqrt( b^2 - 4ac) / 2a - (b/2a)
;; 10. x                            = (-b +- sqrt( b^2 - 4ac) / 2a
;; ----------------------------------------------------------------------------
;; 2. Addition von Brüchen: gleiche Nenner (die Zahl unter dem Bruchstrich)
;;    müssen gebildet werden (erweitern):
;
;;   1       3       1 * 2       2      3       5
;;  ---  +  ---  =  -------  =  ---  + ---  =  ---
;;   2       4       2 * 2       4      4       4
;;
;; 3. Multiplikation mit ganzer Zahl und Bruch:
;;
;;       2       3 * 2       6
;;  3 * ---  =  -------  =  ---
;;       7       1 * 7       7
;;
;; 4. kürzen:
;;
;;   3 + x      3 + 1      4
;;  -------  =  -----  =  ---  =  4
;;     x            1      1
;;
;; 5. Potenzen:
;;
;;  (-x)^2  = -x * -x  = (minus * minus = +) = +x^2
;;
;; ACHTUNG:
;; Punktrechnung geht vor Strichrechnung:
;; Potenzierung zu erst:
;;
;;  -x^2  = -(x^2)
;;
;;  Beispiel:
;;  -3^2  = -(3^2)  = -(3 * 3) = -9
;;
;; 6. Terme:
;;
;;  5x = 5 *  x
;;       5 *  x       = y    | x = y + 2
;;
;;     = 5 * (y +  2) = y
;;     = 5 *  y + 10  = y    | : y
;;     =      5 + 10  = y
;;     =          15  = y
;;
;; 7. negative Variable mit negative Wertzuordnung:
;;
;;   x =   -6
;;
;;  -x = -(-6)
;;     =   +6
;;
;; 8.
;;
;;  -(x + y) = -x - y
;;
;;  Merke:
;;  (-1)*x + (-1)*y = -x + -y  (plus und minus = minus)
;;                  = -x -  y
;;
;; 9. Division durch Null (nicht möglich):
;;
;;  1 : 0  = n. d.  (nicht definiert)
;;
;; 10. Multiplikation mit Null (ist definiert mit 0):
;;
;;  1 * 0 = 0
;;
;; 11. Nenn mir die Zahl die Größer ist als minus 10!
;;
;;  x soll > -10
;;  x =  -9  <---- richtig !
;;  x = -12  <---- falsch
;;
;; 12. Schüler fragt: "Ich habe ein Problem mit dieser Gleichung:
;;
;;  5 * x + x .
;;
;;  das ist eine flasche Formulierung !!!
;;  denn es handelt sich hierbei um einen Term, da das Gleichheitszeichen fehlt
;;
;;  Richtig wäre, wenn eine Gleichung einen Ausdruck repräsentiert:
;;
;;  5 * x + x = 10
;;
;; 13. Wurzel ziehen:
;;     ACHTUNG: 2 Ergebnisse möglich !!! siehe -x^2
;;     ACHTUNG: Wurzel aus negativen Radikant ist nicht definiert !!!
;;
;; x^2 = 9   richtig:  | +- 2. Wurzel
;;
;; x1,2 = +- 2. Wurzel aus 9
;; x1,2 = +- 2. Wurzel aus x^2
;;
;; x1 = +3
;; x2 = -3
;;
;; Verständnisaufgabe (Wahrscheinlichkeit):
;; Frage: In einer Urne sind 5 Kugeln, darunter genau 3 rote.
;;        Wie groß ist die Wahrscheinlichkeit alle roten Kugeln bei
;;        dreimaligen Zíehen nacheinander und ohne Zurücklegen zufällig
;;        zu ziehen?
;; Lösung:
;; O  = rote Kugeln
;; L  = restliche Kugeln (grün):
;; 1Z = 1. Ziehung, etc...
;;
;;  1.Z         2.Z         3.Z.     4.Z. entfällt, da sich keine rote Kugel
;; -----       -----       ------         mehr in der Urne befindet:
;;   O  3:5
;;   O      =>   O  2:4
;;   O           O      =>   O  1:3
;;   L           L           L
;;   L           L           L
;;
;;  1. Wahrscheinlichkeit = 3:5
;;  2. Wahrscheinlichkeit = 2:4
;;  3. Wahrscheinlichkeit = 1:3
;;
;;  Alle 3 Wahrscheinlichkeiten multipliziert:
;;
;;  3 * 2 * 1        6         1
;; -----------  =  -----  =  ----  =  0,1
;;  5 * 4 * 3        60       10
;;
;; Lösung: Wahrscheinlichkeit P liegt bei 0,1 - also bei 10%
;; ----------------------------------------------------------------------------
;; elektrische Strom-Stärke := I
;; - gemessen in Ampere := A
;; Spannung := U
;; Widerstand := R
;;
;; I := U / R
;; U := R * I
;; R := U / I
;;
;; spezieller Widerstand p:
;; R :=  p * Leiterlänge l / Leiterquerschnitt q
;; R := (p * l) / q
;; --------------------------------------------------
;;
;; Def. elektische Stromstärke I
;; Q := Einheit Ladung (durch Fläche)
;; t := Messzeit
;;
;; =>  I := Q / t
;; =>  Q := I * t
;; =>  t := Q / I
;;
;; potenzielle Energie:
;; E_pot :=  Q * U
;;       =>  U = E / Q
;; ---------------------------------------------------
;;
;; Wechselspannung:
;; U_ss := Spitze-Spite Spannungswert ( + und - )
;; U_ss := 2 * U_s
;;
;; 2 * 220 Volt (Haushalt-Steckdose) = 440 Volt
;;
;; Effektivspannung := U oder U_eff := Mittelwert der
;; Leistung einer Gleichspannung
;; ---------------------------------------------------

;; ----------------------------------------------------
;; power ports ...
;;
;; Wechselspannung:
;; - Pole werden vertauscht
;; - keine feste Pole: - + -> - <- +
;;
;; Wechselspannung V (z. B.: 220 V)
;; Frequenz mit 50 Hz := Pole werden 50x / Sekunde vertauscht
;; Wechsel := Periode := 1/50 := 0,02 s := 20ms
;;
;; Perioden-Dauer t wird aus dem Kehrwert der Frequenz F berechnet.
;; - t = 1/F  (t in Sekunden s / F in Hz)
;;
;; -------------------------------------------------------------------
;;
;; Pythagoras Dreieck-Berechnung:
;; a^2 = b^2 + c^2
;; b^2 = a^2 + c^2
;; c^2 = a^2 + b^2
;; -------------------------------------------------------------------
(defun DreieckPythA (a b c) (return (+ (expt b 2) (expt c 2))))
(defun DreieckPythB (a b c) (return (+ (expt a 2) (expt c 2))))
(defun DreieckPythC (a b c) (return (+ (expt a 2) (expt c 2))))
;;
;; Kosinus-Satz:
;; a^2 = b^2 + c^2 - 2 * b * c * cos(alpha)
;; b^2 = a^2 + c^2 - 2 * a * c * cos(beta)
;; c^2 = a^2 + b^2 - 2 * a * b * cos(gamma)
;; -----------------------------------------------------------------------------------------------------
(defun cosinusAlpha (winkel b c) (return (- (+ (expt b 2) (expt c 2)) (* (* 2 (* b c)) (cos winkel)))))
(defun cosinusBeta  (winkel a c) (return (- (+ (expt a 2) (expt c 2)) (* (* 2 (* a c)) (cos winkel)))))
(defun cosinusGamma (winkel a b) (return (- (+ (expt a 2) (expt b 2)) (* (* 2 (* a b)) (cos winkel)))))
;; -----------------------------------------------------------------------------------------------------
;;
;; Sinus-Satz:
;;      a                b               c
;; ------------  =  -----------  =  ------------
;; sinus(alpha)     sinus(beta)     sinus(gamma)
;;
;;                    Höhe  h
;; sinus(gamma)     = -------
;;                       a
;;
;; sinus(gamma) * a = h
;;
;;                    Höhe  h
;; sinus(alpha)     = -------
;;                       c
;;
;; sinus(alpha) * c = h
;;
;; Umstellen:
;; h = sinus(gamma) * a    | dividiert durch a und c
;; h = sinus(alpha) * c    | dividiert durch a und c
;;
;; sinus(gamma)     sinus(alpha)
;; ------------     ------------
;;      c        =       a
;;
;; Entsprechend leitet man sich das Verhältnis für b und beta her.
;; ----------------------------------------------------------------------------

;; ----------------------------------------------------------------------------
;; Sexagesimal:
;; System in 60 Einheiten:
;;
;; Vollwinkel =  360 Grad          ; max: 360 Grad
;; 1 Jahr     =   12 Monate        ; max: 360 Tage
;; 1 Monat    =   30 Tage          ; nax:   4 Wochen
;; 1 Woche    =    7 Tage          ; max:   7 Tage
;; 1 Tag      =   24 Stunden       ; max:  23 Stunden
;; 1 Grad     =    1 Stunde        ; max:  59 Minuten
;; 1 Stunde   =   60 Minuten       ; max:  59 Minuten
;; 1 Minute   =   60 Sekunden      ; max:  59 Sekunden
;; 1 Sekunde  = 1000 Millisekunden ; max: 999 Millisekunden
;;
;; Erde:
;; 1 Breitensekunde => 31 Meter (m)
;; r Radius =  6400 km
;; U Umfang = 40212 km   (U = 2*Pi*r)
;;
;; 40212,000 km => 360 Grad    | : 360 Grad
;;   111,700 km =>   1 Grad    | : 60  Minuten
;;     1,862 km =>   1 Minute  | : 60  Sekunden
;;     0,031 km =>   1 Sekunde
;;
;; Beispiel:
;; alpha = 51,85 Grad:
;;
;; 1,00 Grad => 60 Minuten
;; 0,85 Grad =>  x Minuten     | * 60 Minuten
;;
;; x = 51 Minuten
;;
;; alpha = 51 Grad Komma 51 Minuten
;;
;;
;; 2h 23min 34s:    => 2, ... h
;;
;; 1 min => 60s
;; x min => 34s   | : 60s
;;
;; x =>  0,57min
;; x => 23,57min
;;
;; 1h => 60,00 min
;; x  => 23,57 min | : 60 min
;;
;; x  =>  0,393 h
;; x  =>  2,393 h
;; ----------------------------------------------------------------------------
(defun grad2minuten  (g) (return (/ g       60)))
(defun grad2sekunden (g) (return (/ g (* 60 60))))
;;
(defun minuten2grad  (m) (return (* m       60)))
(defun sekunden2grad (s) (return (* s (* 60 60))))

;; ----------------------------------------------------------------------------
;; RGB Farbwerte / Wellen-Länge ...
;; ----------------------------------------------------------------------------
(defclass RGBred   () ((value :initform (+ 255   0   0)) (waveLength :initform (cons 630 660))))
(defclass RGBgreen () ((value :initform (+   0 255   0)) (waveLength :initform (cons 550 570))))
(defclass RGByellow() ((value :initform (+ 255 255   0)) (waveLength :initform (cons 558 595))))
(defclass RGBblue  () ((value :initform (+   0   0 255)) (waveLength :initform (cons 430 505))))
(defclass RGBwhite () ((value :initform (+ 255 255 255)) (waveLength :initform (cons 450   0))))
(defclass RGBviolet() ((value :initform (+ 255   0 255)) (waveLength :initform (cons 850 940))))
;;
(defclass turkis() ((value :initform (+   0 255 255))))
(defclass black () ((value :initform (+   0   0   0))))


;; ----------------------------------------------------------------------------
;; misc tools ...
;; ----------------------------------------------------------------------------
;; round-to:  round a number to a specified decimal place;
;;            The optional parameter "what" can be one of:
;;            #'floor
;;            #'ceil
;;            #'truncate
;; Beispiel:
;;            ==> (round-to 1234.4567 0)
;;            1234
;;            ==> (round-to 1234.4567 1)
;;            2469/2
;;            ==> (float *)
;;            1234.5
;;            ==> (round-to -1234.4567 2 #'floor)
;;            -61723/50
;; ----------------------------------------------------------------------------
(defun round-to (number precision &optional (what #'round))
    (let ((div (expt 10 precision)))
         (/ (funcall what (* number div)) div)))

;; ----------------------------------------------------------------------------
;; AI-Gruppen:
;;
;; Sprache - für Sprachausgabe
;; Text    - für Textverstehen
;; ----------------------------------------------------------------------------
(defclass aiGruppeSpracheDeutsch ()
          ((wortDeutsch  :initarg :wortDeutsch)
           (wortEnglisch :initarg :wortEnglisch)))

(defclass aiGruppeSpracheEnglish () ((wortEnglish :initarg :wortEnglish)))

(defclass aiGruppe (aiGruppeSpracheDeutsch)
          ((gruppe :initarg :gruppe)))

;; ----------------------------------------------------------------------------
;; römische Nummern: 1 - 100
;;
(defclass romanNumbers ()
          ((latin :initarg :latin)
           (roman :initarg :roman)))
;;
(defvar romanNumber-1    (make-instance 'romanNumbers :latin 1   :roman "I"))
(defvar romanNumber-2    (make-instance 'romanNumbers :latin 2   :roman "II"))
(defvar romanNumber-3    (make-instance 'romanNumbers :latin 3   :roman "III"))
(defvar romanNumber-4    (make-instance 'romanNumbers :latin 4   :roman "IV"))
(defvar romanNumber-5    (make-instance 'romanNumbers :latin 5   :roman "V"))
(defvar romanNumber-6    (make-instance 'romanNumbers :latin 6   :roman "VI"))
(defvar romanNumber-7    (make-instance 'romanNumbers :latin 7   :roman "VII"))
(defvar romanNumber-8    (make-instance 'romanNumbers :latin 8   :roman "VIII"))
(defvar romanNumber-9    (make-instance 'romanNumbers :latin 9   :roman "IX"))
(defvar romanNumber-10   (make-instance 'romanNumbers :latin 10  :roman "X"))
;;
(defvar romanNumber-11   (make-instance 'romanNumbers :latin 11  :roman "XI"))
(defvar romanNumber-12   (make-instance 'romanNumbers :latin 12  :roman "XII"))
(defvar romanNumber-13   (make-instance 'romanNumbers :latin 13  :roman "XIII"))
(defvar romanNumber-14   (make-instance 'romanNumbers :latin 14  :roman "XIV"))
(defvar romanNumber-15   (make-instance 'romanNumbers :latin 15  :roman "XV"))
(defvar romanNumber-16   (make-instance 'romanNumbers :latin 16  :roman "XVI"))
(defvar romanNumber-17   (make-instance 'romanNumbers :latin 17  :roman "XVII"))
(defvar romanNumber-18   (make-instance 'romanNumbers :latin 18  :roman "XVIII"))
(defvar romanNumber-19   (make-instance 'romanNumbers :latin 19  :roman "XIX"))
(defvar romanNumber-20   (make-instance 'romanNumbers :latin 20  :roman "XX"))
;;
(defvar romanNumber-21   (make-instance 'romanNumbers :latin 21  :roman "XXI"))
(defvar romanNumber-22   (make-instance 'romanNumbers :latin 22  :roman "XXII"))
(defvar romanNumber-23   (make-instance 'romanNumbers :latin 23  :roman "XXIII"))
(defvar romanNumber-24   (make-instance 'romanNumbers :latin 24  :roman "XXIV"))
(defvar romanNumber-25   (make-instance 'romanNumbers :latin 25  :roman "XXV"))
(defvar romanNumber-26   (make-instance 'romanNumbers :latin 26  :roman "XXVI"))
(defvar romanNumber-27   (make-instance 'romanNumbers :latin 27  :roman "XXVII"))
(defvar romanNumber-28   (make-instance 'romanNumbers :latin 28  :roman "XXVIII"))
(defvar romanNumber-29   (make-instance 'romanNumbers :latin 29  :roman "XXIX"))
(defvar romanNumber-30   (make-instance 'romanNumbers :latin 30  :roman "XXX"))
;;
(defvar romanNumber-31   (make-instance 'romanNumbers :latin 31  :roman "XXXI"))
(defvar romanNumber-32   (make-instance 'romanNumbers :latin 32  :roman "XXXII"))
(defvar romanNumber-33   (make-instance 'romanNumbers :latin 33  :roman "XXXIII"))
(defvar romanNumber-34   (make-instance 'romanNumbers :latin 34  :roman "XXXIV"))
(defvar romanNumber-35   (make-instance 'romanNumbers :latin 35  :roman "XXXV"))
(defvar romanNumber-36   (make-instance 'romanNumbers :latin 36  :roman "XXXVI"))
(defvar romanNumber-37   (make-instance 'romanNumbers :latin 37  :roman "XXXVII"))
(defvar romanNumber-38   (make-instance 'romanNumbers :latin 38  :roman "XXXVIII"))
(defvar romanNumber-39   (make-instance 'romanNumbers :latin 39  :roman "XXXIX"))
(defvar romanNumber-40   (make-instance 'romanNumbers :latin 40  :roman "XL"))
;;
(defvar romanNumber-41   (make-instance 'romanNumbers :latin 41  :roman "XLI"))
(defvar romanNumber-42   (make-instance 'romanNumbers :latin 42  :roman "XLII"))
(defvar romanNumber-43   (make-instance 'romanNumbers :latin 43  :roman "XLIIII"))
(defvar romanNumber-44   (make-instance 'romanNumbers :latin 44  :roman "XLIV"))
(defvar romanNumber-45   (make-instance 'romanNumbers :latin 45  :roman "XLV"))
(defvar romanNumber-46   (make-instance 'romanNumbers :latin 46  :roman "XLVI"))
(defvar romanNumber-47   (make-instance 'romanNumbers :latin 47  :roman "XLVII"))
(defvar romanNumber-48   (make-instance 'romanNumbers :latin 48  :roman "XLVIII"))
(defvar romanNumber-49   (make-instance 'romanNumbers :latin 49  :roman "XLIX"))
(defvar romanNumber-50   (make-instance 'romanNumbers :latin 50  :roman "L"))
;;
(defvar romanNumber-51   (make-instance 'romanNumbers :latin 51  :roman "LI"))
(defvar romanNumber-52   (make-instance 'romanNumbers :latin 52  :roman "LII"))
(defvar romanNumber-53   (make-instance 'romanNumbers :latin 53  :roman "LIII"))
(defvar romanNumber-54   (make-instance 'romanNumbers :latin 54  :roman "LIV"))
(defvar romanNumber-55   (make-instance 'romanNumbers :latin 55  :roman "LV"))
(defvar romanNumber-56   (make-instance 'romanNumbers :latin 56  :roman "LVI"))
(defvar romanNumber-57   (make-instance 'romanNumbers :latin 57  :roman "LVII"))
(defvar romanNumber-58   (make-instance 'romanNumbers :latin 58  :roman "LVIII"))
(defvar romanNumber-59   (make-instance 'romanNumbers :latin 59  :roman "LIX"))
(defvar romanNumber-60   (make-instance 'romanNumbers :latin 60  :roman "LX"))
;;
(defvar romanNumber-61   (make-instance 'romanNumbers :latin 61  :roman "LXI"))
(defvar romanNumber-62   (make-instance 'romanNumbers :latin 62  :roman "LXII"))
(defvar romanNumber-63   (make-instance 'romanNumbers :latin 63  :roman "LXIII"))
(defvar romanNumber-64   (make-instance 'romanNumbers :latin 64  :roman "LXIV"))
(defvar romanNumber-65   (make-instance 'romanNumbers :latin 65  :roman "LXV"))
(defvar romanNumber-66   (make-instance 'romanNumbers :latin 66  :roman "LXVI"))
(defvar romanNumber-67   (make-instance 'romanNumbers :latin 67  :roman "LXVII"))
(defvar romanNumber-68   (make-instance 'romanNumbers :latin 68  :roman "LXVIII"))
(defvar romanNumber-69   (make-instance 'romanNumbers :latin 69  :roman "LXIX"))
(defvar romanNumber-70   (make-instance 'romanNumbers :latin 70  :roman "LXX"))
;;
(defvar romanNumber-71   (make-instance 'romanNumbers :latin 71   :roman "LXXI"))
(defvar romanNumber-72   (make-instance 'romanNumbers :latin 72   :roman "LXXII"))
(defvar romanNumber-73   (make-instance 'romanNumbers :latin 73   :roman "LXXIII"))
(defvar romanNumber-74   (make-instance 'romanNumbers :latin 74   :roman "LXXIV"))
(defvar romanNumber-75   (make-instance 'romanNumbers :latin 75   :roman "LXXV"))
(defvar romanNumber-76   (make-instance 'romanNumbers :latin 76   :roman "LXXVI"))
(defvar romanNumber-77   (make-instance 'romanNumbers :latin 77   :roman "LXXVII"))
(defvar romanNumber-78   (make-instance 'romanNumbers :latin 78   :roman "LXXVIII"))
(defvar romanNumber-79   (make-instance 'romanNumbers :latin 79   :roman "LXXIX"))
(defvar romanNumber-80   (make-instance 'romanNumbers :latin 80   :roman "LXXX"))
;;
(defvar romanNumber-81   (make-instance 'romanNumbers :latin 81   :roman "LXXXI"))
(defvar romanNumber-82   (make-instance 'romanNumbers :latin 82   :roman "LXXXII"))
(defvar romanNumber-83   (make-instance 'romanNumbers :latin 83   :roman "LXXXIII"))
(defvar romanNumber-84   (make-instance 'romanNumbers :latin 84   :roman "LXXXIV"))
(defvar romanNumber-85   (make-instance 'romanNumbers :latin 85   :roman "LXXXV"))
(defvar romanNumber-86   (make-instance 'romanNumbers :latin 86   :roman "LXXXVI"))
(defvar romanNumber-87   (make-instance 'romanNumbers :latin 87   :roman "LXXXVII"))
(defvar romanNumber-88   (make-instance 'romanNumbers :latin 88   :roman "LXXXVIII"))
(defvar romanNumber-80   (make-instance 'romanNumbers :latin 89   :roman "LXXXIX"))
(defvar romanNumber-90   (make-instance 'romanNumbers :latin 90   :roman "XC"))
;;
(defvar romanNumber-91   (make-instance 'romanNumbers :latin 91   :roman "XCI"))
(defvar romanNumber-92   (make-instance 'romanNumbers :latin 92   :roman "XCII"))
(defvar romanNumber-93   (make-instance 'romanNumbers :latin 93   :roman "XCIII"))
(defvar romanNumber-94   (make-instance 'romanNumbers :latin 94   :roman "XCIV"))
(defvar romanNumber-95   (make-instance 'romanNumbers :latin 95   :roman "XCV"))
(defvar romanNumber-96   (make-instance 'romanNumbers :latin 96   :roman "XCVI"))
(defvar romanNumber-97   (make-instance 'romanNumbers :latin 97   :roman "XCVII"))
(defvar romanNumber-98   (make-instance 'romanNumbers :latin 98   :roman "XCVIII"))
(defvar romanNumber-99   (make-instance 'romanNumbers :latin 99   :roman "XCIX"))
(defvar romanNumber-100  (make-instance 'romanNumbers :latin 100  :roman "C"))
;;
(defvar romanNumber-200  (make-instance 'romanNumbers :latin 200  :roman "CC"))
(defvar romanNumber-300  (make-instance 'romanNumbers :latin 300  :roman "CCC"))
(defvar romanNumber-400  (make-instance 'romanNumbers :latin 400  :roman "CD"))
(defvar romanNumber-500  (make-instance 'romanNumbers :latin 500  :roman "D"))
(defvar romanNumber-600  (make-instance 'romanNumbers :latin 600  :roman "DC"))
(defvar romanNumber-700  (make-instance 'romanNumbers :latin 700  :roman "DCC"))
(defvar romanNumber-800  (make-instance 'romanNumbers :latin 800  :roman "DCCC"))
(defvar romanNumber-900  (make-instance 'romanNumbers :latin 900  :roman "CM"))
(defvar romanNumber-1000 (make-instance 'romanNumbers :latin 1000 :roman "M"))

;; ----------------------------------------------------------------------------
;; Zoll to cm
;;
;; 1 km    = 1000 m  Meter
;; 1 m     =  100 cm Zentimeter
;; 1 cm    =   10 mm Millimeter
;; 1 Zoll  =   10 mm
;; 1 mm    =    1 nm nano-Meter
;;
;; 1 Zoll  => 2.54   cm
;; 1 cm    => 0.3938 Zoll
;; ----------------------------------------------------------------------------
(defclass inch2cm ()
          ((inch :initarg :inch)
           (cm   :initarg :cm)))
(defclass feet2m  ()
          ((feet  :initarg :feet)
           (meter :initarg :meter)))
;;
(defvar inch2cm-001  (make-instance 'inch2cm :inch 0.001 :cm 0.025))  (defvar feet2m-001  (make-instance 'feet2m :feet 0.01  :meter   0.003))
;;
(defvar inch2cm-01   (make-instance 'inch2cm :inch 0.1  :cm  0.254))  (defvar feet2m-01   (make-instance 'feet2m :feet 0.1   :meter   0.030))
(defvar inch2cm-02   (make-instance 'inch2cm :inch 0.2  :cm  0.508))  (defvar feet2m-02   (make-instance 'feet2m :feet 0.2   :meter   0.061))
(defvar inch2cm-03   (make-instance 'inch2cm :inch 0.3  :cm  0.762))  (defvar feet2m-03   (make-instance 'feet2m :feet 0.3   :meter   0.091))
(defvar inch2cm-04   (make-instance 'inch2cm :inch 0.4  :cm  1.016))  (defvar feet2m-04   (make-instance 'feet2m :feet 0.4   :meter   0.122))
(defvar inch2cm-05   (make-instance 'inch2cm :inch 0.5  :cm  1.270))  (defvar feet2m-05   (make-instance 'feet2m :feet 0.5   :meter   0.152))
(defvar inch2cm-06   (make-instance 'inch2cm :inch 0.6  :cm  1.524))  (defvar feet2m-06   (make-instance 'feet2m :feet 0.6   :meter   0.183))
(defvar inch2cm-07   (make-instance 'inch2cm :inch 0.7  :cm  1.778))  (defvar feet2m-07   (make-instance 'feet2m :feet 0.7   :meter   0.213))
(defvar inch2cm-08   (make-instance 'inch2cm :inch 0.8  :cm  2.032))  (defvar feet2m-08   (make-instance 'feet2m :feet 0.8   :meter   0.244))
(defvar inch2cm-09   (make-instance 'inch2cm :inch 0.9  :cm  2.286))  (defvar feet2m-09   (make-instance 'feet2m :feet 0.9   :meter   0.274))
;;
(defvar inch2cm-1    (make-instance 'inch2cm :inch 1    :cm   2.54))  (defvar feet2m-1    (make-instance 'feet2m :feet 1     :meter   0.30))
(defvar inch2cm-2    (make-instance 'inch2cm :inch 2    :cm   5.08))  (defvar feet2m-2    (make-instance 'feet2m :feet 2     :meter   0.61))
(defvar inch2cm-3    (make-instance 'inch2cm :inch 3    :cm   7.62))  (defvar feet2m-3    (make-instance 'feet2m :feet 3     :meter   0.91))
(defvar inch2cm-4    (make-instance 'inch2cm :inch 4    :cm  10.16))  (defvar feet2m-4    (make-instance 'feet2m :feet 4     :meter   1.22))
(defvar inch2cm-5    (make-instance 'inch2cm :inch 5    :cm  12.70))  (defvar feet2m-5    (make-instance 'feet2m :feet 5     :meter   1.52))
(defvar inch2cm-6    (make-instance 'inch2cm :inch 6    :cm  15.24))  (defvar feet2m-6    (make-instance 'feet2m :feet 6     :meter   1.83))
(defvar inch2cm-7    (make-instance 'inch2cm :inch 7    :cm  17.88))  (defvar feet2m-7    (make-instance 'feet2m :feet 7     :meter   2.13))
(defvar inch2cm-8    (make-instance 'inch2cm :inch 8    :cm  20.32))  (defvar feet2m-8    (make-instance 'feet2m :feet 8     :meter   2.44))
(defvar inch2cm-9    (make-instance 'inch2cm :inch 9    :cm  22.86))  (defvar feet2m-9    (make-instance 'feet2m :feet 9     :meter   2.74))
;;
(defvar inch2cm-10   (make-instance 'inch2cm :inch 10   :cm  25.4))   (defvar feet2m-10   (make-instance 'feet2m :feet 10    :meter   3.05))
(defvar inch2cm-20   (make-instance 'inch2cm :inch 20   :cm  50.8))   (defvar feet2m-20   (make-instance 'feet2m :feet 20    :meter   6.10))
(defvar inch2cm-30   (make-instance 'inch2cm :inch 30   :cm  76.2))   (defvar feet2m-30   (make-instance 'feet2m :feet 30    :meter   9.14))
(defvar inch2cm-40   (make-instance 'inch2cm :inch 40   :cm 101.6))   (defvar feet2m-40   (make-instance 'feet2m :feet 40    :meter  12.19))
(defvar inch2cm-50   (make-instance 'inch2cm :inch 50   :cm 127.0))   (defvar feet2m-50   (make-instance 'feet2m :feet 50    :meter  15.24))
(defvar inch2cm-60   (make-instance 'inch2cm :inch 60   :cm 152.4))   (defvar feet2m-60   (make-instance 'feet2m :feet 60    :meter  18.29))
(defvar inch2cm-70   (make-instance 'inch2cm :inch 70   :cm 178.8))   (defvar feet2m-70   (make-instance 'feet2m :feet 70    :meter  21.34))
(defvar inch2cm-80   (make-instance 'inch2cm :inch 80   :cm 203.2))   (defvar feet2m-80   (make-instance 'feet2m :feet 80    :meter  24.38))
(defvar inch2cm-90   (make-instance 'inch2cm :inch 90   :cm 228.6))   (defvar feet2m-90   (make-instance 'feet2m :feet 90    :meter  27.43))
;;
(defvar inch2cm-100  (make-instance 'inch2cm :inch 100  :cm  254))    (defvar feet2m-100   (make-instance 'feet2m :feet 100  :meter   30.5))
(defvar inch2cm-200  (make-instance 'inch2cm :inch 200  :cm  508))    (defvar feet2m-200   (make-instance 'feet2m :feet 200  :meter   61.1))
(defvar inch2cm-300  (make-instance 'inch2cm :inch 300  :cm  762))    (defvar feet2m-300   (make-instance 'feet2m :feet 300  :meter   91.4))
(defvar inch2cm-400  (make-instance 'inch2cm :inch 400  :cm 1016))    (defvar feet2m-400   (make-instance 'feet2m :feet 400  :meter  121.9))
(defvar inch2cm-500  (make-instance 'inch2cm :inch 500  :cm 1270))    (defvar feet2m-500   (make-instance 'feet2m :feet 500  :meter  152.4))
(defvar inch2cm-600  (make-instance 'inch2cm :inch 600  :cm 1524))    (defvar feet2m-600   (make-instance 'feet2m :feet 600  :meter  182.9))
(defvar inch2cm-700  (make-instance 'inch2cm :inch 700  :cm 1788))    (defvar feet2m-700   (make-instance 'feet2m :feet 700  :meter  213.4))
(defvar inch2cm-800  (make-instance 'inch2cm :inch 800  :cm 2032))    (defvar feet2m-800   (make-instance 'feet2m :feet 800  :meter  243.8))
(defvar inch2cm-900  (make-instance 'inch2cm :inch 900  :cm 2286))    (defvar feet2m-900   (make-instance 'feet2m :feet 900  :meter  274.3))
;;
(defvar inch2cm-1000 (make-instance 'inch2cm :inch 1000 :cm 2540))    (defvar feet2m-1000  (make-instance 'feet2m :feet 0.1  :meter  304.8))
(defvar inch2cm-2000 (make-instance 'inch2cm :inch 2000 :cm 5080))    (defvar feet2m-2000  (make-instance 'feet2m :feet 0.1  :meter  609.6))
;;
;; ----------------------------------------------------------------------------
(defclass cm2inch ()
          ((cm   :initarg :cm)
           (inch :initarg :inch)))
;;
(defvar cm2inch-001 (make-instance 'cm2inch :cm 0.01 :inch 0.004))
;;
(defvar cm2inch-01 (make-instance 'cm2inch :cm 0.1   :inch 0.039))
(defvar cm2inch-02 (make-instance 'cm2inch :cm 0.2   :inch 0.079))
(defvar cm2inch-03 (make-instance 'cm2inch :cm 0.3   :inch 0.118))
(defvar cm2inch-04 (make-instance 'cm2inch :cm 0.4   :inch 0.157))
(defvar cm2inch-05 (make-instance 'cm2inch :cm 0.5   :inch 0.197))
(defvar cm2inch-06 (make-instance 'cm2inch :cm 0.6   :inch 0.236))
(defvar cm2inch-07 (make-instance 'cm2inch :cm 0.7   :inch 0.276))
(defvar cm2inch-08 (make-instance 'cm2inch :cm 0.8   :inch 0.315))
(defvar cm2inch-09 (make-instance 'cm2inch :cm 0.9   :inch 0.354))
;;
(defvar cm2inch-1   (make-instance 'cm2inch :cm 1    :inch   0.39))
(defvar cm2inch-2   (make-instance 'cm2inch :cm 2    :inch   0.79))
(defvar cm2inch-3   (make-instance 'cm2inch :cm 3    :inch   1.18))
(defvar cm2inch-4   (make-instance 'cm2inch :cm 4    :inch   1.57))
(defvar cm2inch-5   (make-instance 'cm2inch :cm 5    :inch   1.97))
(defvar cm2inch-6   (make-instance 'cm2inch :cm 6    :inch   2.36))
(defvar cm2inch-7   (make-instance 'cm2inch :cm 7    :inch   2.76))
(defvar cm2inch-8   (make-instance 'cm2inch :cm 8    :inch   3.15))
(defvar cm2inch-9   (make-instance 'cm2inch :cm 9    :inch   3.54))
;;
(defvar cm2inch-10  (make-instance 'cm2inch :cm 10   :inch   3.94))
(defvar cm2inch-20  (make-instance 'cm2inch :cm 20   :inch   7.87))
(defvar cm2inch-30  (make-instance 'cm2inch :cm 30   :inch  11.81))
(defvar cm2inch-40  (make-instance 'cm2inch :cm 40   :inch  15.75))
(defvar cm2inch-50  (make-instance 'cm2inch :cm 50   :inch  19.69))
(defvar cm2inch-60  (make-instance 'cm2inch :cm 60   :inch  23.62))
(defvar cm2inch-70  (make-instance 'cm2inch :cm 70   :inch  27.56))
(defvar cm2inch-80  (make-instance 'cm2inch :cm 80   :inch  31.50))
(defvar cm2inch-90  (make-instance 'cm2inch :cm 90   :inch  35.43))
;;
(defvar cm2inch-100 (make-instance 'cm2inch :cm 100  :inch  39.4))
(defvar cm2inch-200 (make-instance 'cm2inch :cm 200  :inch  78.7))
(defvar cm2inch-300 (make-instance 'cm2inch :cm 300  :inch 118.1))
(defvar cm2inch-400 (make-instance 'cm2inch :cm 400  :inch 157.5))
(defvar cm2inch-500 (make-instance 'cm2inch :cm 500  :inch 196.7))
(defvar cm2inch-600 (make-instance 'cm2inch :cm 600  :inch 236.2))
(defvar cm2inch-700 (make-instance 'cm2inch :cm 700  :inch 275.6))
(defvar cm2inch-800 (make-instance 'cm2inch :cm 800  :inch 315.0))
(defvar cm2inch-900 (make-instance 'cm2inch :cm 900  :inch 354.3))
;;
(defvar cm2inch-900 (make-instance 'cm2inch :cm 1000 :inch 0.004))
(defvar cm2inch-900 (make-instance 'cm2inch :cm 2000 :inch 0.004))
;; ----------------------------------------------------------------------------
(defclass mm2inch ()
          ((mm   :initarg :mm)          ; milimeters
           (inch :initarg :inch)        ; inch '' zoll
           (flag :initarg :flag)))      ; over := 2 / under := 1  ?
;;
(defvar mm2inch-1  (make-instance 'mm2inch :mm 1  :inch (/  1  2) :flag 0))
(defvar mm2inch-2  (make-instance 'mm2inch :mm 2  :inch (/  1 16) :flag 0))
(defvar mm2inch-3  (make-instance 'mm2inch :mm 3  :inch (/  3 32) :flag 0))
(defvar mm2inch-4  (make-instance 'mm2inch :mm 4  :inch (/  1  8) :flag 0))
(defvar mm2inch-5  (make-instance 'mm2inch :mm 5  :inch (/  3 16) :flag 0))
(defvar mm2inch-6  (make-instance 'mm2inch :mm 6  :inch (/  1  4) :flag 1))
(defvar mm2inch-7  (make-instance 'mm2inch :mm 7  :inch (/  1  4) :flag 2))
(defvar mm2inch-8  (make-instance 'mm2inch :mm 8  :inch (/  5 16) :flag 0))
(defvar mm2inch-9  (make-instance 'mm2inch :mm 9  :inch (/  3  8) :flag 1))
(defvar mm2inch-10 (make-instance 'mm2inch :mm 10 :inch (/  3  8) :flag 2))
(defvar mm2inch-11 (make-instance 'mm2inch :mm 11 :inch (/  7 16) :flag 0))
(defvar mm2inch-12 (make-instance 'mm2inch :mm 12 :inch (/  1  2) :flag 1))
(defvar mm2inch-13 (make-instance 'mm2inch :mm 13 :inch (/  1  2) :flag 2))
(defvar mm2inch-14 (make-instance 'mm2inch :mm 14 :inch (/  9 16) :flag 0))
(defvar mm2inch-15 (make-instance 'mm2inch :mm 15 :inch (/  5  8) :flag 1))
(defvar mm2inch-16 (make-instance 'mm2inch :mm 16 :inch (/  5  8) :flag 0))
(defvar mm2inch-17 (make-instance 'mm2inch :mm 17 :inch (/ 11 16) :flag 1))
(defvar mm2inch-18 (make-instance 'mm2inch :mm 18 :inch (/  3  4) :flag 1))
(defvar mm2inch-19 (make-instance 'mm2inch :mm 19 :inch (/  3  4) :flag 2))
(defvar mm2inch-20 (make-instance 'mm2inch :mm 20 :inch (/ 13 16) :flag 1))
(defvar mm2inch-21 (make-instance 'mm2inch :mm 21 :inch (/ 13 16) :flag 2))
(defvar mm2inch-22 (make-instance 'mm2inch :mm 22 :inch (/  7  8) :flag 1))
(defvar mm2inch-23 (make-instance 'mm2inch :mm 23 :inch (/  7  8) :flag 2))
(defvar mm2inch-24 (make-instance 'mm2inch :mm 24 :inch (/ 15 16) :flag 0))
(defvar mm2inch-25 (make-instance 'mm2inch :mm 25 :inch (/  1  1) :flag 0))


;; ----------------------------------------------------------------------------
;; Sprache: Zahlen
;;
(defclass speakNumber (aiGruppe)
          ((zahlnum :initarg :zahlnum)
           (zahlstr :initarg :zahlstr)))
;;
(defvar speakNumber-0  (make-instance 'speakNumber :zahlnum 0  :zahlstr "null"))
(defvar speakNumber-1  (make-instance 'speakNumber :zahlnum 1  :zahlstr "eins"))
(defvar speakNumber-2  (make-instance 'speakNumber :zahlnum 2  :zahlstr "zwei"))
(defvar speakNumber-3  (make-instance 'speakNumber :zahlnum 3  :zahlstr "drei"))
(defvar speakNumber-4  (make-instance 'speakNumber :zahlnum 4  :zahlstr "vier"))
(defvar speakNumber-5  (make-instance 'speakNumber :zahlnum 5  :zahlstr "fünf"))
(defvar speakNumber-6  (make-instance 'speakNumber :zahlnum 6  :zahlstr "sechs"))
(defvar speakNumber-7  (make-instance 'speakNumber :zahlnum 7  :zahlstr "sieben"))
(defvar speakNumber-8  (make-instance 'speakNumber :zahlnum 8  :zahlstr "acht"))
(defvar speakNumber-9  (make-instance 'speakNumber :zahlnum 9  :zahlstr "neun"))
(defvar speakNumber-10 (make-instance 'speakNumber :zahlnum 10 :zahlstr "zehn"))
;;
(defvar speakNumber-11 (make-instance 'speakNumber :zahlnum 11 :zahlstr "elf"))
(defvar speakNumber-12 (make-instance 'speakNumber :zahlnum 12 :zahlstr "zwölf"))
(defvar speakNumber-13 (make-instance 'speakNumber :zahlnum 13 :zahlstr "dreizehn"))
(defvar speakNumber-14 (make-instance 'speakNumber :zahlnum 14 :zahlstr "vierzehn"))
(defvar speakNumber-15 (make-instance 'speakNumber :zahlnum 15 :zahlstr "fünfzehn"))
(defvar speakNumber-16 (make-instance 'speakNumber :zahlnum 16 :zahlstr "sechzehn"))
(defvar speakNumber-17 (make-instance 'speakNumber :zahlnum 17 :zahlstr "siebzehn"))
(defvar speakNumber-18 (make-instance 'speakNumber :zahlnum 18 :zahlstr "achtzehn"))
(defvar speakNumber-19 (make-instance 'speakNumber :zahlnum 19 :zahlstr "neunzehn"))
(defvar speakNumber-20 (make-instance 'speakNumber :zahlnum 20 :zahlstr "zwanzig"))
;;
(defvar speakNumber-21 (make-instance 'speakNumber :zahlnum 21 :zahlstr "einundzwanzig"))
(defvar speakNumber-22 (make-instance 'speakNumber :zahlnum 22 :zahlstr "zweiundzwanzig"))
(defvar speakNumber-23 (make-instance 'speakNumber :zahlnum 23 :zahlstr "dreiundzwanzig"))
(defvar speakNumber-24 (make-instance 'speakNumber :zahlnum 24 :zahlstr "vierundzwanzig"))
(defvar speakNumber-25 (make-instance 'speakNumber :zahlnum 25 :zahlstr "fünfundzwanzig"))
(defvar speakNumber-26 (make-instance 'speakNumber :zahlnum 26 :zahlstr "sechsundzwanzig"))
(defvar speakNumber-27 (make-instance 'speakNumber :zahlnum 27 :zahlstr "siebenundzwanzig"))
(defvar speakNumber-28 (make-instance 'speakNumber :zahlnum 28 :zahlstr "achtundzwanzig"))
(defvar speakNumber-29 (make-instance 'speakNumber :zahlnum 29 :zahlstr "neunundzwanzig"))
(defvar speakNumber-30 (make-instance 'speakNumber :zahlnum 30 :zahlstr "dreizig"))
;;
(defvar speakNumber-31 (make-instance 'speakNumber :zahlnum 31 :zahlstr "einunddreizig"))
(defvar speakNumber-32 (make-instance 'speakNumber :zahlnum 32 :zahlstr "zweiunddreizig"))
(defvar speakNumber-33 (make-instance 'speakNumber :zahlnum 33 :zahlstr "dreiunddreizig"))
(defvar speakNumber-34 (make-instance 'speakNumber :zahlnum 34 :zahlstr "vierunddreizig"))
(defvar speakNumber-35 (make-instance 'speakNumber :zahlnum 35 :zahlstr "fünfunddreizig"))
(defvar speakNumber-36 (make-instance 'speakNumber :zahlnum 36 :zahlstr "sechsunddreizig"))
(defvar speakNumber-37 (make-instance 'speakNumber :zahlnum 37 :zahlstr "siebenunddreizig"))
(defvar speakNumber-38 (make-instance 'speakNumber :zahlnum 38 :zahlstr "achtunddreizig"))
(defvar speakNumber-39 (make-instance 'speakNumber :zahlnum 39 :zahlstr "neununddreizig"))
(defvar speakNumber-40 (make-instance 'speakNumber :zahlnum 40 :zahlstr "vierzig"))
;;
(defvar speakNumber-41 (make-instance 'speakNumber :zahlnum 41 :zahlstr "einundvierzig"))
(defvar speakNumber-42 (make-instance 'speakNumber :zahlnum 42 :zahlstr "zweiundvierzig"))
(defvar speakNumber-43 (make-instance 'speakNumber :zahlnum 43 :zahlstr "dreiundvierzig"))
(defvar speakNumber-44 (make-instance 'speakNumber :zahlnum 44 :zahlstr "vierundvierzig"))
(defvar speakNumber-45 (make-instance 'speakNumber :zahlnum 45 :zahlstr "fünfundvierzig"))
(defvar speakNumber-46 (make-instance 'speakNumber :zahlnum 46 :zahlstr "sechsundvierzig"))
(defvar speakNumber-47 (make-instance 'speakNumber :zahlnum 47 :zahlstr "siebenundvierzig"))
(defvar speakNumber-48 (make-instance 'speakNumber :zahlnum 48 :zahlstr "achtundvierzig"))
(defvar speakNumber-49 (make-instance 'speakNumber :zahlnum 49 :zahlstr "neunundvierzig"))
(defvar speakNumber-50 (make-instance 'speakNumber :zahlnum 50 :zahlstr "fünfzig"))
;;
(defvar speakNumber-51 (make-instance 'speakNumber :zahlnum 51 :zahlstr "einundfünfzig"))
(defvar speakNumber-52 (make-instance 'speakNumber :zahlnum 51 :zahlstr "zweiundfünfzig"))
(defvar speakNumber-53 (make-instance 'speakNumber :zahlnum 51 :zahlstr "dreiundfünfzig"))
(defvar speakNumber-54 (make-instance 'speakNumber :zahlnum 51 :zahlstr "vierundfünfzig"))
(defvar speakNumber-55 (make-instance 'speakNumber :zahlnum 51 :zahlstr "fünfundfünfzig"))
(defvar speakNumber-56 (make-instance 'speakNumber :zahlnum 51 :zahlstr "sechsundfünfzig"))
(defvar speakNumber-57 (make-instance 'speakNumber :zahlnum 51 :zahlstr "siebenundfünfzig"))
(defvar speakNumber-58 (make-instance 'speakNumber :zahlnum 51 :zahlstr "achtundfünfzig"))
(defvar speakNumber-59 (make-instance 'speakNumber :zahlnum 51 :zahlstr "neunundfünfzig"))
(defvar speakNumber-60 (make-instance 'speakNumber :zahlnum 60 :zahlstr "sechzig"))
;;
(defvar speakNumber-61 (make-instance 'speakNumber :zahlnum 61 :zahlstr "einundsechzig"))
(defvar speakNumber-62 (make-instance 'speakNumber :zahlnum 62 :zahlstr "zweiundsechzig"))
(defvar speakNumber-63 (make-instance 'speakNumber :zahlnum 63 :zahlstr "dreiundsechzig"))
(defvar speakNumber-64 (make-instance 'speakNumber :zahlnum 64 :zahlstr "vierundsechzig"))
(defvar speakNumber-65 (make-instance 'speakNumber :zahlnum 65 :zahlstr "fünfundsechzig"))
(defvar speakNumber-66 (make-instance 'speakNumber :zahlnum 66 :zahlstr "sechsundsechzig"))
(defvar speakNumber-67 (make-instance 'speakNumber :zahlnum 67 :zahlstr "siebenundsechzig"))
(defvar speakNumber-68 (make-instance 'speakNumber :zahlnum 68 :zahlstr "achtundsechzig"))
(defvar speakNumber-69 (make-instance 'speakNumber :zahlnum 69 :zahlstr "neunundsechzig"))
(defvar speakNumber-70 (make-instance 'speakNumber :zahlnum 70 :zahlstr "siebzig"))
;;
(defvar speakNumber-71 (make-instance 'speakNumber :zahlnum 71 :zahlstr "einundsiebzig"))
(defvar speakNumber-72 (make-instance 'speakNumber :zahlnum 72 :zahlstr "zweiundsiebzig"))
(defvar speakNumber-73 (make-instance 'speakNumber :zahlnum 73 :zahlstr "dreiundsiebzig"))
(defvar speakNumber-74 (make-instance 'speakNumber :zahlnum 74 :zahlstr "vierundsiebzig"))
(defvar speakNumber-75 (make-instance 'speakNumber :zahlnum 75 :zahlstr "fünfundsiebzig"))
(defvar speakNumber-76 (make-instance 'speakNumber :zahlnum 76 :zahlstr "sechsundsiebzig"))
(defvar speakNumber-77 (make-instance 'speakNumber :zahlnum 77 :zahlstr "siebenundsiebzig"))
(defvar speakNumber-78 (make-instance 'speakNumber :zahlnum 78 :zahlstr "achtundsiebzig"))
(defvar speakNumber-79 (make-instance 'speakNumber :zahlnum 79 :zahlstr "neunundsiebzig"))
(defvar speakNumber-80 (make-instance 'speakNumber :zahlnum 80 :zahlstr "achtzig"))
;;
(defvar speakNumber-81 (make-instance 'speakNumber :zahlnum 81 :zahlstr "einundachtzig"))
(defvar speakNumber-82 (make-instance 'speakNumber :zahlnum 82 :zahlstr "zweiundachtzig"))
(defvar speakNumber-83 (make-instance 'speakNumber :zahlnum 83 :zahlstr "dreiundachtzig"))
(defvar speakNumber-84 (make-instance 'speakNumber :zahlnum 84 :zahlstr "vierundachtzig"))
(defvar speakNumber-85 (make-instance 'speakNumber :zahlnum 85 :zahlstr "fünfundachtzig"))
(defvar speakNumber-86 (make-instance 'speakNumber :zahlnum 86 :zahlstr "sechsundachtzig"))
(defvar speakNumber-87 (make-instance 'speakNumber :zahlnum 87 :zahlstr "siebenundachtzig"))
(defvar speakNumber-88 (make-instance 'speakNumber :zahlnum 88 :zahlstr "achtundachtzig"))
(defvar speakNumber-89 (make-instance 'speakNumber :zahlnum 89 :zahlstr "neunundachtzig"))
(defvar speakNumber-90 (make-instance 'speakNumber :zahlnum 90 :zahlstr "neunzig"))
;;
(defvar speakNumber-91  (make-instance 'speakNumber :zahlnum 91 :zahlstr "einundneunzig"))
(defvar speakNumber-92  (make-instance 'speakNumber :zahlnum 92 :zahlstr "zweiundneunzig"))
(defvar speakNumber-93  (make-instance 'speakNumber :zahlnum 93 :zahlstr "dreiundneunzig"))
(defvar speakNumber-94  (make-instance 'speakNumber :zahlnum 94 :zahlstr "vierundneunzig"))
(defvar speakNumber-95  (make-instance 'speakNumber :zahlnum 95 :zahlstr "fünfundneunzig"))
(defvar speakNumber-96  (make-instance 'speakNumber :zahlnum 96 :zahlstr "sechsundneunzig"))
(defvar speakNumber-97  (make-instance 'speakNumber :zahlnum 97 :zahlstr "siebenundneunzig"))
(defvar speakNumber-98  (make-instance 'speakNumber :zahlnum 98 :zahlstr "achtundneunzig"))
(defvar speakNumber-99  (make-instance 'speakNumber :zahlnum 99 :zahlstr "neunundneunzig"))
;;
(defvar speakNumber-100     (make-instance 'speakNumber :zahlnum 100     :zahlstr "einhundert"))
(defvar speakNumber-1000    (make-instance 'speakNumber :zahlnum 1000    :zahlstr "eintausend"))
(defvar speakNumber-10000   (make-instance 'speakNumber :zahlnum 10000   :zahlstr "zehntausend"))
(defvar speakNumber-100000  (make-instance 'speakNumber :zahlnum 1000    :zahlstr "einhunderttausend"))
(defvar speakNumber-1000000 (make-instance 'speakNumber :zahlnum 1000000 :zahlstr "einemillion"))

;; -------------------------------------------------------------------
;; The role of the subnet mask - 8 Bit := 1 Byte := 255 possibles ...
;; for the ipv4 protocol
;; -------------------------------------------------------------------
(defclass subnetMask ()
          ((bitLen  :initarg :bitLen)    ; Host Bit Length
           (maxh    :initarg :maxh )     ; Max Host's
           (mask    :initarg :mask )     ; Subnet Mask
           (octet   :initarg :octet)     ; Mask octet
           (binmask :initarg :binmask)   ; Binary mask
           (maskLen :initarg :maskLen)   ; Mask Length
           (subLen  :initarg :subLen)))  ; Subnet Length
;;
(defvar hostBit-0  (make-instance 'subnetMask :bitLen 0 :maxh (expt 2  0) :mask "255.255.255.255" :octet 4 :binmask 11111111 :maskLen 32 :subLen  0))
(defvar hostBit-1  (make-instance 'subnetMask :bitLen 1 :maxh (expt 2  1) :mask "255.255.255.254" :octet 4 :binmask 11111110 :maskLen 31 :subLen  1))
(defvar hostBit-2  (make-instance 'subnetMask :bitLen 2 :maxh (expt 2  2) :mask "255.255.255.252" :octet 4 :binmask 11111100 :maskLen 30 :subLen  2))
(defvar hostBit-3  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  3) :mask "255.255.255.248" :octet 4 :binmask 11111000 :maskLen 29 :subLen  3))
(defvar hostBit-4  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  4) :mask "255.255.255.240" :octet 4 :binmask 11110000 :maskLen 28 :subLen  4))
(defvar hostBit-5  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  5) :mask "255.255.255.224" :octet 4 :binmask 11100000 :maskLen 27 :subLen  5))
(defvar hostBit-6  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  6) :mask "255.255.255.192" :octet 4 :binmask 11000000 :maskLen 26 :subLen  6))
(defvar hostBit-7  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  7) :mask "255.255.255.128" :octet 4 :binmask 10000000 :maskLen 25 :subLen  7))
;;
(defvar hostBit-8  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  8) :mask "255.255.255.000" :octet 3 :binmask 11111111 :maskLen 24 :subLen  8))
(defvar hostBit-9  (make-instance 'subnetMask :bitLen 3 :maxh (expt 2  9) :mask "255.255.254.000" :octet 3 :binmask 11111110 :maskLen 23 :subLen  9))
(defvar hostBit-10 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 10) :mask "255.255.252.000" :octet 3 :binmask 11111100 :maskLen 22 :subLen 10))
(defvar hostBit-11 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 11) :mask "255.255.248.000" :octet 3 :binmask 11111000 :maskLen 21 :subLen 11))
(defvar hostBit-12 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 12) :mask "255.255.240.000" :octet 3 :binmask 11110000 :maskLen 20 :subLen 12))
(defvar hostBit-13 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 13) :mask "255.255.224.000" :octet 3 :binmask 11100000 :maskLen 19 :subLen 13))
(defvar hostBit-14 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 14) :mask "255.255.192.000" :octet 3 :binmask 11000000 :maskLen 18 :subLen 14))
(defvar hostBit-15 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 15) :mask "255.255.128.000" :octet 3 :binmask 10000000 :maskLen 17 :subLen 15))
;;
(defvar hostBit-16 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 16) :mask "255.255.000.000" :octet 2 :binmask 11111111 :maskLen 16 :subLen 16))
(defvar hostBit-17 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 17) :mask "255.254.000.000" :octet 2 :binmask 11111110 :maskLen 15 :subLen 17))
(defvar hostBit-18 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 18) :mask "255.252.000.000" :octet 2 :binmask 11111100 :maskLen 14 :subLen 18))
(defvar hostBit-19 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 19) :mask "255.248.000.000" :octet 2 :binmask 11111000 :maskLen 13 :subLen 19))
(defvar hostBit-20 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 20) :mask "255.240.000.000" :octet 2 :binmask 11110000 :maskLen 12 :subLen 20))
(defvar hostBit-21 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 21) :mask "255.224.000.000" :octet 2 :binmask 11100000 :maskLen 11 :subLen 21))
(defvar hostBit-22 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 22) :mask "255.192.000.000" :octet 2 :binmask 11000000 :maskLen 10 :subLen 22))
(defvar hostBit-23 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 23) :mask "255.128.000.000" :octet 2 :binmask 10000000 :maskLen  9 :subLen 23))
;;
(defvar hostBit-24 (make-instance 'subnetMask :bitLen 3 :maxh (expt 2 24) :mask "255.000.000.000" :octet 1 :binmask 11111111 :maskLen  8 :subLen 24))
;;

;; ----------------------------------------------------------------------------
;; Perioden-System: Gruppen ...
;; ----------------------------------------------------------------------------
(defclass pegruppe ()
          ((nummer :initarg :nummer)
           (name   :initarg :name)))

(defvar pegruppe-1  (make-instance 'pegruppe :nummer  1 :name "Alkalimetalle"  ))
(defvar pegruppe-2  (make-instance 'pegruppe :nummer  2 :name "Edelgase"       ))
(defvar pegruppe-11 (make-instance 'pegruppe :nummer 11 :name "Kupfergruppe"   ))
(defvar pegruppe-13 (make-instance 'pegruppe :nummer 13 :name "Erdmetalle"     ))
(defvar pegruppe 14 (make-instance 'pegruppe :nummer 14 :name "Kohlenstoff"    ))
(defvar pegruppe 15 (make-instance 'pegruppe :nummer 15 :name "Stickstoffgase" ))
(defvar pegruppe-16 (make-instance 'pegruppe :nummer 16 :name "Chalkogene"     ))

;; ----------------------------------------------------------------------------
;; Perioden-System der Elemente ...
;; ----------------------------------------------------------------------------
(defclass pelement ()
          ((zeichen :initarg :zeichen)      ; Element Kurzzeichen
           (name    :initarg :name)         ; Name des Elements
           (ordzahl :initarg :ordzahl)      ; Ordnungszahl
           (gruppe  :initarg :gruppe)       ; Gruppe
           (eleit   :initarg :eleit)        ; Elektrische Leitfähigkeit (kappa)
           (spwider :initarg :spwider)))    ; Spezifischer Widerstand (p = roh) => Ohm * mm^2/m

(defvar pelement-h  (make-instance 'pelement :zeichen "H"  :name "Wasserstoff" :ordzahl  1 :gruppe 'pegruppe-1  ))
(defvar pelement-he (make-instance 'pelement :zeichen "He" :name "Helium"      :ordzahl  2 :gruppe 'pegruppe-2  ))
(defvar pelement-li (make-instance 'pelement :zeichen "Li" :name "Lithum"      :ordzahl  3 :gruppe 'pegruppe-1  ))
(defvar pelement-be (make-instance 'pelement :zeichen "Be" :name "Beryllium"   :ordzahl  4 :gruppe 'pegruppe-2  ))
(defvar pelement-b  (make-instance 'pelement :zeichen "B"  :name "Bor"         :ordzahl  5 :gruppe 'pegruppe-13 ))
(defvar pelement-c  (make-instance 'pelement :zeichen "C"  :name "Kohlenstoff" :ordzahl  6 :gruppe 'pegruppe-14 ))
(defvar pelement-n  (make-instance 'pelement :zeichen "N"  :name "Stickstoff"  :ordzahl  7 :gruppe 'pegruppe-15 ))
(defvar pelement-o  (make-instance 'pelement :zeichen "O"  :name "Sauerstoff"  :ordzahl  8 :gruppe 'pegruppe-16 ))

(defvar pelement-ag (make-instance 'pelement :zeichen "Ag" :name "Silber"      :ordzahl 47 :gruppe 'pegruppe-11 :eleit 62 :spwider 0.0161 ))
(defvar pelement-cu (make-instance 'pelement :zeichen "Cu" :name "Kupfer"      :ordzahl 29 :gruppe 'pegruppe-11 :eleit 58 :spwider 0.0172 ))
(defvar pelement-au (make-instance 'pelement :zeichen "Au" :name "Gold"        :ordzahl 79 :gruppe 'pegruppe-11 :eleit 41 :spwider 0.0244 ))

;; ---------------------------------------------------------------------
;; Der Widerstandswert elektrischer Widerstände wird in Ohm angegeben.
;; Die meisten Widerstände haben Farbringe, mit deren Hilfe sich
;; Widerstandswert und Toleranz ermitteln lassen.
;; Bei Widerständen mit insgesamt vier Farbringen dienen die ersten
;; drei Farbringe zum Feststellen des Widerstandswertes, die Farbe des
;; viertes Ringes gibt den Toleranzwert an.
;;
;; Beispiel:
;;   1. Ring 4 - gelb    = 4
;;   2. Ring 7 - violett = 7
;;   3. Ring 3 -         = 1000  = 47.000 Ohm = 47 Kilo-Ohm
;;   4. Ring     rot     = +-2%  = Toleranz
;; ---------------------------------------------------------------------
(defclass *RTafel* ()
          ((farbe :initarg :farbe)
           (ring1 :initarg :ring1)
           (ring2 :initarg :ring2)
           (ring3 :initarg :ring3)    ; Anzahl der Nullen
           (ring4 :initarg :ring4)))  ; Toleranz
;;
(defvar *RTafel-schwarz* (make-instance '*RTafel* :farbe "schwarz" :ring1 0 :ring2 0 :ring3 0        :ring4  0.00 ))
(defvar *RTafel-braun*   (make-instance '*RTafel* :farbe "braun"   :ring1 1 :ring2 1 :ring3 10       :ring4  1.00 ))
(defvar *RTafel-rot*     (make-instance '*RTafel* :farbe "rot"     :ring1 2 :ring2 2 :ring3 100      :ring4  2.00 ))
(defvar *RTafel-orange*  (make-instance '*RTafel* :farbe "orange"  :ring1 3 :ring2 3 :ring3 1000     :ring4  0.00 ))
(defvar *RTafel-gelb*    (make-instance '*RTafel* :farbe "gelb"    :ring1 4 :ring2 4 :ring3 10000    :ring4  0.00 ))
(defvar *RTafel-gruen*   (make-instance '*RTafel* :farbe "gruen"   :ring1 5 :ring2 5 :ring3 100000   :ring4  0.50 ))
(defvar *RTafel-blau*    (make-instance '*RTafel* :farbe "blau"    :ring1 6 :ring2 6 :ring3 1000000  :ring4  0.25 ))
(defvar *RTafel-violett* (make-instance '*RTafel* :farbe "violett" :ring1 7 :ring2 7 :ring3 10000000 :ring4  0.10 ))
(defvar *RTafel-grau*    (make-instance '*RTafel* :farbe "grau"    :ring1 8 :ring2 8 :ring3 0        :ring4  0.00 ))
(defvar *RTafel-weis*    (make-instance '*RTafel* :farbe "weis"    :ring1 9 :ring2 9 :ring3 0        :ring4  0.00 ))
(defvar *RTafel-gold*    (make-instance '*RTafel* :farbe "gold"    :ring1 0 :ring2 0 :ring3 0.1      :ring4  5.00 ))
(defvar *RTafel-silber*  (make-instance '*RTafel* :farbe "silber"  :ring1 0 :ring2 0 :ring3 0.01     :ring4 10.00 ))

;; --------------------------------------------------------------------------------
;; Widerstandsreihen: E3, E6, E12, E24, E48, E96, E192 ...
;; Faktor k: für Verlustwiderstand
;;                      ___
;;                   x /   '
;; Grundformel:  k =  v 10       x entspricht: E3 | E6 | ...
;; Beispiel:
;;            ___
;;         6 /   '
;;    k =   v 10
;; --------------------------------------------------------------------------------
(defvar *RReiheE3*   2.1544)
(defvar *RReiheE6*   1.4677)
(defvar *RReiheE12*  1.2115)
(defvar *RReiheE24*  1.1006)
(defvar *RReiheE48*  1.0491)
(defvar *RReiheE96*  1.0242)
(defvar *RReiheE192* 1.0120)
;;
(defvar *RReiheE3Const0*   1.0 ) ; 1 Ohm
(defvar *RReiheE6Const0*   1.0 )
;;
(defvar *RReiheE12Const0*  1.0 )
(defvar *RReiheE24Const0*  1.0 )
;;
(defvar *RReiheE48Const0*  1.0 )
(defvar *RReiheE96Const0*  1.0 )
;;
(defvar *RReiheE192Const0* 1.0 )
;;
(defvar *RReiheE3Const1* (round-to (* 2.1544 1.0             ) 2))  ; 2.1544
(defvar *RReiheE3Const2* (round-to (* 2.1544 *RReiheE3Const1*) 2))  ; 4.6416
(defvar *RReiheE3Const3* (round-to (* 2.1544 *RReiheE3Const2*) 2))  ;
(defvar *RReiheE3Const4* (round-to (* 2.1544 *RReiheE3Const3*) 2))  ;
(defvar *RReiheE3Const5* (round-to (* 2.1544 *RReiheE3Const4*) 2))  ;
;;
(defvar *RReiheE6Const1* (round-to (* 1.4677 1.0             ) 2))  ; 1.4667
(defvar *RReiheE6Const2* (round-to (* 1.4677 *RReiheE6Const1*) 2))  ; 2.1541
(defvar *RReiheE6Const3* (round-to (* 1.4677 *RReiheE6Const2*) 2))  ; 3.1615
(defvar *RReiheE6Const4* (round-to (* 1.4677 *RReiheE6Const3*) 2))  ; 4.6401
(defvar *RReiheE6Const5* (round-to (* 1.4677 *RReiheE6Const4*) 2))  ; 6.8100
;;
(defvar *RReiheE12Const1* (round-to (* 1.2115 1.0              ) 2))  ; 1.2115
(defvar *RReiheE12Const2* (round-to (* 1.2115 *RReiheE12Const1*) 2))  ;
(defvar *RReiheE12Const3* (round-to (* 1.2115 *RReiheE12Const2*) 2))  ;
(defvar *RReiheE12Const4* (round-to (* 1.2115 *RReiheE12Const3*) 2))  ;
(defvar *RReiheE12Const5* (round-to (* 1.2115 *RReiheE12Const4*) 2))  ;
;;
(defvar *RReiheE24Const1* (round-to (* 1.1006 1.0              ) 2))  ; 1.1006
(defvar *RReiheE24Const2* (round-to (* 1.1006 *RReiheE24Const1*) 2))  ;
(defvar *RReiheE24Const3* (round-to (* 1.1006 *RReiheE24Const2*) 2))  ;
(defvar *RReiheE24Const4* (round-to (* 1.1006 *RReiheE24Const3*) 2))  ;
(defvar *RReiheE24Const5* (round-to (* 1.1006 *RReiheE24Const4*) 2))  ;
;;
(defvar *RReiheE48Const1* (round-to (* 1.0491 1.0              ) 2))  ; 1.0491
(defvar *RReiheE48Const2* (round-to (* 1.0491 *RReiheE48Const1*) 2))  ;
(defvar *RReiheE48Const3* (round-to (* 1.0491 *RReiheE48Const2*) 2))  ;
(defvar *RReiheE48Const4* (round-to (* 1.0491 *RReiheE48Const3*) 2))  ;
(defvar *RReiheE48Const5* (round-to (* 1.0491 *RReiheE48Const4*) 2))  ;
;;
(defvar *RReiheE96Const1* (round-to (* 1.0242 1.0              ) 2))  ; 1.0242
(defvar *RReiheE96Const2* (round-to (* 1.0242 *RReiheE96Const1*) 2))  ;
(defvar *RReiheE96Const3* (round-to (* 1.0242 *RReiheE96Const2*) 2))  ;
(defvar *RReiheE96Const4* (round-to (* 1.0242 *RReiheE96Const3*) 2))  ;
(defvar *RReiheE96Const5* (round-to (* 1.0242 *RReiheE96Const4*) 2))  ;
;;
(defvar *RReiheE192Const1* (round-to (* 1.0120 1.0               ) 2))  ; 1.0120
(defvar *RReiheE192Const2* (round-to (* 1.0120 *RReiheE192Const1*) 2))  ;
(defvar *RReiheE192Const3* (round-to (* 1.0120 *RReiheE192Const2*) 2))  ;
(defvar *RReiheE192Const4* (round-to (* 1.0120 *RReiheE192Const3*) 2))  ;
(defvar *RReiheE192Const5* (round-to (* 1.0120 *RReiheE192Const4*) 2))  ;

;; ----------------------------------------------------------------------------
;; zeitabhängiger Moment-Strom (Current) ...
;; 
;; I = Q / (delta t)
;;
;; Q = Spannung
;; t = Zeit
;;
;; ----------------------------------------------------------------------------
;; Ohm'sches Gesetz für Widerstände: ...
;;
;; R = V / I
;;
;; R = Widerstand
;; V = Volt Ampere
;; I = Moment-Strom (current)
;;
;; ----------------------------------------------------------------------------
;; Kabel - Widerstand ...
;;
;; p = resiativty
;; L = Kabel-Länge
;; A = cross sectional area
;;
;; ----------------------------------------------------------------------------
;; Kirchoff's erstes Gesetz:
;; summe(I_eingang)  =  summe(I_ausgang)
;; ----------------------------------------------------------------------------
;; Kirchoff's zweite Gesetz:
;; summe(V = E.M.F)
;; ----------------------------------------------------------------------------
;;
;; Widerstände in Serie:
;;    _______    _______    _______
;; __|  R_1  |__|  R_2  |__|  R_3  |___\ I
;;   |_______|  |_______|  |_______|   /
;;
;; R_gesamt = R_1  +  R_2  +  R_3
;;
;; --------------------------------------------------------------------------------
;; Widerstände in Reihe:
;;
;;          V
;;   |   ______    |
;;   |__|  R_1  |__|
;;   |  |_______|  |
;;   |   _______   |
;;   |__|  R_2  |__|
;;   |  |_______|  |
;;   |   _______   |
;;   |__|  R_3  |__|
;;      |_______|
;;
;; 1/R_gesamt = 1/R_1 + 1/R_2 + 1/R_3
;; --------------------------------------------------------------------------------

;; --------------------------------------------------------------------------------
;; Der Kondensator kann elektrische Energie speichern.
;; In seiner einfachsten Form besteht der aus zwei Elektroden, die
;; durch einen Isolator elektrisch voneinander getrennt sind.
;; Beim Anlegen einer elektrischen Spannung werden diese Platten
;; aufgeladen und speichern die Energie auch beim Entnehmen der Spannungszufuhr.
;; Jeder Kondensator besitzt eine bestimmte mögliche Ladungsmenge an elektrischer
;; Energie. Diese wird auch als Kapazität bezeichnet. Die Kapazität wird in
;; Farad angegeben.
;; --------------------------------------------------------------------------------

;; ----------------------------------------------------
;; each port side, can plugged with other material ...
;; ----------------------------------------------------
(defclass plus  () ((plug :initarg :plug)))  ;; plugged / verbunden?
(defclass minus () ((plug :initarg :plug)))  ;; plugged / verbunden?

;; ----------------------------------------------------------------------------
;; Eingänge:
;; pot := 0 Strom liegt NICHT an ...
;; pot := 1 Strom liegt an
;; ----------------------------------------------------------------------------
;; a1 = Anfang Low
;; e1 = Ende   Low
;;
;; a2 = Anfang High
;; e2 = Ende   High
;;
;; ----------------------------------------------------------------------------
(defun ports-2 (a1 e1  a2 e2)
    (setq r1  0)
    (setq r2  0)
    (if (= a1 0) (if (= e1 0) (setq r1 0)))
    (if (= a1 0) (if (= e1 1) (setq r1 0)))
    (if (= a1 1) (if (= e1 0) (setq r1 0)))
    (if (= a1 1) (if (= e1 1) (setq r1 1)))
    ;;
    (if (= a2 0) (if (= e2 0) (setq r2 0)))
    (if (= a2 0) (if (= e2 1) (setq r2 0)))
    (if (= a2 1) (if (= e2 0) (setq r2 0)))
    (if (= a2 1) (if (= e2 1) (setq r2 1)))
    ;;
    (if (= r1 0) (if (= r2 0) (return-from ports-2 0)))
    (if (= r1 0) (if (= r2 1) (return-from ports-2 0)))
    (if (= r1 1) (if (= r2 0) (return-from ports-2 0)))
    (if (= r1 1) (if (= r2 1) (return-from ports-2 1)))
)

;; ----------------------------------------------------------------------------
;; Draht:
;;
;; R = Roh * (L/A)
;;
;; Roh = Spezifischer Widerstand des Leiter-Materials (z.B. Kupfer)
;; R   = Widerstand
;; L   = Länge des Leiters in Meter
;; A   = Kabel-Querschnitt in Quadratmetern
;;
;; Handelsübliche Kabelquerschnitte:
;;  0,75 mm^2,
;;  1,50 mm^2,
;;  2,50 mm^2,
;;  4,00 mm^2,
;;  6,00 mm^2,
;; 10,00 mm^2,
;; 16,00 mm^2
;;
;; Berechnung Querschnitt A aus Durchmesser d = 2 * r: (Runder Kabelquerschnitt
;; aus Leitungsdurchmesser):
;;
;; r = Radius   = Drahtradius
;; d = 2*r      = Drahtdurchmesser
;;
;; A = r^2 * pi = ((d^2 * pi) / 4) * d^2
;;
;; Berechnung Durchmesser d = 2*r aus Querschnitt A: (Kabeldurchmesser aus
;; rundem Leitungsquerschnitt):
;;
;; d = 2 * sqrt(A/pi) = 2r * sqrt(A)
;;
;; Spannungsabfall: delta U
;;
;; delta U = I * R = I * (2 * (l / (k * A)))
;;
;; I = Stromstärke
;; l = Leitungslänge in Meter (mal 2, weil es einen Hin- und einen Rückleiter
;; k = kappa, elektrische Leitfähigkeit (Leitwert) von Kupfer (Cu) = 58 S*m/mm^2
;; S = (Simens bei 1 m Länge und 1 mm^2 Leiterflöche) = k = 1/p
;; p = roh = Spezifischer Widerstand Ohm * m
;; A = Leiter-Querschnitts-Fläche in mm^2
;; R = Widerstand
;;
;;
;; Größe des Widerstands:
;;
;; R = p * (l/A)
;;
;; ----------------------------------------------------------------------------
(defclass draht ()
          ((material :initarg :material)
           (roh      :initarg :roh)
           (laenge   :initarg :laenge)
           (schnitt  :initarg :schnitt)))
;;
(defvar 
;; ------------------------------------
;; power vendors ...
;; ------------------------------------
(defclass powerVendor ()
	  ((name     :initarg :name)
       (size     :initarg :size)
       (voltage  :initarg :voltage)
       (capacity :initarg :capacity)
       (munit    :initarg :munit)
       (port
))

(defvar powerDuraCell-AAA (make-instance 'powerVendor :name "DuraCell" :size "AAA" :voltage 1.5 :capacity 1450   :munit "mAh"))
(defvar powerDuraCell-AA  (make-instance 'powerVendor :name "DuraCell" :size "AA"  :voltage 1.5 :capacity 3500   :munit "mAh"))
(defvar powerDuraCell-C   (make-instance 'powerVendor :name "DuraCell" :size "C"   :voltage 1.5 :capacity 8000   :munit "mAh"))
(defvar powerDuraCell-D   (make-instance 'powerVendor :name "DuraCell" :size "D"   :voltage 1.5 :capacity 207000 :munit "mAh"))
(defvar powerDuraCell-9V  (make-instance 'powerVendor :name "DuraCell" :size "9V"  :voltage 9.0 :capacity 1200   :munit "mAh"))



;;
(defclass diode () ())
(defclass led (diode)
          ((color :initarg :color)))

;; ----------------------------------------------------------------------------
;; D I G I T A L  -  Elektronik
;;
;; ----------------------------------------------------------------------------
;; AND - Gate ...
;;
;;  A  B  Q
;; ---------
;;  0  0  0
;;  0  1  0
;;  1  0  0
;;  1  1  1
;; ----------------------------------------------------------------------------
(defun gate-and (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 0)))
    (if (= a 0) (if (= b 1) (setq res 0)))
    (if (= a 1) (if (= b 0) (setq res 0)))
    (if (= a 1) (if (= b 1) (setq res 1)))

    (return-from gate-and res)
)

;; ----------------------------------------------------------------------------
;; OR - Gate ..
;;
;;  A  B  Q
;; ---------
;;  0  0  0
;;  0  1  1
;;  1  0  1
;   1  1  1
;; ----------------------------------------------------------------------------
(defun gate-or (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 0)))
    (if (= a 0) (if (= b 1) (setq res 1)))
    (if (= a 1) (if (= b 0) (setq res 1)))
    (if (= a 1) (if (= b 1) (setq res 1)))

    (return-from gate-or res)
)

;; ----------------------------------------------------------------------------
;; NAND - Gate ..,
;;
;;  A  B  Q
;; ---------
;;  0  0  1
;;  0  1  1
;;  1  0  1
;;  1  1  0
;; ----------------------------------------------------------------------------
(defun gate-nand (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 1)))
    (if (= a 0) (if (= b 1) (setq res 1)))
    (if (= a 1) (if (= b 0) (setq res 1)))
    (if (= a 1) (if (= b 1) (setq res 0)))

    (return-from gate-nand res)
)

;; ----------------------------------------------------------------------------
;; NOR - Gate ..,
;;
;;  A  B  Q
;; ---------
;;  0  0  1
;;  0  1  0
;;  1  0  0
;;  1  1  0
;; ----------------------------------------------------------------------------
(defun gate-nor (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 1)))
    (if (= a 0) (if (= b 1) (setq res 0)))
    (if (= a 1) (if (= b 0) (setq res 0)))
    (if (= a 1) (if (= b 1) (setq res 0)))

    (return-from gate-nor res)
)

;; ----------------------------------------------------------------------------
;; NOT - Gate ..,
;;
;;  A  Q
;; -------
;;  0  1
;;  1  0
;; ----------------------------------------------------------------------------
(defun gate-not (a)
    (setq res 0)
    (if (= a 0) (setq res 1))
    (if (= a 1) (setq res 0))

    (return-from gate-not res)
)

;; ----------------------------------------------------------------------------
;; XOR - Gate ..,
;;
;;  A  B  Q
;; ---------
;;  0  0  0
;;  0  1  1
;;  1  0  1
;;  1  1  0
;; ----------------------------------------------------------------------------
(defun gate-xor (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 0)))
    (if (= a 0) (if (= b 1) (setq res 1)))
    (if (= a 1) (if (= b 0) (setq res 1)))
    (if (= a 1) (if (= b 1) (setq res 0)))

    (return-from gate-xor res)
)

;; ----------------------------------------------------------------------------
;; XNOR - Gate ..,
;;
;;  A  B  Q
;; ---------
;;  0  0  1
;;  1  0  0
;;  1  1  0
;;  1  1  1
;; ----------------------------------------------------------------------------
(defun gate-xnor (a b)
    (setq res 0)
    (if (= a 0) (if (= b 0) (setq res 1)))
    (if (= a 0) (if (= b 1) (setq res 0)))
    (if (= a 1) (if (= b 0) (setq res 0)))
    (if (= a 1) (if (= b 1) (setq res 1)))

    (return-from gate-xnor res)
)

;; ----------------------------------------------------------------------------
;; TTL - 7400
;;
;;    Uc A3 B3 C3 A4 B4 C4
;; 14 O__O__O__O__O__O__O___  8
;;   |   |  |  |  |  |  |   |
;;   |   NANDo-+  NANDo-+   |
;;   |                      |
;;   )   NANDo-+  NANDo-+   (
;;   |   |  |  |  |  |  |   |
;;   |___|__|__|__|__|__|___|
;;  1    O  O  O  O  O  O   O 7
;;       A1 B1 C1 A2 B2 C2  GND
;; ----------------------------------------------------------------------------
(defun TTL-7400 (a1 b1 c1  a2 b2 c2  a3 b3 c3  a4 b4 c4  GND Uc)
    (setq c1 0) (setq c2 0)
    (setq c3 0) (setq c4 0)
    ;
    (setq c1 (gate-nand a1 b1)) (return-from TTL-7400 c1)
    (setq c2 (gate-nand a2 b2)) (return-from TTL-7400 c2)
    ;
    (setq c3 (gate-nand a3 b3)) (return-from TTL-7400 c3)
    (setq c4 (gate-nand a4 b4)) (return-from TTL-7400 c4)
)

;; ----------------------------
;; deutsche Frage-Woerter ...
;; ----------------------------
(defstruct deutschesFrageWort wort pro1 pro2)
(setq deFrageWort1 (make-deutschesFrageWort :wort 'liebst :pro1 "du" :pro2 "sie"))
(setq deFrageWort2 (make-deutschesFrageWort :wort 'liebst :pro1 "du" :pro2 "ihn"))
(setq deFrageWort3 (make-deutschesFrageWort :wort 'magst  :pro1 "du" :pro2 "ihn"))
(setq deFrageWort4 (make-deutschesFrageWort :wort 'magst  :pro1 "du" :pro2 "sie"))
;;
(setq deFrageWoerterCollection (list
      deFrageWort1
      deFrageWort2
      deFrageWort3
      deFrageWort4
))

;; -------------------------------------------------------------
;; Turns a string into a stream so it can be read into a list
;; -------------------------------------------------------------
(defun string-to-list (str)
    (if (not (streamp str))
       (string-to-list (make-string-input-stream str))
       (if (listen str)
           (cons (read str) (string-to-list str))
           nil)))

(defun defsymbol (&rest args)
  (intern (format nil "~{~a~^-~}" (mapcar #'string args))))

(setq cnt 0)
;(loop
    (princ "Eingabe: ")
    (setq str (string-to-list(read-line)))
    (print str)
    (terpri)
        ;; ------------------------
        ;; Frage-Wörter zuerst ...
        ;; ------------------------
        (loop
            :for currentFrageWort
            :in  deFrageWoerterCollection
            :do (progn
                (setq fragwort (deutschesFrageWort-wort currentFrageWort))
                (print fragwort)
            )
        )

;    (when (> cnt 5) (return))
;)

(print (geoRechteck-Flaeche 10 5))
(exit)
