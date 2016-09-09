# Terebinth
_Terebinth_ is a largely notional personal project. This repo is a boilerplate for publishing a website hosted on Heroku, with ReactJS, using CoffeeScript, RxJS, and some combination of CSS->flexbox and SVGs.


## new website pattern
_inheriting from and a version update on [yari-ashi-zero site]()_

### evolutions, some changes


##### SVG only some things:
Working recently with React-Native, I was very impressed with flexbox CSS rules, and so will be backing off of my previous SVG-all-the-things ideas.  Still plan to use SVGs, but only for demanding custom graphic components, instead of the entire layout being under the SVG all the way up and down.

##### Redux out RxJs based solutions in.
I love Redux for its simplicity and effectiveness, but really want to see if there isn't something that can help us wire up our state management with less boilerplate.  _And_ I really want to learn and master Functional-Reactive-Programming (FRP) generally.  Big scary acronym and buzzword, but the ideas behind it hold great promise and so in all my side projects I'm crash-coursing [rxjs](http://reactivex.io/rxjs/).

##### That means no Redux-router

Since there won't be Redux, there won't be Redux router, which means making a home-rolled routing setup using the BrowserHistory API.  One great feature about the yari-ashi-zero site was the dynamic webpack definitions and routing, that if I wanted to add a blog entry, I just needed to create the file, and all the routing and even additions to the index page would happen as if by magic.  We need to see if we can replicate this efficiency in the new build pattern, whatever that turns out to be.  

dynamic requires:
See the yari-ashi-zero repo and look in `routes.coffee`, to see the dynamic requires `require.context`


### Possible R&D

- If free versions can support Redis connections (maybe to free Redis instances)
- If free versions can run Primus/Ws websocket server.



## DevOps procedures.

2 webpack files, default for development and 'prod' for production.  

#### development:

`webpack -w`
`nodemon -x server.coffee` or some variation as needed
Open browser to localhost whatever port


#### production:

`webpack -w --uglify --config prod.webpack.config.coffee` or some such variation as needed.
`NODE_ENV=production coffee server.coffee`
Open browser to localhost produciton port and confirm that production version is working okay.
Then push to Github, then visit Heroku dash and pull per the link instructions.
