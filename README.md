From [oauth2-simplified](https://aaronparecki.com/2012/07/29/2/oauth2-simplified)

##Roles
###The Third-Party Application: "Client"

The client is the application that is attempting to get access to the user's account. It needs to get permission from the user before it can do so.

###The API: "Resource Server"

The resource server is the API server used to access the user's information.

###The User: "Resource Owner"

The resource owner is the person who is giving access to some portion of their account.

##Mapped to the web shop app

###Client = Web Shop
The web shop wants access to the user's account.
With OAuth2 this can be done without sharing the user's password with the application.
Handling of the OAuth flow can be done in the webapp, or in the Zuul gateway.

###Resource Server = Category/Item Microservices
Downstream composite or core microservices are resource servers,
that can use a OAuth2 token to verify a user is authenticated.


[Oauth2-spring](https://spring.io/guides/tutorials/spring-boot-oauth2/#_social_login_custom_error)
[spring sample app](https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2)