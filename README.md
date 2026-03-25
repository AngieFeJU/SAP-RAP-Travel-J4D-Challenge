# SAP-RAP-Travel-J4D-Challenge
SAP ABAP RAP OData V4 Travel Agency App - Joule for Developers Challenge

# ✈️ SAP RAP Travel Agency - ABAP Developer Challenge

## 📋 Overview
Travel Agency application built with **SAP ABAP RAP** and **OData V4** as part of the 
official SAP ABAP Developer Challenge - Joule for Developers using Basic Trial.

## 🛠️ Tech Stack
![SAP](https://img.shields.io/badge/SAP-ABAP%20RAP-blue)
![OData](https://img.shields.io/badge/OData-V4-green)
![Fiori](https://img.shields.io/badge/SAP-Fiori%20Elements-orange)
![Joule](https://img.shields.io/badge/SAP-Joule%20AI-purple)
![Eclipse](https://img.shields.io/badge/Eclipse-ADT-darkblue)

## 🏆 Challenge - What was built each week

### Week 1 — Setup
- Basic Trial account with ABAP instance in ADT
- Package `ZAC_157732` in ABAP Cloud Project
- Explored SAP Joule for Developers AI Capabilities

### Week 2 — RAP Application + CDS Logic
- Created ABAP RAP OData V4 app using **Joule Chat** wizard
- Added calculated field `DiscountedPrice` in CDS using Joule:
  - 5% discount if `SeatsAvailable < 3`, otherwise 10%
- Used **Joule Explain** to understand generated code

### Week 3 — Validations with RAP Predict Business Logic
Using **Joule RAP Predict Business Logic** implemented:
- `ValidateDestination` → Destination is mandatory
- `ValidateTravelDate` → Travel date cannot be in the past
- `ValidateBasePrice` → Base price must be greater than zero

### Week 4 — Determinations with Joule Code Prediction
Using **Joule Predictive Code Completion** implemented:
- `CalculateDaysUntilDeparture` → Auto-calculates days until TravelDate
- `CalculateTripStatus` → Sets status based on availability and days:

| Condition | Status |
|---|---|
| SeatsAvailable = 0 | Sold Out |
| DaysUntilDeparture ≤ 7 | Closing Soon |
| SeatsAvailable < 3 | Hot Deal |
| Otherwise | Available |

## ⚡ Additional Features
- **Draft handling** — Transactional with Draft, validations on Prepare action
- **Side Effects** — Real-time recalculation of `DaysUntilDeparture` and `TripStatus` on field change

## 📁 Main Objects
| Object | Description |
|---|---|
| `ZR_TRAVEL157732_01` | CDS Root View + Behavior Definition |
| `ZC_TRAVEL157732_01` | CDS Consumption View |
| `ZBP_R_TRAVEL157732_01` | Behavior Implementation Class |
| `ZTRAVEL157732_01` | Database Table |

## 📸 Screenshots
*(Add screenshots here)*

## 🚀 How to Run
1. Import package via **abapGit**
2. Activate all objects
3. Publish Service Binding `ZUI_TRAVEL157732_O4`
4. Preview from Service Binding → Entity Set → Preview

## 📬 Contact
- **LinkedIn:** [Angeles Camacho Solis](https://www.linkedin.com/in/angeles-camacho-solis)
- **GitHub:** [@AngieFeJU](https://github.com/AngieFeJU)

---
⭐ If you found this helpful, please give it a star!
