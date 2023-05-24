# THE HEALTH CARE ONLINE SYSTEM <a name="about-project"></a>


<!-- | |  | |
|-|-------|-|
| | <img width="647" alt="dest net" src="./app/assets/images/logo.svg"> | | -->


## 📖 Description

> This system will be design to help facilitate the acceptance of medical treatment of people (workers and their dependents) if approved by the organization.
> Helping the companies using the system to easily track and have better accountability with the hospitals and health care center responsible to take care of their workers and dependents
> Having a financial prospective of how much it will cost by the end month
> It will help on eliminating fraud (unauthorized person ) to access on the treatment over the assurance of a given company

## How it will woks  ♻️

1. THE SYSTEM ADMINISTRATOR
The administrator of the system will be the only one responsible of adding different
organization or company that wants to work with our system
  1.1. Each organization registered will have an administration user login account that will help them to register all the person that should receive the medical insurance then uploading them to the cloud and as well sending back the acceptance form that will be a printed approval letter
  1.2. All request of approval of the healthcare bon will be process by only the concerned organization (company) that approved the registration request
  1.3. The organization will be the only one responsible to approve any given healthcare center the right to help them organize the request for  egistration of the dependents of their employees (based on the required needed documents)
  1.4. Each registered person will have a unique identification with a prefix of his or her organization name
  1.5. Every organization(company) will be responsible to give accreditation for hospitals and healthcare center the right of treatment of their employees and dependents
  - register and log in, so that the data is private to them.
  - introduce new transactions associated with a category.
  - see the money spent on each category.
  
### Live Demo 🔗

[Live Demo Link](https://healt-care.herokuapp.com/)

### ERD Diagram 🔗

[ERD Link](https://drawsql.app/teams/chaw-1/diagrams/health-care-online-system)

### Figma Design 🔗

[Figma Link](https://www.figma.com/file/9laAf7LsUI9Zo46W7FXghW/health-care?type=design&node-id=0-1&t=hHkE7USubI9RmBsU-0)


### Usage

### Starting up the Web Server


    % bin/dev 


```bash
$  sudo service postgresql restart # To restart the server

$  rails db:schema:load creates tables and columns within the existing db following schema.rb. This will delete existing data.
$  rails db:setup # does db:create, db:schema:load, db:seed
$  rails db:reset # does db:drop, db:setup. clean the database
$  rails db:migrate:reset # does db:drop, db:create, db:migrate
```

js: yarn build --watch 
css: yarn build:css --watch


- Docs:
* [Tailwind CSS in Rails 7](https://reinteractive.com/articles/tailwind-css-in-rails-7)
* [How to Setup Tailwind 3 on Rails 7](https://dev.to/software_writer/how-to-setup-tailwind-3-on-rails-7-2dbo)

Step 5: Start the Tailwind CLI build process

Run the following command from the root directory of your Rails application. This will watch for the changes in the view files.

```bin
$ npx tailwindcss -i app/assets/stylesheets/application.css -o app/assets/stylesheets/wind.css --watch
```

## 🛠 Built With <a name="built-with"></a> 

This project is build with:

-  ![Ruby](https://img.shields.io/badge/-Ruby-000000?style=flat&logo=ruby&logoColor=red)
-  ![Ruby on Rails](https://img.shields.io/badge/-Ruby_on_Rails-000000?style=flat&logo=ruby-on-rails&logoColor=blue)

<!-- ## 🙏 Acknowledgments <a name="acknowledgements"></a> -->


## 📝 License <a name="license"></a>

- This project is [APACH-2.0](./LICENSE) licensed.

