# What I Built and Why

## The Big Picture

### 1. Getting Data Out of Excel
First things first - I wanted to get all that spreadsheet data into a database. Getting this data into a proper database was my first priority because this is the foundation for all the future work

### 2. Making It Ready to Go
I know the people in the restaurant using this aren't tech focussed. That's why I made sure to pre-load all the existing data into the system with the database seeds. This prevents the need to manually typing in a bunch of numbers or details (maybe error prone). This way, everyone can hit the ground running on day one.

### 3. Basic Inventory Stuff
For the actual inventory management, I kept it simple:
- Made a straightforward responsive UI so it should just work on desktops/mobiles/tablets etc.
- Let people update items manually (just like they were doing in Excel)
- But now with added basic structure and tracking to make sure we know what's changing

### Why We Used the Audited Gem
I could have built bespoke modelling to handle the auditing, but why reinvent the wheel? The audited gem does everything needed here - it means we don't have to maintain our own audit code.

## What's Next?
This is really just the beginning, just the starting foundation. Next we can start adding lots more functionality:
- Automated inventory management
- Hooking up with other systems
  - POS for automated management of stock managing menu avaiability etc
- Introducting reporting


My goal here was to keep it simple but solid - something that works now but gives us room to grow.
