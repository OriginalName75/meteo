# A Social Weather Network 

The main goal of this project is to develop a social website, allowing users to exchange and store data on the weather, and to automatically integrated data from weather stations, distributed at different points in France, and elsewhere in the world. Indeed, different kind of amateurs, like surfers, but also professionals, need access to weather data in real time in specific places. Moreover, different communities are using currently their own tools to access to the data they need (for example the wind force) but they do not have a tool to share them quickly, between members of their own community. Hence, a website which can store all the data can be useful not only to share data inside a community but also between multiple ones.

To make it work, the first goal is to offer users a tool in common that can measure weather data in real time in specific places. Of course, this tool must be quick and easy to use and install, so that users will not be discouraged. That is why a Raspberry Pi has been chosen to accomplish this task. As a matter of fact, a Raspberry Pi is quite small (a hand size), and simple to customize. It is portable and different kind of sensors can be added. In addition, to make the site attractive, a lot of user are needed to nourish the database. Thus, a low price of the sensors tool is crucial, which is the case of a Raspberry Pi which is quite cheap.

Today, the Raspberry Pi is composed of several sensors including temperature, atmospheric pressure and humidity sensors. But in the future, more devices can be added.

The second goal is to implement a website, to automatically collect the data from the Raspberry Pi. Storing data can also be done with the help of another websites like Windguru.cz. Furthermore, the website can have his own API to share its data with another website. One of the main goal here is to make the data simply accessible in many platforms (PCs, tablets and phones). Furthermore, the website is coded in Ruby on Rails and in JavaScript, and it will be in a server which is not close to the Raspberry Pi sensors, that is why a system which collects the data, in a dynamic distance, is needed. 


