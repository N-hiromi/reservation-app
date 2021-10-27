user1= User.create!(
   user_name: "test1",
   intro: "旅行に行きたい",
   email: "test1@com",
   password: "test1pass"
)
user2= User.create!(
   user_name: "test2",
   intro: "黒い鳩です",
   email: "test2@com",
   password: "test2pass"
)
user1.image.attach(io: File.open(Rails.root.join('app/assets/images/1.jpg')),filename: '1.jpg')
user2.image.attach(io: File.open(Rails.root.join('app/assets/images/1.jpg')),filename: '1.jpg')

rental1= Rental.create!(
    room: "最高級の部屋",
    area: "東京都",
    address: "葛飾区",
    price: 10000,
    description: "とても良いところ",
    owner_id: 1
 )
 rental2= Rental.create!(
    room: "高級な部屋",
    area: "神奈川県",
    address: "幸区",
    price: 7000,
    description: "すごく良いところ",
    owner_id: 2
 )
 rental3= Rental.create!(
    room: "普通の部屋",
    area: "静岡県",
    address: "袋井市",
    price: 5000,
    description: "普通な部屋です。安さがウリ",
    owner_id: 1
 )
 rental4= Rental.create!(
   room: "それなりの部屋",
   area: "静岡県",
   address: "花鳥園",
   price: 3000,
   description: "とても安いですが、狭いです",
   owner_id: 1
)
rental5= Rental.create!(
   room: "まあまあな部屋",
   area: "静岡県",
   address: "まあ良いところ",
   price: 100,
   description: "事故物件です",
   owner_id: 1
)
 rental1.image.attach(io: File.open(Rails.root.join('app/assets/images/bedroom-gbef09cfe8_640.jpg')),filename: 'bedroom-gbef09cfe8_640.jpg')
 rental2.image.attach(io: File.open(Rails.root.join('app/assets/images/interior-gd6632eb19_640.jpg')),filename: 'interior-gd6632eb19_640.jpg')
 rental3.image.attach(io: File.open(Rails.root.join('app/assets/images/desk-g8c79a67d7_640.jpg')),filename: 'desk-g8c79a67d7_640.jpg')
 rental4.image.attach(io: File.open(Rails.root.join('app/assets/images/chairs-g93c2a7dd9_640.jpg')),filename: 'chairs-g93c2a7dd9_640.jpg')
 rental5.image.attach(io: File.open(Rails.root.join('app/assets/images/lake-gd08774b81_1280.jpg')),filename: 'lake-gd08774b81_1280.jpg')
reservation1= Reservation.create!(
    user_id: 1,
    check_in: "2021/7/1",
    check_out: "2021/7/2",
    num_date: 1,
    num_people: 2,
    price: 2000,
    total: 4000,
    rental_id: 1
 )
reservation2= Reservation.create!(
    user_id: 2,
    check_in: "2021/7/3",
    check_out: "2021/7/4",
    num_date: 3,
    num_people: 3,
    price: 1000,
    total: 9000,
    rental_id: 2
 )
