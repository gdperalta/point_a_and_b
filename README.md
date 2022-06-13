# **Point A and B**

![Ruby 3.0.3](https://img.shields.io/badge/Ruby-%3E%3D3.0.3-red) ![Rails 6.1.4.6](https://img.shields.io/badge/Rails-6.1.4.6-red) ![Yarn 1.22.10](https://img.shields.io/badge/Yarn-1.22.10-%232188b6%3B) ![PostgrSQL 12.9](https://img.shields.io/badge/PostgreSQL-12.9-%23336791) ![Bootstrap 5.1.3](https://img.shields.io/badge/Bootstrap-5.1.3-%236610f2)

## **About the project**

Goal: Create a system that allows a user to input a pickup and delivery addresses and show the actual courier rates.

## **Key Features**

- Allows a user to input a pickup and delivery address and compute the actual courier rates.
- Save a shipment quotation with a pickup and delivery address and view the details along with courier rates at any time.

## **Getting Started**

### **Prerequisites**

The setups steps expect the Builds listed above to be installed on the system

### **Instructions**

These instructions will get you a copy of the project up and running on your local machine

- Clone the repository and navigate to main app directory

```bash
git clone https://github.com/gdperalta/point_a_and_b.git
cd point_a_and_b
```

- Install libraries and dependencies

```bash
bundle install
yarn install
```

- Initialize the database

```bash
rails db:create
rails db:migrate
rails db:seed courier_rates=yes
rails db:seed countries=yes
rails db:seed provinces=yes
rails db:seed cities=yes
```

- Run the server

```bash
rails server
```

## **App Usage**

### **Computing Courier Rates**

Input the addresses that you wish to compute and click compute rates

![Input the addresses][input_address_pic]
![Computed Rates][computed_rates_pic]

Save the quotation and view it anytime you want

![Saved shipment addresses][saved_quotation_pic]

## **ERD**

![ERD][erd_pic]

## **Tests**

The project was tested using `rspec-rails`

Run `rspec` in the terminal to run the tests

## **System dependencies**

### **Gems**

- Rspec-rails 5.0.0
- Factory_bot_rails 6.2.0
- Erb2haml 0.1.5
- haml 5.2.2

## Roadmap

- [ ] Complete and correct the cities database
- [ ] Zip code and address validation

[erd_pic]: docs/img/pointA&B_erd.png
[input_address_pic]: docs/img/input_address_pic.png
[computed_rates_pic]: docs/img/computed_rates.png
[saved_quotation_pic]: docs/img/saved_shipment_quotation.png
