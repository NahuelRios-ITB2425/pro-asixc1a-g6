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

# 4.1 Petjada ecologica del CPD

### Petjada ecològica del CPD

El Centre de Processament de Dades (CPD) comporta un impacte ambiental derivat del seu elevat consum elèctric continu. No obstant això, en estar ubicat a Ontario (Canadà), una regió on la generació elèctrica prové majoritàriament d’energia **hidroelèctrica i nuclear**, les emissions de CO₂ per kWh són molt baixes en comparació amb altres països.

Tot i així, el funcionament 24/7 del CPD implica desenes de tones anuals de CO₂ equivalents. Per minimitzar aquest impacte, s’han implementat mesures d’eficiència energètica com el **free cooling**, equips amb certificació **80+ Titanium**, **UPS d’alta eficiència** i gestió intel·ligent amb **BMS**.

A més, el disseny contempla la futura integració de fonts d’energia renovable i mecanismes de compensació de carboni, reforçant el compromís amb la sostenibilitat i les millors pràctiques mediambientals.


# 4.2.1 Càlcul del Consum Total i Factor d'Eficiència

## Consums Energètics Verificats per Categoria

### **Càrrega IT**

| Component               | Potència Nominal         | Utilització Mitjana | Consum Real           | kWh/any    |
|------------------------|--------------------------|----------------------|------------------------|------------|
| Streaming Servers (8×) | 800W × 8                 | 85% factor de càrrega | 5.44kW × 8 = 43.5kW     | 381,060    |
| Database Cluster (3×)  | 600W × 3                 | 70% factor de càrrega | 1.26kW × 3 = 3.78kW     | 33,113     |
| Storage Systems        | 2.5kW total              | 80% factor de càrrega | 2.0kW                  | 17,520     |
| Network Infrastructure | 15kW total               | 60% factor de càrrega | 9.0kW                  | 78,840     |
| Web Frontend (6×)      | 350W × 6                 | 65% factor de càrrega | 1.37kW × 6 = 8.2kW      | 71,832     |
| Monitoring & Services  | 8kW total                | 55% factor de càrrega | 4.4kW                  | 38,544     |
| Altres sistemes IT     | 5kW total                | 70% factor de càrrega | 3.5kW                  | 30,660     |

**Subtotal Càrrega IT:**

- **Potència Nominal Total:** 108.8kW  
- **Utilització Promig:** 74.2%  
- **Consum Real Total:** 80.6kW  
- **Consum Anual:** **705,654 kWh**

---

### **Sistemes de Suport i Infraestructura**

| Sistema                | Especificació              | Consum Operatiu     | Eficiència             | kWh/any    |
|------------------------|-----------------------------|----------------------|-------------------------|------------|
| Climatització 3×PDX    | 30kW × 3 unitats            | 23.5kW (COP 4.2)     | 420% vs resistiu        | 205,860    |
| Free Cooling           | 4,200h operatives           | 5kW ventiladors      | 4,200h @ 5kW            | 21,000     |
| Sistema UPS (2×)       | 250kVA × 2                  | 97.5% eficiència     | 2.5% pèrdues            | 18,166     |
| PDUs + Gestió          | 24× intel·ligents           | 2.2kW monitoratge    | Smart switching         | 19,272     |
| Il·luminació LED       | 500 lux disseny             | 1.3kW amb sensors    | Control de presència    | 6,278      |
| Sistemes Auxiliars     | Diversos                    | 1.8kW promig         | Alta eficiència         | 15,768     |

**Subtotal Infraestructura:**

- **Consum Promig:** 36.3kW  
- **Consum Anual:** **286,344 kWh**

---

### **Consolidació Energètica Anual**

| Categoria              | Consum Anual (kWh) |
|------------------------|--------------------|
| **Càrrega IT Total**   | 705,654            |
| **Sistemes Facilitat** | 286,344            |
| **TOTAL CONSUM**       | **991,998**        |


# 4.2.2 Càlcul Detallat de la Petjada de Carboni

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

# Resum Emissions Anuals

## Petjada de Carboni Total

| Tipus d’Emissió       | Emissions (t CO₂eq/any) |
|------------------------|--------------------------|
| **Scope 1** (directes) | 7.3                      |
| **Scope 2** (electricitat) | 35.0                 |
| **Scope 3** (indirectes) | 70.9                  |
| **TOTAL**              | **113.2 t CO₂eq/any**    |

---

## Emissions per Usuari (Streaming)

- **Total usuaris:** 50.000
- **Petjada per usuari/any:**  
  \[
  \frac{113.2\ \text{t CO₂eq}}{50,000\ \text{usuaris}} = 2.26\ \text{kg CO₂eq/usuari/any}
  \]

- **Petjada per usuari/dia:**  
  \[
  \frac{2.26\ \text{kg}}{365\ \text{dies}} ≈ 6.2\ \text{g CO₂eq/usuari/dia}
  \]

# 4.3 Proposta de Mesures de Reducció i Optimització

## Composició Energètica per Franja Horària (Ontario, 2024)

| Franja Horària     | Nuclear | Hidroelèctrica | Gas Natural | Eòlica | Factor mitjà d’emissió (g CO₂/kWh) |
|--------------------|---------|----------------|-------------|--------|------------------------------------|
| 00:00 – 06:00      | 68%     | 22%            | 2%          | 8%     | 22.1                               |
| 06:00 – 12:00      | 58%     | 25%            | 12%         | 5%     | 35.3                               |
| 12:00 – 18:00      | 52%     | 15%            | 28%         | 5%     | 45.7                               |
| 18:00 – 24:00      | 55%     | 18%            | 25%         | 2%     | 42.1                               |

---

## Mesures Proposades

### 1. **Reducció d’hores de funcionament en franges de major emissió**

- **Estrategia:** Programar les tasques més intensives energèticament (processos batch, còpies de seguretat, grans càlculs, actualitzacions) durant la nit (00:00 – 06:00), on el factor d’emissió és més baix (22.1 g CO₂/kWh).
- **Benefici:** Reduir l’impacte de la potència consumida quan la generació depèn més del gas natural (major emissió).

---

### 2. **Implementar un sistema de planificació energètica intel·ligent**

- Utilitzar eines d’automatització que ajustin la càrrega del CPD i altres sistemes segons la disponibilitat d’energia renovable o la reducció del factor d’emissió.
- Per exemple, limitar algunes càrregues durant el pic de tarda (12:00 – 18:00) i prioritzar-les en les hores nocturnes.

---

### 3. **Utilitzar serveis al núvol amb certificació d’energia renovable**

- Migrar serveis o dades a centres de dades ubicats en regions on la composició energètica sigui més neta o que tinguin un compromís alt amb energies renovables.
- Exemple: optar per regions que utilitzin majoritàriament hidroelectricitat o energia eòlica, i amb certificacions d’energia verda (RECs, Green Power).

---

### 4. **Instal·lació i ús de sistemes d’energia renovable local**

- Complementar el consum amb plaques solars o energia eòlica pròpia.
- Emmagatzematge d’energia per utilitzar-la preferentment durant les hores de major emissió de la xarxa.

---

### 5. **Optimització del sistema de refrigeració**

- Fer servir tècniques de **free cooling** i sistemes d’alta eficiència per reduir la càrrega elèctrica.
- Programar refrigeració addicional en hores de baixa emissió i optimitzar la temperatura per a un consum més eficient.

---

### 6. **Monitoratge i reporting en temps real**

- Implementar sistemes de monitoratge energètic que mostrin la composició energètica i emissions en temps real.
- Utilitzar aquesta informació per prendre decisions operatives i ajustar processos.

---

### 7. **Sensibilització i formació**

- Educar a l’equip per conscienciar sobre la importància d’usar energia eficientment i en horaris òptims.
- Crear protocols interns per a la gestió energètica sostenible.

---

## Beneficis Esperats

- Reducció significativa de la petjada de carboni i ecològica del CPD.
- Major eficiència en la gestió energètica i menor cost operatiu.
- Posicionament com a empresa compromesa amb la sostenibilitat i la innovació.
