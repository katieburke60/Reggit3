

comments = Comment.create([
  { description: 'comment comment comment comment', citizen_id: 1, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 2, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 5, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 2, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 4, action_id: 10 },
  { description: 'comment comment comment comment', citizen_id: 4, action_id: 5 },
  { description: 'comment comment comment comment', citizen_id: 3, action_id: 5 },
  { description: 'comment comment comment comment', citizen_id: 3, action_id: 4 },
  { description: 'comment comment comment comment', citizen_id: 5, action_id: 3 },
  { description: 'comment comment comment comment', citizen_id: 1, action_id: 2 },
  { description: 'comment comment comment comment', citizen_id: 2, action_id: 2 },
  { description: 'comment comment comment comment', citizen_id: 4, action_id: 2 },
  { description: 'comment comment comment comment', citizen_id: 4, action_id: 3 },
  { description: 'comment comment comment comment', citizen_id: 8, action_id: 4 },
  { description: 'comment comment comment comment', citizen_id: 10, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 7, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 6, action_id: 1 },
  { description: 'comment comment comment comment', citizen_id: 6, action_id: 10 },
  { description: 'comment comment comment comment', citizen_id: 6, action_id: 9 },
  { description: 'comment comment comment comment', citizen_id: 7, action_id: 9 },
  { description: 'comment comment comment comment', citizen_id: 7, action_id: 8 },
  { description: 'comment comment comment comment', citizen_id: 10, action_id: 8 },
  { description: 'comment comment comment comment', citizen_id: 10, action_id: 6 },
  { description: 'comment comment comment comment', citizen_id: 10, action_id: 7 },
  { description: 'comment comment comment comment', citizen_id: 9, action_id: 7 },
  { description: 'comment comment comment comment', citizen_id: 8, action_id: 7 }
  ])

  accounts = Account.create([
  {email: 'email1@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email2@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email3@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email4@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email5@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email6@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email7@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email8@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email9@sample.com', password: 'password', password_confirmation: 'password'},
  {email: 'email0@sample.com', password: 'password', password_confirmation: 'password'}
  ])

  citizens = Citizen.create([
       {account_id: 1,name: 'Luke', location:'NJ', age:28, gender:'m'},
       {account_id:2,name: 'Laia', location:'NY', age:38, gender:'f'},
       {account_id:3,name: 'Lisa', location:'MD', age:18, gender:'f'},
       {account_id:4,name: 'Chewie', location:'ND', age:25, gender:'m'},
       {account_id:5,name: 'Marge', location:'MO', age:35, gender:'f'},
       {account_id:6,name: 'Frank', location:'NY', age:28, gender:'m'},
       {account_id:7,name: 'Homer', location:'CA', age:42, gender:'m'},
       {account_id:8,name: 'Scott', location:'TX', age:20, gender:'m'},
       {account_id:9,name: 'Bart', location:'CO', age:18, gender:'m'},
       {account_id:10,name: 'Moe', location:'MN', age:28, gender:'m'}
       ])

 votes = Vote.create([

    {vote: "down",citizen_id:2,action_id:1},
    {vote: "down",citizen_id:5,action_id:1},
    {vote: "up",citizen_id:15,action_id:1},
    {vote: "down",citizen_id:4,action_id:1},
    {vote: "up",citizen_id:8,action_id:1},
    {vote: "up",citizen_id:3,action_id:2},
    {vote: "up",citizen_id:5,action_id:2},
    {vote: "up",citizen_id:19,action_id:2},
    {vote: "up",citizen_id:1,action_id:3},
    {vote: "up",citizen_id:2,action_id:3},
    {vote: "up",citizen_id:17,action_id:3},
    {vote: "up",citizen_id:18,action_id:3},
    {vote: "up",citizen_id:6,action_id:4},
    {vote: "up",citizen_id:1,action_id:4},
    {vote: "up",citizen_id:3,action_id:4},
    {vote: "up",citizen_id:7,action_id:4},
    {vote: "up",citizen_id:9,action_id:5},
    {vote: "up",citizen_id:10,action_id:5},
    {vote: "up",citizen_id:11,action_id:5},
    {vote: "up",citizen_id:12,action_id:2},
    {vote: "up",citizen_id:13,action_id:5},
    {vote: "up",citizen_id:14,action_id:5},
    {vote: "up",citizen_id:16,action_id:5},
])
categories = Category.create ([
  {name: "education"},
  {name: "not-included"},
  {name: "health"},
  {name: "transportation"},
  {name: "labor"},
  {name: "security"},
  {name: "energy"},
  {name: "veterans"},
  {name: "finance"},
  {name: "housing"},
  {name: "foreign_policy"},
  {name: "law_and_justice"},
])
