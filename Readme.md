<a name="readme-top"></a>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Recipe App\] ](#-recipe-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Database creation](#database-creation)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [or :](#or-)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 <a name="about-project"></a>

---

  <ul>
    <li>View Recipes for the logged in user </li>
    <li>logged in user can delete their recipes</li>
    <li>Logged in user can add new recipes</li>   
    <li>Logged in user can make the recipe public or private</li> 
    <li>Public recipes can be viewed by any user</li>
  </ul>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Add new recipes**
- **Delete recipes**
- **Make recipe public or private**
- **generate shopping list for missing ingredients in the inventory**
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

> You need the following tools be installed in your computer:

> - [Rails](https://guides.rubyonrails.org/)
> - [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
> - [Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/articles/ruby_installation_instructions.md)
> - IDE
> - PostgreSQL
> - Node.js

### Setup

Clone this repository to your desired folder:

```sh

  git clone git@github.com:mohisa302/Recipe-app.git
   cd Recipe-app
```

### Install

Install this project with:

```sh
  cd Recipe-app

  bundle install
```

### Database creation

Next, use this command to create the databases:

```
rails db:create
rails db:migrate
```

### Usage

To run the project, execute the following command:

```sh
  rails server or rails s
```

### Run tests

To run tests, run the following command:

before you run the tests

```
rails db:seed RAILS_ENV=test
```

```sh
  rspec spec/
```

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Mohi**

- GitHub: [@rachelwebdev](https://github.com/Rachelwebdev)
- Twitter:[@rachelisaac13](https://twitter.com/Rachelisaac13)
- LinkedIn: [Rachel Isaac](https://www.linkedin.com/in/rachelisaac13/)

👤 **Christian Hakizimana**

- GitHub: [@githubhandle](https://github.com/hakichris)
- Twitter: [@twitterhandle](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://linkedin.com/in/hakichris)

👤**Chukwuemeka Ochuba**

- GitHub: [@AyoMoses1](https://github.com/AyoMoses1)
- Twitter: [@AyoMoses](https://twitter.com/Ayo_Moses1)
- LinkedIn: [Ayo Moses](https://www.linkedin.com/in/ayomoses/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Edit Reccipes**
- [ ] **Edit Price of ingredient**
- [ ] **Edit ingredients**
- [ ] **Edit shopping list**
- [ ] **Track cooking times**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Rachelwebdev/recipe-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give a⭐️ and share with your friends.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Thanks to the Microverse team for the great curriculum.
- Hat tip to our very own chef Hilda Bassey for the inspiration

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/Rachelwebdev/recipe-app/blob/develop/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
