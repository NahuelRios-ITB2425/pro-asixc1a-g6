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
## 5.3.3 Càlcul del Consum Total i Factor d'Eficiència

### Consums Energètics Verificats per Categoria

#### **Càrrega IT**

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

# Proposta de Mesures de Reducció i Optimització

## Composició Energètica per Franja Horària (Ontario, 2024)

### 00:00 – 06:00 (Demanda baixa)

- **Nuclear:** 68% (constant baseload)
- **Hidroelèctrica:** 22% (regulated flow)
- **Eòlica:** 8% (variable, pic nocturn)
- **Gas Natural:** 2% (ús mínim per demanda)
- **Factor mitjà d’emissió:** **22.1 g CO₂/kWh**

---

### 06:00 – 12:00 (Rampa matutina)

- **Nuclear:** 58%
- **Hidroelèctrica:** 25%
- **Gas Natural:** 12% (peak matutí)
- **Eòlica:** 5%
- **Factor mitjà d’emissió:** **35.3 g CO₂/kWh**

---

### 12:00 – 18:00 (Demanda pic)

- **Nuclear:** 52%
- **Gas Natural:** 28% (major consum per pic)
- **Hidroelèctrica:** 15%
- **Eòlica:** 5%
- **Factor mitjà d’emissió:** **45.7 g CO₂/kWh**

---

### 18:00 – 24:00 (Pic vespre)

- **Nuclear:** 55%
- **Gas Natural:** 25%
- **Hidroelèctrica:** 18%
- **Eòlica:** 2%
- **Factor mitjà d’emissió:** **42.1 g CO₂/kWh**


## Sistema d'Alimentació Ininterrompuda (SAI)

### SAI PRINCIPAL REDUNDANT

- **Model:** Vertiv Liebert APM 250kVA  
- **Configuració:** 2 unitats (A+B alimentació dual)  
- **Capacitat individual:** 250 kVA / 180 kW per unitat  
- **Temps d'autonomia:** 136 minuts (2.3 hores) a càrrega real  
- **Eficiència:** A++ (96.8% d'eficiència en mode VFI)  
- **Eficiència ECO:** 99.2% (mode de màxima eficiència)  
- **Bateries:** VRLA AGM segellades, vida útil de 10 anys  
- **Monitoratge remot:** SNMP amb targeta Vertiv IntelliSlot  
- **Configuració:** Repartiment de càrrega actiu-actiu  

---

### Càlcul detallat d'autonomia

Amb una càrrega operativa de **98 kW**, el càlcul es fa amb la fórmula següent:

**On:**

- `C`: Capacitat de la bateria (300 Ah per string)  
- `V`: Voltatge de la bateria (480V DC del sistema)  
- `n`: Nombre de strings (2 per SAI = 4 totals)  
- `DoD`: Profunditat de descàrrega (0.8 per VRLA)  
- `P`: Potència consumida (98 kW + pèrdues del SAI)

#### Càlcul pas a pas

- Càrrega DC = `98 ÷ 0.968` = **101.2 kW**  
- Energia disponible per SAI = `480 × 300 × 2 × 0.8` = **230.4 kWh**  
- Energia total = `230.4 × 2` = **460.8 kWh**  
- Autonomia = `460.8 ÷ 101.2` = **4.6 hores**  
- Amb només 1 SAI actiu = `230.4 ÷ 101.2` = **2.3 hores (136 minuts)** ✅

---

### Detall de configuració

Disposem de **2 unitats Vertiv Liebert APM 250kVA** en mode alimentació dual (A+B):

- **Capacitat per unitat:** 250 kVA / 180 kW  
- **Capacitat total:** 500 kVA / 360 kW  
- **Mode operatiu:** Active-Active (repartiment de càrrega)  
- **Eficiència VFI:** 96.8% (A++)  
- **Eficiència ECO:** 99.2%

---

### Sistema de bateries

- **Tipus:** VRLA AGM (Valve Regulated Lead Acid - Absorbed Glass Mat) segellades  
- **Vida útil:** 10 anys @ 20°C  
- **Configuració:** 2 strings per SAI (4 en total)  
- **Voltatge:** 480V DC per string  
- **Capacitat:** 300 Ah @ C10

---

### 1. Càrrega real del sistema

| Component              | Càrrega (kW) |
|------------------------|--------------|
| Càrrega IT (TI)        | 83.0         |
| Climatització          | 25.0         |
| Pèrdues SAI            | 3.2          |
| PDUs + Gestió          | 2.5          |
| Il·luminació LED       | 1.5          |
| Sistemes auxiliars     | 2.0          |
| **Total brut**         | **117.2**    |
| **Total operatiu** (x0.85) | **98.0** |

---

### 2. Escenari 1: Operació normal (2 SAIs actius)

- **Càrrega per SAI:** `98 ÷ 2` = **49 kW**  
- **Energia disponible total:** `480 × 300 × 4 × 0.8` = **460.8 kWh**  
- **Potència DC requerida:** `98 ÷ 0.968` = **101.2 kW**  
- **Autonomia:** `460.8 ÷ 101.2` = **4.55 hores (273 minuts)**

---

### 3. Escenari 2: Mode N+1 (1 SAI en manteniment o fallada)

- **Càrrega total en un sol SAI:** 98 kW  
- **Potència DC:** `98 ÷ 0.968` = **101.2 kW**  
- **Corrent DC:** `101,200 ÷ 480` = **210.8 A**  
- **Corrent per string:** `210.8 ÷ 2` = **105.4 A**  
- **C-rate:** `105.4 ÷ 300` = **0.35C**

**Capacitat efectiva a 0.35C:** 92% → **276 Ah**

- **Energia disponible:** `480 × 276 × 2 × 0.8` = **212.0 kWh**  
- **Autonomia:** `212 ÷ 101.2` = **2.09 hores (125.7 minuts)**

---

### 4. Factors de correcció i consideracions addicionals

**Temperatura ambient:**

| Temperatura | Capacitat |
|-------------|-----------|
| 20°C        | 100%      |
| 25°C        | 98%       |
| 30°C        | 94%       |

A 24°C → Autonomia corregida = `125.7 × 0.98` = **123.2 minuts**

**Envelliment de bateries:**

| Anys | Capacitat |
|------|-----------|
| 1-3  | 100%      |
| 4-6  | 90%       |
| 7-9  | 80%       |
| 10   | 70% (substitució recomanada) |

**Eficiència segons càrrega:**

| % Càrrega | Eficiència |
|-----------|------------|
| 25%       | 94%        |
| 50%       | 96%        |
| 75%       | 96.8%      |
| 100%      | 96.5%      |

---

### 5. Resum de temps d’autonomia

| Escenari    | Càrrega total | SAIs actius | Càrrega/SAI | Autonomia         |
|-------------|----------------|-------------|--------------|--------------------|
| Normal      | 98 kW          | 2           | 49 kW        | 273 min (4.5 h)    |
| Mode N+1    | 98 kW          | 1           | 98 kW        | 136 min (2.3 h)    |
| Emergència* | 65 kW          | 1           | 65 kW        | 195 min (3.2 h)    |

