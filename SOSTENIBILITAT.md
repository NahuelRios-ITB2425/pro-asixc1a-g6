# Eficiència Elèctrica

## Consolidar servidors

Agrupar més serveis en menys màquines. Així, no tindríem tantes màquines actives en el moment. És molt millor, per exemple, tenir:
- Una màquina amb tota la seguretat,
- Una altra amb tots els serveis de comunicació,
- Etc.

## Millor classe d’eficiència energètica possible

Molts electrodomèstics es classifiquen per eficiència energètica, com ara:
- Aire condicionat
- Deshumidificador

Encara que els **SAIs** i **CPDs** tenen els seus propis estàndards:

- **CPD (Centre de Processament de Dades)**: 
  - Cal fixar-se en el **PUE (Power Usage Effectiveness)**.
  - Com més proper sigui a **1.0**, millor serà l’eficiència.

- **SAI (Sistema d'Alimentació Ininterrompuda)**: 
  - Es classifiquen segons la certificació **80 PLUS**.
  - Com més alt sigui el ‘Tier’ (Bronze, Silver, Gold, Platinum i Titanium), més eficient serà.

Això també inclou la utilització d’equips de **baix consum energètic**, especialment si necessitem potència. El millor és triar equips potents amb un consum energètic reduït.

## Parada d’equips de comunicacions quan no hi ha càrrega

Permet reduir el **consum elèctric innecessari**, evitant que dispositius inactius continuïn utilitzant energia. Aquesta mesura:
- Optimitza l’eficiència del sistema,
- Contribueix a la sostenibilitat,
- Redueix el **malbaratament energètic**.

## Estalvi en el cablejat

L’estalvi en el cablejat implica:
- Fer servir només el cablatge estrictament necessari,
- Reduir costos de materials i consum de coure,
- Reduir l'energia associada a la seva fabricació i instal·lació.

Beneficis:
- Optimitza l’eficiència del sistema,
- Minimitza l’impacte ambiental de la infraestructura.

## Utilització d'energia renovable/verda

Un gran avantatge de tenir el **CPD al Canadà** és que disposa d’una de les energies més netes del món:

- **80% prové d’energia hidroelèctrica**, amb emissions molt baixes de CO₂ (~0.015 kg per kWh).
- En zones fredes, es pot utilitzar el **"free cooling"** més del **70% de l’any**, estalviant energia en refrigeració.
- **Plaques solars** com a complement:
  - Redueixen emissions de CO₂,
  - Diversifiquen fonts d’energia amb opcions renovables,
  - Malgrat la menor radiació a l’hivern, poden cobrir part del consum elèctric durant el dia, sobretot a l’estiu,
  - Afegeixen **resiliència energètica** al sistema.

Nota: Només s’utilitzaran com a **complement** de l’energia hidroelèctrica (que ja és renovable).

## Sistemes de circulació d’aire que aprofitin condicions naturals

El CPD es troba al **Canadà**, on la temperatura és força baixa. Podem aprofitar aquesta **refrigeració natural** mitjançant sistemes de circulació d’aire. Aquesta tècnica és coneguda com a **‘free cooling’**.

# Consum Energètic de Plataformes de Streaming

## Netflix

- **Streaming:** ≈ 4,5 TWh  
  - (300 M llars × 2 h/dia × 365 dies × 0,15 kWh/h)
- **Centres de dades i CDN:** +1–2 TWh  
- **Total:** **5–7 TWh**

---

## HBO Max (Max)

- **Streaming:** ≈ 1,5–2 TWh  
  - (100 M usuaris)
- **Centres de dades i CDN:** +0,5–1 TWh  
- **Total:** **2–3 TWh**

---

## Amazon Prime Video

- **Streaming:** ≈ 3–4 TWh  
  - (200 M usuaris)
- **Centres de dades i CDN (AWS, PUE ≈ 1,1):** +1–2 TWh  
- **Total:** **4–6 TWh**

---

## Innovate Tech

- **Streaming:** ≈ 0,045 TWh (o 45.000 MWh)  
  - (3 M usuaris)
- **Consum CPD:** ≈ 131–175 MWh  
- **Total:** **45.175 MWh** (o **0,045175 TWh**)

# Càlcul Detallat de la Petjada de Carboni

## Metodologia de Càlcul d’Emissions

### Factors d'Emissió Aplicats (Fonts Verificades)

#### Grid Elèctric d'Ontario (2024)

**Composició del Mix Energètic:**

| Font Energètica | Percentatge | Emissions Directes (g CO₂/kWh) | Emissions del Cicle de Vida (g CO₂/kWh) |
|------------------|-------------|--------------------------------|-----------------------------------------|
| Nuclear          | 60.2%       | 0                              | 12                                      |
| Hidroelèctrica   | 24.8%       | 4                              | 24                                      |
| Eòlica           | 7.1%        | 11                             | 11                                      |
| Solar            | 2.4%        | 45                             | 41                                      |
| Gas Natural      | 4.9%        | 490                            | 490                                     |
| Biomassa         | 0.6%        | 18                             | (assumit neutre en carboni)            |

### Càlcul del Factor Ponderat d’Emissions (Lifecycle)

\[
(0.602 × 12) + (0.248 × 24) + (0.071 × 11) + (0.024 × 41) + (0.049 × 490) + (0.006 × 18)
\]

\[
= 7.2 + 5.9 + 0.8 + 1.0 + 24.0 + 0.1 = \mathbf{39.0\ g\ CO₂eq/kWh}
\]

> **Nota:** Es fa servir un valor conservador de **35.3 g CO₂/kWh**, segons dades verificades de l’**IESO (Independent Electricity System Operator, 2024)**.
