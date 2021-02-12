# Olivia's Kitchen
This is an Flutter demo application to demonstrate how to use mobx to perform global state management.

# Screenshots
![Home](https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/home.jpg?token=ASSHTJZTXTYB3J6Y77JZCRLAEXZSA) | ![Detail](https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/detail.jpg?token=ASSHTJ4JX3WKKVNVY72DO43AEXZUI)
![Cart](https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/cart.jpg?token=ASSHTJZDCCM66VR55BTGBHDAEX2QA) | ![Checkout](https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/checkout.jpg?token=ASSHTJ4OGHKISJAM6SUDOADAEX2RK)

<img src="screenshots/home.jpg" width="360" height="720">

<table>
  <tr>
    <td> 
        <img src="https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/home.jpg?token=ASSHTJZTXTYB3J6Y77JZCRLAEXZSA" alt="1" width ="360px" height="640px">
    </td>

    <td>
        <img src="https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/detail.jpg?token=ASSHTJ4JX3WKKVNVY72DO43AEXZUI" alt="2" width = 360px height = 640px>
    </td>
  </tr> 
  <tr>
      <td><img src="https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/cart.jpg?token=ASSHTJ2HAB3H4G5OUXDKE7TAEXZVM" alt="3" width = 360px height = 640px></td>

      <td><img src="https://raw.githubusercontent.com/nc7fb863cr/Flutter-Cuisine/main/screenshots/checkout.jpg?token=ASSHTJ4F6CF72C22XXMY3CTAEXZWMg" align="right" alt="4" width = 360px height = 640px></td>
  </tr>
</table>

# Introduction
This application is basically consisted of four screens: Home, Detail, Cart, and Checkout.<br>

The home page displays the food, and offers some conditions for search.<br>

Once the food is clicked, the application pushs the detail page showing the ingredient index of the food. You can choose the number of servings you want to order, and place the order.<br>

You will be taken to the home page once you place your order, now you can see the shopping cart in the top left side can be pressed, and when you press the icon, it takes you to the cart page.<br>

In the cart page, you can see a list of food you ordered earlier, you can press the card to modify it, or you can either press the checkout button to go to the checkout page.<br>

In the checkout page, you see the bill and the total of the ingredients index. Press the "Go To Homepage" button to navigate back to the home page.<br>

# Dependencies
 - [provider](https://pub.dev/packages/provider)
 - [mobx](https://pub.dev/packages/mobx)
 - [flutter_mobx](https://pub.dev/packages/flutter_mobx)
 - [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

# Resources
 - [unsplash](https://unsplash.com/s/photos/unleash)
 - [flaticons](https://www.flaticon.com/)
 - [freepik](https://www.freepik.com/)

# Installation
Type in the commands below to your terminal to initialize this application.

```bash
flutter pub get
```

```bash
flutter packages pub run build_runner build  --delete-conflicting-outputs
```



