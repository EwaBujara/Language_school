## CodersLab Final Project  `Programming School`
>Spring MVC, Hibernate

*Language School* management application. 

There are three kind of user's *Roles*: `Admin`, `Teacher` and simple `User` - each with various *Privileges*.

On first launch are created automatically:
* `Super-user` with all roles and privileges 
* Group `Bucket` - common for all

Functionalities:
1. New `User` registration
2. Sign in to application
3. `Admin` can:
  * create new groups
  * add links and start public threads in Common Group (called `Bucket`)
  * delete unwanted or inappropriate links, threads, comments.
  * *assign roles and groups for new `Users`*
4. `Teacher` can:
  * add new links in *his groups*
  * add new threads in *his groups*
5. `User` can:
  * comment threads (in Common Group and *his Groups*)
  * edit own profile (except `Roles` and `Groups`)
  * use his groups educational materials
  * see his groups' members list
  * send private message to others

Technologies:
* Spring MVC
* Hibernate 
