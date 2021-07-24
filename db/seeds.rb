Rental.create!(
    room: "はと小屋",
    area: "東京都",
    address: "花鳥園",
    price: 3000,
    description: "とても良いところ",
    room_image: "",
    owner_id: 1
 )
 Rental.create!(
    room: "すごい小屋",
    area: "神奈川県",
    address: "動物園",
    price: 5000,
    description: "すごく良いところ",
    room_image: "",
    owner_id: 2
 )
 Rental.create!(
    room: "ふつうの小屋",
    area: "静岡県",
    address: "高級な花鳥園",
    price: 1000,
    description: "良いところ",
    room_image: "",
    owner_id: 1
 )
User.create!(
    user_name: "やっちゃん",
    user_image: "",
    intro: "うちの可愛い白い鳩です",
    email: "yattyan@mail",
    password: "yattyan"
 )
User.create!(
    user_name: "なみなみ",
    user_image: "",
    intro: "うちの可愛い黒い鳩です",
    email: "naminami@mail",
    password: "naminami"
 )
Reservation.create!(
    user_name: "なみなみ",
    check_in: "2021/7/1",
    check_out: "2021/7/2",
    num_date: "",
    num_people: 2,
    price: "",
    total: ""
 )
Reservation.create!(
    user_name: "やっちゃん",
    check_in: "2021/7/3",
    check_out: "2021/7/4",
    num_date: "",
    num_people: 3,
    price: "",
    total: ""
 )
 