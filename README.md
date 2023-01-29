# Mycontrol an MVP of expense control =)

This is a simple project that aims to control your expenses by separating them into groups and accounts, it also sends emails with the accounts due on the day. The dashboard has some basic information. In this system you can add your income and expenses. It also has password validation and email confirmation.

## Stack

- Rails 6.1.7
- ruby 3.0.5
- Postgres

## How to use it?

Basically we have two endpoints, one for import and another where we list movies and series.

## Building application

Ok, so first you must have:

1. Postgres installed.

2. Ruby >= 3.0.5 installed.

3. As we're on the beginning of project, don't forget to right configure your `datatabe.yml`. In the project there are 2 database examples, one for use with Docker and one without Docker.

As soon as you have everything done you can follow


### 1. Building everything

If you want to rock and create your dev environment and data, it's possible to go through the usual way

1. And to *bundle* it with command:
```
bundle install
```

2. Create databases
```
rails db:create
```

3. Run migrations
```
rails db:migrate
```

## How can I use this system?

1. Register the bank that has the account.
2. Register a group of expenses.
3. Register an account, here you can choose whether it is a checking or savings account.

### Scopes

We have 5 base scopes: 

- **/dashboard**
![dash](https://user-images.githubusercontent.com/28460996/215345210-d6684027-41c7-4184-9051-cfe91942df30.png)

- **/dashboard/banks**
![banks](https://user-images.githubusercontent.com/28460996/215345219-382dd98f-cbbd-49b9-92df-0d38eea88241.png)

- **/dashboard/groups**
![groups](https://user-images.githubusercontent.com/28460996/215345264-ddc83a2a-77bc-4f21-b60e-fe61e84104e1.png)

- **/dashboard/accounts**
![accounts](https://user-images.githubusercontent.com/28460996/215345279-541cc08b-805d-4b87-a334-e7f9998e9f63.png)

- **/dashboard/financials/list_transction**
![transactions](https://user-images.githubusercontent.com/28460996/215345292-ad0ca648-38fe-4c3e-a18c-ab06fed84c20.png)
   
Exemple sending email:
![email](https://user-images.githubusercontent.com/28460996/215345424-0cc6df69-385c-4c77-9cfc-a88b8a1f99f9.png)
