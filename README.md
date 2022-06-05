Bookit-proof-of-concept

#Overview
This is a proof-of-concept version of a booking app. It combines a very simple (and buggy!) [frontend](https://github.com/honglu2875/Bookit-simple-flask-frontend) and a much more carefully written [backend](https://github.com/honglu2875/Bookit-dbManager). The point is to have a free and open-source replacement for apps like Calendly and Cal.com.

#Why?
The whole industry of booking apps has become unfriendly towards individual users by starting to charge around $12/mo. Some are even under the disguise of 
- "free plans" (Calendly, limiting 1 schedule type per free user) or 
- "open-source" (Cal.com, "having a GitHub repo"!="open-source" and the paywall kicks in when you start using it). 

Of course, a professional grade booking system can justify its price for businesses and organizations. But as an individual, if you have a very simple need like the above, does the difficulty of the implementation justify the $12/mo? Hopefully this tiny project makes a small difference as a self-hosted free solution for our personal booking needs.

#Usage
- First, clone the repo plus all the submodules.
- Second, run `./build.sh`. Follow the instruction and provide all the environment variables
  - CLIENT_ID: Google API client id.
  - CLIENT_SECRET: Google API client secret.	
  - API_KEY: Google API key.	
  - EMAIL: the main host's email address.	
  - REDIRECT_URI: the uri for redirection from google OAuth2
  - POSTGRES_ADDR: (optional, default 'db') the address or name of the postgres server
  - POSTGRES_USER: (optional, default 'postgres') the username for postgres database.
  - POSTGRES_PASSWORD: (optional, default 'password') the password for postgres database.
- Finally, run `docker-compose up`
