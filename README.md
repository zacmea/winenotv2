# Unit 4 Project - Wine? Wine not? &emsp; &emsp; [(live on Netlify)](https://wine-wine-not.netlify.app/)
**Purpose**: Design & build a mobile-first web-app that allows users to create lists of wines for different settings/occasions

![Screenshot 2024-06-14 at 3 04 00 PM](https://github.com/zacmea/winenotv2/assets/152098774/b9e0140c-59fb-47a2-9420-b81f5638021a)

-->> NOTE: This repo was cloned off of commit 30c8e73 to [the original repo](https://github.com/zacmea/winenotv1pt0).  The full commit history is available there, including commits beyond 30c8e73 that weren't working.

## Technologies Used
- PSQL
- Django
- Vue.js
- Tailwind CSS
- Netlify (front end deploy)
- Render (back end & database)

## Installation Instructions
1) Fork & clone down this repo.
2) CD into WineNotFrontEnd & run 'npm i' to install front-end dependencies.
3) CD into root directory & run 'source winenot_backend/venv/bin/activate' to start virtual environment.
4) With venv running, CD into winenot_backend and run 'pip install requirements.txt' to install back-end dependencies.
5) Create a PSQL database
6) Open 'winenot_backend/winenot_backend/settings.py and adjust the WEBSITE_URL and the DATABASE connection information to match your instance (eg: 'http://localhost:5173').

## User Stories
- As a wine lover, I can find new wines to try by searching or browsing
- AAU, I can create lists/collections of wines and add new wines to them
- AAU, I can follow a link to an external site to purchase a wine to try
- AAU, I can view information about a specific wine
- AAU, I can view & edit my personal/profile information


## Wire Frames
![Screenshot 2024-05-23 at 8 30 41 PM](https://media.git.generalassemb.ly/user/51556/files/a802375b-621f-42c8-a3df-cdef7c6e3547)
![Screenshot 2024-05-23 at 8 31 03 PM](https://media.git.generalassemb.ly/user/51556/files/0a45b781-8609-4bab-8bf4-28d9d7c40755)
![Screenshot 2024-05-23 at 8 41 02 PM](https://media.git.generalassemb.ly/user/51556/files/9b13a0ae-295f-4fad-8771-c2be3bf77116)


## Creation & Ideation Processes
I began by referring back to [the first iteration of this project](https://github.com/zacmea/project2), written with JS, Express.js, & Node.js.  I reconsidered the user needs and opted to use a more scaled back design.  I then generated the [simple ERD](https://miro.com/app/board/uXjVKDqe8z4=/?share_link_id=794623685912) and next built the [Trello board](https://trello.com/b/1iNPoNx9/wine-not) while I sketched wireframes.
I then began work on the authentication and login/signup views, and from there built out the rest of the pages with limited functionality.  Once all core pages were correctly connected and the front/back data exchange was solidified, additional functionality was added.

## Unresolved Issues / Major Hurdles
1) Having never deployed a Django app, Vue app, or SQL database, the deployment took over a week to achieve.  Difficulties in that are the reason the original repo was abandoned.
2) Users cannot currently search for wines in the database.  This functionality to come.
3) Users cannot yet edit or delete their profile.
4) As of yet, users cannot share/make public their collections.
5) The app does not currently connect to an external API/3rd-party database as originally intended.
6) Images for wines are not currently utilized.  Upcoming.


### External Resources, References, & Supports
1) Word choice - https://m3.material.io/foundations/content-design/style-guide/word-choice
2) First vs 2nd person - https://ux.stackexchange.com/questions/4348/your-vs-my-in-user-interfaces
3) Vue tutorial/lesson - https://www.codecademy.com/learn/learn-vue-js
4) Authentication & login/signup views - https://www.youtube.com/@CodeWithStein
5) Icons - https://heroicons.com/
6) Debugging and general information - ChatGPT, StackOverflow, documentation for the various technologies,
7) An extra special thanks to classmates Wick Hill & David Lesesne, and instructors Billie Heidelberg & Justin White for their patience, moral support, and debugging help. This project (and maybe the dev) wouldn't have survived without them.
