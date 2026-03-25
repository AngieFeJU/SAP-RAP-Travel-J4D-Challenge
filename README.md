# SAP-RAP-Travel-J4D-Challenge
SAP ABAP RAP OData V4 Travel Agency App - Joule for Developers Challenge

# ✈️ SAP RAP Travel Agency - ABAP Developer Challenge

## 📋 Overview
Travel Agency application built with SAP ABAP RESTful Application Programming Model (RAP) 
and OData V4, developed as part of the official **SAP ABAP Developer Challenge - Joule for Developers using Basic Trial**.
Joule AI was used to generate and enhance the business logic in each weekly challenge.

## 🏆 Challenge Progress
| Week | Task | Status |
|---|---|---|
| Week 1 | Set up Basic Trial account enabled with Joule for Developers | ✅ Done |
| Week 2 | Use Joule Chat to create ABAP RAP Application and explore Explain feature | ✅ Done |
| Week 3 | Use RAP Business Logic Prediction to Implement Validation | ✅ Done |
| Week 4 | Use Joule Predictive Code Completion to Implement Determination | ✅ Done |

## 🛠️ Tech Stack
![SAP](https://img.shields.io/badge/SAP-ABAP%20RAP-blue)
![OData](https://img.shields.io/badge/OData-V4-green)
![Fiori](https://img.shields.io/badge/SAP-Fiori%20Elements-orange)
![Joule](https://img.shields.io/badge/SAP-Joule%20AI-purple)
![Eclipse](https://img.shields.io/badge/Eclipse-ADT-darkblue)

- **SAP ABAP RAP** — RESTful Application Programming Model
- **OData V4** — RESTful service
- **SAP Fiori Elements** — Auto-generated UI
- **Eclipse ADT** — Development environment
- **Joule for Developers** — AI-assisted development
- **abapGit** — Version control

## 📁 Project Structure

| Object | Type | Description |
|---|---|---|
| `ZR_TRAVEL157732_01` | CDS Root View | Interface view with calculated fields |
| `ZC_TRAVEL157732_01` | CDS Consumption View | UI projection with Side Effects |
| `ZBP_R_TRAVEL157732_01` | Behavior Class | Validations and Determinations |
| `ZTRAVEL157732_01` | Database Table | Persistent data |
| `ZTRVL157732_D_01` | Draft Table | Draft handling |

## ✨ Features

### 📊 Week 2 — Joule Chat
Created ABAP RAP Application using Joule Chat wizard:
- OData V4 Service with Fiori Elements UI
- Transactional with Draft enabled
- **DiscountedPrice** — Calculated field: 5% discount if seats < 3, otherwise 10%

### ✅ Week 3 — RAP Business Logic Prediction
Implemented validations using Joule RAP Predict Business Logic:

| Validation | Logic |
|---|---|
| **ValidateDestination** | Destination is mandatory |
| **ValidateTravelDate** | Travel date cannot be in the past |
| **ValidateBasePrice** | Base price must be greater than zero |

### 🔄 Week 4 — Joule Predictive Code Completion
Implemented determinations using Joule Predictive Code Completion:

| Determination | Logic |
|---|---|
| **CalculateDaysUntilDeparture** | Auto-calculates days until departure from TravelDate |
| **CalculateTripStatus** | Auto-sets status based on availability and days remaining |

### 🎯 TripStatus Logic
| Condition | Status |
|---|---|
| SeatsAvailable = 0 | Sold Out |
| DaysUntilDeparture ≤ 7 | Closing Soon |
| SeatsAvailable < 3 | Hot Deal |
| Otherwise | Available |

### ⚡ Side Effects
Real-time field recalculation without saving:
- `TravelDate` → recalculates `DaysUntilDeparture`
- `SeatsAvailable` → recalculates `TripStatus`
- `DaysUntilDeparture` → recalculates `TripStatus`

### 📝 Draft Handling
- Transactional with Draft enabled
- Validations triggered on Draft Prepare action

## 🤖 Joule for Developers Features Used

| Feature | Week | Description |
|---|---|---|
| **Joule Chat** | Week 2 | Created RAP app and explored Explain feature |
| **RAP Predict Business Logic** | Week 3 | Generated validation methods automatically |
| **Predictive Code Completion** | Week 4 | Step by step determination implementation |

## 📸 Screenshots
*(Add screenshots of your Fiori app here)*

## 🚀 How to Run
1. Clone this repository
2. Import package using **abapGit** into your SAP system
3. Activate all objects
4. Publish Service Binding `ZUI_TRAVEL157732_O4`
5. Preview from Service Binding → Entity Set → Preview

## 📬 Contact
- **LinkedIn:** [Your LinkedIn Profile]
- **GitHub:** [@AngieFeJU](https://github.com/AngieFeJU)

---
⭐ If you found this helpful, please give it a star!
