Original App Design Project - README Template
===

# Coin Exchange

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
Coin Exchange is an app that lets you convert currencies.

### Description

Coin Exchange is an app that lets you convert a currency from many different currencies using real time data. You can choose which currency you want your currency to be converted to. There is also an account balance that can be used to convert the currency.

### App Evaluation

   - **Category:** Finance
   - **Mobile:** App that allows user input. Gives the user an output.
   - **Story:** Allows the user to convert currency to manage their finances in different countries.
   - **Market:** Anyone that travels can use this app. People who work with clients can use this app as well. This app makes life easier by converting money to your home currency.
   - **Habit:** Users can use this app whenever they travel. They can also use this app while shopping in different countries.
   - **Scope:** Starting out by just allowing users to convert currency by using real time data through an API. There is scope to grow but not much.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User must be able to convert currency from USD to EUR.
- [x] User must be able to see the conversion rate for different currencies.
- [x] User must be able to convert currency from USD to multiple different currencies.
- [x] User must be able to view profile and access multiple screens by using the tab bar.

**Optional Nice-to-have Stories**

* User must have an account balance and must be able to use that.
* User must be able to switch from Light Mode to Dark Mode.
* User must be able to view currency news.

### Sprints

* Sprint 1: Set up the project and make basic view controllers.
* Sprint 2: User can switch to different screens like currencies, profile, and convert.
* Sprint 3: User can convert currency from USD to multiple different currencies. The data is fetched from an API.
* Sprint 4: Different screens like the currency, profile, and convert screen all have functionality and UI elements. User can view the exchange rate from 1 USD to              multiple currencies on the currency tab.
* Sprint 5: Improved the UI and changed different colors and styling along with adding rounded edges to some elements.

### 2. Screen Archetypes

- [x] Currency Conversion Screen.
* User can view the conversion screen and use the converter.
- [x] Profile Screen.
* User can see their profile and account balance.
- [x] Currency Rate Screen.
* User can see different currencies and their current rate.
 
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Currency Conversion Screen
* Profile Screen
* Currency Screen

**Flow Navigation** (Screen to Screen)

- [ ] Currency Conversion Screen
* => Currency Screen
- [ ] Profile Screen
* => Balance Screen


## Wireframes

<img src="https://github.com/SahilSethi5/iOS-Development-Capstone/blob/main/IMG_5876.jpeg" width=600>

## Video Walkthrough

<blockquote class="imgur-embed-pub" lang="en" data-id="a/XDjNweK" data-context="false" ><a href="//imgur.com/a/XDjNweK"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

## Schema 

Currency: code, rate.
ExchangeRate: base_code, conversion_rates.

### Models

Currency

### Networking

- Uses an API on 2 screens, convert screen and currency screen to get information about converting currencies from USD to selected currency.
- The API request returns multiple currencies and also the conversion rate for the currencies.
