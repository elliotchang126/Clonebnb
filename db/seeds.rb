# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

pool_listings = []
view_listings = []
beachfront_listings = []
cabin_listings = []
countryside_listings = []
design_listings = []
iconic_listings = []
lakeside_listings = []
mansions_listings = []
omg_listings = []

ApplicationRecord.transaction do
    puts 'Destroying tables...'

    User.destroy_all
    Listing.destroy_all

    puts 'Resetting primary keys'
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('listings')

    puts "Creating users..."

    #demo user
    User.create!(
        email: 'demo@demo.io', 
        password: 'password',
        first_name: 'Demo',
        last_name: 'User'
    )

    20.times do
        User.create!(
            email: Faker::Internet.unique.email,
            password: Faker::Internet.password(min_length: 6, max_length: 20),
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name
        )
    end

    puts "Done!"

    puts 'Creating listings...'

    # listing 1
    listing1 = Listing.create!(
        user_id: 1,
        category: 'amazing pools',
        address: '2654 Greenwich St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94123,
        title: 'Spacious Large Home with a Pool',
        description: 'Come enjoy our spacious home in San Francisco, CA. It has everything you need for a nice relaxing getaway for the weekend, and even a pool to enjoy! We have all the standard amenities such as WiFi, a kitchen, and more. This 5 bedroom, 4 bathroom house will definitely be fun for family and friends.',
        bedrooms: 5,
        bathrooms: 4,
        price: 595,
        cleaning_fee: 200,
        latitude: 37.7979887,
        longitude: -122.4448766
    )

    pool_listings << listing1

    # file1 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-1.png')
    # file2 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-2.png')
    # file3 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-3.png')
    # file4 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-4.png')
    # file5 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-5.png')

    # listing1.photos.attach(io: file1, filename: 'amazingpools-1-1.png')
    # listing1.photos.attach(io: file2, filename: 'amazingpools-1-2.png')
    # listing1.photos.attach(io: file3, filename: 'amazingpools-1-3.png')
    # listing1.photos.attach(io: file4, filename: 'amazingpools-1-4.png')
    # listing1.photos.attach(io: file5, filename: 'amazingpools-1-5.png')

    # listing 2
    listing2 = Listing.create!(
        user_id: 2,
        category: 'amazing pools',
        address: '3070 25th Ave',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94132,
        title: 'Perfect Weekend Getaway in San Francisco',
        description: 'A rare find in San Francisco, our home has a large yard with a pool! Our 5 bedroom, 4 bathroom home is tucked away for a vacation with lush trees. Enjoy dining in the backyard while the kids play in the pool. Recently remodeled for all your modern needs and comfort.',
        bedrooms: 4,
        bathrooms: 3,
        price: 350,
        cleaning_fee: 150,
        latitude: 37.7311859,
        longitude: -122.481257
    )

    pool_listings << listing2

    # file6 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-1.png')
    # file7 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-2.png')
    # file8 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-3.png')
    # file9 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-4.png')
    # file10 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-5.png')

    # listing2.photos.attach(io: file6, filename: 'amazingpools-2-1.png')
    # listing2.photos.attach(io: file7, filename: 'amazingpools-2-2.png')
    # listing2.photos.attach(io: file8, filename: 'amazingpools-2-3.png')
    # listing2.photos.attach(io: file9, filename: 'amazingpools-2-4.png')
    # listing2.photos.attach(io: file10, filename: 'amazingpools-2-5.png')

        # listing 3
    listing3 = Listing.create!(
        user_id: 3,
        category: 'amazing views',
        address: '122 Alta Vista Way',
        city: 'Daly City',
        state: 'California',
        country: 'United States',
        zip_code: 94014,
        title: 'Cozy House with a Stunning View',
        description: "You can't beat our cozy little home in the hills. A 2 bedroom, 1 bathroom with an amazing view of the hills from just outside the bedroom windows. You and your partner won't want to miss your little retreat. The home is stocked full of any amenities you need, from WiFi to free coffee!",
        bedrooms: 2,
        bathrooms: 1,
        price: 245,
        cleaning_fee: 100,
        latitude: 37.704952,
        longitude: -122.4368568
    )

    view_listings << listing3

    # file11 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingpools-1-1.png')
    # file12 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-2.png')
    # file13 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-3.png')
    # file14 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-4.png')
    # file15 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-5.png')
    
    # listing3.photos.attach(io: file11, filename: 'amazingviews-1-1.png')
    # listing3.photos.attach(io: file12, filename: 'amazingviews-1-2.png')
    # listing3.photos.attach(io: file13, filename: 'amazingviews-1-3.png')
    # listing3.photos.attach(io: file14, filename: 'amazingviews-1-4.png')
    # listing3.photos.attach(io: file15, filename: 'amazingviews-1-5.png')
    
        # listing 4
    listing4 = Listing.create!(
        user_id: 4,
        category: 'amazing views',
        address: '45 26th Ave',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94121,
        title: 'Amazing Coastline view from the Terrace',
        description: 'Live in comfort in our lovely home in the trees and drink coffee on the terrace staring out into the ocean. Our 3 bedroom, 2 bathroom house gives you the best view in all of San Francisco. Surrounded by nature, take in the sights of the waves crashing ashore or the forest green trees surrounding our home.',
        bedrooms: 3,
        bathrooms: 2,
        price: 300,
        cleaning_fee: 150,
        latitude: 37.7879,
        longitude: -122.4865757
    )

    view_listings << listing4

    # file16 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-1.png')
    # file17 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-2.png')
    # file18 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-3.png')
    # file19 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-4.png')
    # file20 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-5.png')
    
    # listing4.photos.attach(io: file16, filename: 'amazingviews-2-1.png')
    # listing4.photos.attach(io: file17, filename: 'amazingviews-2-2.png')
    # listing4.photos.attach(io: file18, filename: 'amazingviews-2-3.png')
    # listing4.photos.attach(io: file19, filename: 'amazingviews-2-4.png')
    # listing4.photos.attach(io: file20, filename: 'amazingviews-2-5.png')
    
        # listing 5
    listing5 = Listing.create!(
        user_id: 5,
        category: 'beachfront',
        address: '762 Great Hwy',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94121,
        title: 'Beachfront Home in San Francisco',
        description: "No need to be afraid of the cold, our lovely 6 bed 4 bath home sits right at the coast. Once the fog rolls in, stroll right back to our home and enjoy all it's offerings. If the weather is nice, drink your morning coffee right in the backyard and listen to the calm ocean waves. 3 stories worth of fun for the family!",
        bedrooms: 6,
        bathrooms: 4,
        price: 595,
        cleaning_fee: 250,
        latitude: 37.7732908,
        longitude: -122.5110819
    )

    beachfront_listings << listing5

    # file21 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-1.png')
    # file22 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-2.png')
    # file23 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/aeachfront/beachfront-1-3.png')
    # file24 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-4.png')
    # file25 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-5.png')
    
    # listing5.photos.attach(io: file21, filename: 'beachfront-1-1.png')
    # listing5.photos.attach(io: file22, filename: 'beachfront-1-2.png')
    # listing5.photos.attach(io: file23, filename: 'beachfront-1-3.png')
    # listing5.photos.attach(io: file24, filename: 'beachfront-1-4.png')
    # listing5.photos.attach(io: file25, filename: 'beachfront-1-5.png')
    
        # listing 6
    listing6 = Listing.create!(
        user_id: 6,
        category: 'beachfront',
        address: '215 Marina Blvd',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94123,
        title: 'Wide Beach Views from the Bedroom',
        description: "You can't beat waking up to our stunning view of the beach, right from your bed! Our 4 bed 3 bath home is in the perfect location in San Francisco, easy to travel to all your destinations. The interior has been renovated with a modern touch, you'll love it.",
        bedrooms: 4,
        bathrooms: 3,
        price: 650,
        cleaning_fee: 250,
        latitude: 37.8062447,
        longitude: -122.4364991
    )

    beachfront_listings << listing6

    # file26 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-1.png')
    # file27 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-2.png')
    # file28 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-3.png')
    # file29 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-4.png')
    # file30 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-5.png')
    
    # listing6.photos.attach(io: file26, filename: 'beachfront-2-1.png')
    # listing6.photos.attach(io: file27, filename: 'beachfront-2-2.png')
    # listing6.photos.attach(io: file28, filename: 'beachfront-2-3.png')
    # listing6.photos.attach(io: file29, filename: 'beachfront-2-4.png')
    # listing6.photos.attach(io: file30, filename: 'beachfront-2-5.png')
    
        # listing 7
    listing7 = Listing.create!(
        user_id: 7,
        category: 'cabin',
        address: '962 Lincoln Blvd',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94129,
        title: 'Cozy 2 Story Cabin by the Trees',
        description: "You'd never expect to find a home in the tall trees right in San Francisco, but here it is! Our 3 bedroom 2 bathroom home let's you have a quick getaway right in San Francisco. The cozy cabin interior will make you think you've been transported in the middle of a redwood forest.",
        bedrooms: 3,
        bathrooms: 2,
        price: 200,
        cleaning_fee: 75,
        latitude: 37.8066231,
        longitude: -122.4733352
    )

    cabin_listings << listing7

    # file31 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-1.png')
    # file32 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-2.png')
    # file33 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-3.png')
    # file34 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-4.png')
    # file35 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-5.png')
    
    # listing7.photos.attach(io: file31, filename: 'cabin-1-1.png')
    # listing7.photos.attach(io: file32, filename: 'cabin-1-2.png')
    # listing7.photos.attach(io: file33, filename: 'cabin-1-3.png')
    # listing7.photos.attach(io: file34, filename: 'cabin-1-4.png')
    # listing7.photos.attach(io: file35, filename: 'cabin-1-5.png')
    
        # listing  8
    listing8 = Listing.create!(
        user_id: 8,
        category: 'cabin',
        address: '607 McReynolds Rd',
        city: 'Sausalito',
        state: 'California',
        country: 'United States',
        zip_code: 94965,
        title: 'Cabin with a Desert Feel',
        description: "You'll feel like you're all the way in Joshua Tree in our Sausalito home. With wide flat views, our 4 bed 2 bath home is a perfect nature vacation for the family. Fully stocked, so all you need to bring is yourself! Trails are almost right outside your door, with a variety of difficulties for any level of hikers.",
        bedrooms: 4,
        bathrooms: 2,
        price: 310,
        cleaning_fee: 125,
        latitude: 37.8363342,
        longitude: -122.4792593
    )

    cabin_listings << listing8

    # file36 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-1.png')
    # file37 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-2.png')
    # file38 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-3.png')
    # file39 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-4.png')
    # file40 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-5.png')
    
    # listing8.photos.attach(io: file36, filename: 'cabin-2-1.png')
    # listing8.photos.attach(io: file37, filename: 'cabin-2-2.png')
    # listing8.photos.attach(io: file38, filename: 'cabin-2-3.png')
    # listing8.photos.attach(io: file39, filename: 'cabin-2-4.png')
    # listing8.photos.attach(io: file40, filename: 'cabin-2-5.png')
    
        # listing 9
    listing9 = Listing.create!(
        user_id: 9,
        category: 'countryside',
        address: '2332 Leimert Blvd',
        city: 'Oakland',
        state: 'California',
        country: 'United States',
        zip_code: 94602,
        title: 'Domed Unique Home in Oakland',
        description: "Oakland isn't known for being a countryside, but our home will make you feel like you were! Sitting on a hill overlooking the rest of the city, our 3 bedroom, 2 bathroom home will make you feel recharged for the work week. Enjoy our attic-like bedroom with uniquely shaped architecture that you won't find anywhere else.",
        bedrooms: 3,
        bathrooms: 2,
        price: 600,
        cleaning_fee: 200,
        latitude: 37.8158974,
        longitude: -122.210704
    )

    countryside_listings << listing9

    # file41 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-1.png')
    # file42 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-2.png')
    # file43 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-3.png')
    # file44 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-4.png')
    # file45 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-5.png')
    
    # listing9.photos.attach(io: file41, filename: 'countryside-1-1.png')
    # listing9.photos.attach(io: file42, filename: 'countryside-1-2.png')
    # listing9.photos.attach(io: file43, filename: 'countryside-1-3.png')
    # listing9.photos.attach(io: file44, filename: 'countryside-1-4.png')
    # listing9.photos.attach(io: file45, filename: 'countryside-1-5.png')
    
        # listing 10
    listing10 = Listing.create!(
        user_id: 10,
        category: 'countryside',
        address: '31 Capay Cir',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94080,
        title: 'Luxury Wine Country Styled House',
        description: "When you can't make it to Napa Valley, come to our 7 bed 5 bath home instead! With lush greens around you surrounded by a vineyard, you'll think you actually went to Napa Valley. Enjoy relaxing by the pool, or walk right outside and eat dinner right under the trees surrounded by the vines.",
        bedrooms: 7,
        bathrooms: 5,
        price: 650,
        cleaning_fee: 200,
        latitude: 37.6498537,
        longitude: -122.4433525
    )

    countryside_listings << listing10

    # file46 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-1.png')
    # file47 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-2.png')
    # file48 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-3.png')
    # file49 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-4.png')
    # file50 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-5.png')
    
    # listing10.photos.attach(io: file46, filename: 'countryside-2-1.png')
    # listing10.photos.attach(io: file47, filename: 'countryside-2-2.png')
    # listing10.photos.attach(io: file48, filename: 'countryside-2-3.png')
    # listing10.photos.attach(io: file49, filename: 'countryside-2-4.png')
    # listing10.photos.attach(io: file50, filename: 'countryside-2-5.png')
    
        # listing 11
    listing11 = Listing.create!(
        user_id: 11,
        category: 'design',
        address: '155 De Haro St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94103,
        title: 'Modern Home Surrounded by Nature',
        description: 'Sleek, modern, and minimalistic. Our box shaped home surrounded by trees is perfect for a zen-like retreat for couples. Sit in the tub and enjoy nature, or pull the sliding doors open and enjoy a glass of wine. Our 2 bed 1 bath home is perfect for any occasion.',
        bedrooms: 2,
        bathrooms: 1,
        price: 995,
        cleaning_fee: 300,
        latitude: 37.768744,
        longitude: -122.4028469
    )

    design_listings << listing11

    # file51 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-1.png')
    # file52 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-2.png')
    # file53 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-3.png')
    # file54 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-4.png')
    # file55 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-5.png')
    
    # listing11.photos.attach(io: file51, filename: 'design-1-1.png')
    # listing11.photos.attach(io: file52, filename: 'design-1-2.png')
    # listing11.photos.attach(io: file53, filename: 'design-1-3.png')
    # listing11.photos.attach(io: file54, filename: 'design-1-4.png')
    # listing11.photos.attach(io: file55, filename: 'design-1-5.png')
    
        # listing 12
    listing12 = Listing.create!(
        user_id: 12,
        category: 'design',
        address: '2186 Fell St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94117,
        title: 'Modern Barn Styled Home in San Francisco',
        description: 'Completely redone, our 5 bedroom, 3 bathroom modern home will let you relax in luxury. Powered by solar panels, charge your electric car while you enjoy our stunning views. Even has a guest house for any guests that want some piece and quiet away from the rest of the group!',
        bedrooms: 5,
        bathrooms: 3,
        price: 800,
        cleaning_fee: 250,
        latitude: 37.7724016,
        longitude: -122.4540734
    )

    design_listings << listing12

    # file56 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-1.png')
    # file57 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-2.png')
    # file58 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-3.png')
    # file59 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-4.png')
    # file60 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-5.png')
    
    # listing12.photos.attach(io: file56, filename: 'design-2-1.png')
    # listing12.photos.attach(io: file57, filename: 'design-2-2.png')
    # listing12.photos.attach(io: file58, filename: 'design-2-3.png')
    # listing12.photos.attach(io: file59, filename: 'design-2-4.png')
    # listing12.photos.attach(io: file60, filename: 'design-2-5.png')
    
        # listing 13
    listing13 = Listing.create!(
        user_id: 13,
        category: 'iconic cities',
        address: '2839 Pacific Ave',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94115,
        title: 'Moroccan Themed Home with a Pool',
        description: "If you can't go to Morocco, don't worry. We brought Morocco to you! You'll feel like you're living in a palace with our 8 bed, 9 bath home with an incredible pool. The interior is also themed, so live like royalty for your vacation at our home. You'll regret it if you don't!",
        bedrooms: 8,
        bathrooms: 9,
        price: 1200,
        cleaning_fee: 300,
        latitude: 37.7923849,
        longitude: -122.4421848
    )

    iconic_listings << listing13

    # file61 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-1.png')
    # file62 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-2.png')
    # file63 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-3.png')
    # file64 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-4.png')
    # file65 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-5.png')
    
    # listing13.photos.attach(io: file61, filename: 'iconiccities-1-1.png')
    # listing13.photos.attach(io: file62, filename: 'iconiccities-1-2.png')
    # listing13.photos.attach(io: file63, filename: 'iconiccities-1-3.png')
    # listing13.photos.attach(io: file64, filename: 'iconiccities-1-4.png')
    # listing13.photos.attach(io: file65, filename: 'iconiccities-1-5.png')
    
        # listing 14
    listing14 = Listing.create!(
        user_id: 14,
        category: 'iconic cities',
        address: '1332 California St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94109,
        title: 'Rustic and Modern Home in Downtown',
        description: "Enjoy our cozy but modern home right in the heart of Downtown San Francisco. With rooms on the second floor, the first floor is perfect for entertaining inside and in our lovely backyard. You won't find a stay like this anywhere else in San Francisco!",
        bedrooms: 2,
        bathrooms: 1,
        price: 300,
        cleaning_fee: 150,
        latitude: 37.7903566,
        longitude: -122.4258617
    )

    iconic_listings << listing14

    # file66 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-1.png')
    # file67 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-2.png')
    # file68 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-3.png')
    # file69 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-4.png')
    # file70 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-5.png')
    
    # listing14.photos.attach(io: file66, filename: 'iconiccities-2-1.png')
    # listing14.photos.attach(io: file67, filename: 'iconiccities-2-2.png')
    # listing14.photos.attach(io: file68, filename: 'iconiccities-2-3.png')
    # listing14.photos.attach(io: file69, filename: 'iconiccities-2-4.png')
    # listing14.photos.attach(io: file70, filename: 'iconiccities-2-5.png')
    
        # listing 15
    listing15 = Listing.create!(
        user_id: 15,
        category: 'lakeside',
        address: '566 Gellert Dr',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94132,
        title: '2 Story Home Right on the Lake',
        description: 'Come enjoy our 6 bedroom, 4 bathroom lakeside home! Sit in the outdoor jacuzzi while the kids play in the water. Our home comes with anything you need, including a cozy little area to sit right on the dock. Please make an inquiry if you are interested in renting our boat.',
        bedrooms: 6,
        bathrooms: 4,
        price: 500,
        cleaning_fee: 150,
        latitude: 37.7299818,
        longitude: -122.4876728
    )

    lakeside_listings << listing15

    # file71 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-1.png')
    # file72 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-2.png')
    # file73 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-3.png')
    # file74 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-4.png')
    # file75 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-5.png')
    
    # listing15.photos.attach(io: file71, filename: 'lakefront-1-1.png')
    # listing15.photos.attach(io: file72, filename: 'lakefront-1-2.png')
    # listing15.photos.attach(io: file73, filename: 'lakefront-1-3.png')
    # listing15.photos.attach(io: file74, filename: 'lakefront-1-4.png')
    # listing15.photos.attach(io: file75, filename: 'lakefront-1-5.png')
    
        # listing 16
    listing16 = Listing.create!(
        user_id: 16,
        category: 'lakeside',
        address: '1402 Lakeshore Ave',
        city: 'Oakland',
        state: 'California',
        country: 'United States',
        zip_code: 94606,
        title: 'Lovely Lakehouse in Oakland',
        description: 'Right on the lake in Oakland, enjoy the view of the water right from the living room. With tall windows right next to the water, our 5 bed 4 bath home is filled with natural light. You will feel right at home with our cozy interior, and still be able to have fun on the lake!',
        bedrooms: 5,
        bathrooms: 4,
        price: 550,
        cleaning_fee: 200,
        latitude: 37.7996449,
        longitude: -122.2578886
    )

    lakeside_listings << listing16

    # file76 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-1.png')
    # file77 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-2.png')
    # file78 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-3.png')
    # file79 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-4.png')
    # file80 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-5.png')
    
    # listing16.photos.attach(io: file76, filename: 'lakefront-2-1.png')
    # listing16.photos.attach(io: file77, filename: 'lakefront-2-2.png')
    # listing16.photos.attach(io: file78, filename: 'lakefront-2-3.png')
    # listing16.photos.attach(io: file79, filename: 'lakefront-2-4.png')
    # listing16.photos.attach(io: file80, filename: 'lakefront-2-5.png')
    
        # listing 17
    listing17 = Listing.create!(
        user_id: 17,
        category: 'mansions',
        address: '1530 Jones St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94133,
        title: 'Luxury Mansion with a Pool',
        description: "You'll feel like you're in Beverly Hills in our chateau styled home. Walk in to our grand staircase with a beautiful chandelier and walk through to the backyard with our incredible pool. Sunbathe and relax your stress away in our 10 bed 12 bath mansion. No parties allowed.",
        bedrooms: 10,
        bathrooms: 12,
        price: 1600,
        cleaning_fee: 500,
        latitude: 37.7953393,
        longitude: -122.415301
    )

    mansions_listings << listing17

    # file81 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-1.png')
    # file82 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-2.png')
    # file83 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-3.png')
    # file84 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-4.png')
    # file85 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-5.png')
    
    # listing17.photos.attach(io: file81, filename: 'mansion-1-1.png')
    # listing17.photos.attach(io: file82, filename: 'mansion-1-2.png')
    # listing17.photos.attach(io: file83, filename: 'mansion-1-3.png')
    # listing17.photos.attach(io: file84, filename: 'mansion-1-4.png')
    # listing17.photos.attach(io: file85, filename: 'mansion-1-5.png')
    
        # listing 18
    listing18 = Listing.create!(
        user_id: 18,
        category: 'mansions',
        address: '1300 Montgomery St',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94133,
        title: 'Modern Mansion on Green Hills',
        description: "Live like a celebrity in our expansive 12 bedroom, 10 bathroom mansion. Located on the hills in San Francisco, enjoy all the amenities our home has to offer, including an infinity pool! Built in a modern style with wood accents, you'll love our home and all it has to offer.",
        bedrooms: 12,
        bathrooms: 10,
        price: 2000,
        cleaning_fee: 600,
        latitude: 37.8012649,
        longitude: -122.4040532
    )

    mansions_listings << listing18

    # file86 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-1.png')
    # file87 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-2.png')
    # file88 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-3.png')
    # file89 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-4.png')
    # file90 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-5.png')
    
    # listing18.photos.attach(io: file86, filename: 'mansion-2-1.png')
    # listing18.photos.attach(io: file87, filename: 'mansion-2-2.png')
    # listing18.photos.attach(io: file88, filename: 'mansion-2-3.png')
    # listing18.photos.attach(io: file89, filename: 'mansion-2-4.png')
    # listing18.photos.attach(io: file90, filename: 'mansion-2-5.png')
    
        # listing 19
    listing19 = Listing.create!(
        user_id: 19,
        category: 'omg',
        address: '1945 Straits View Dr',
        city: 'Belvedere Tiburon',
        state: 'California',
        country: 'United States',
        zip_code: 94920,
        title: 'Panoramic Box Home on Rocky Hills ',
        description: "Designed by a world-renown architect, this incredible home is built with floor to ceiling windows on every side! The interior is modern and even includes an indoor swimming pool. Any hikers are free to walk any of the trails conveniently located right outside, and you can't miss the stunning views. As featured on Architectural Digest.",
        bedrooms: 10,
        bathrooms: 8,
        price: 1000,
        cleaning_fee: 300,
        latitude: 37.8794086,
        longitude: -122.4491799
    )

    omg_listings << listing19

    # file91 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-1.png')
    # file92 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-2.png')
    # file93 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-3.png')
    # file94 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-4.png')
    # file95 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-5.png')
    
    # listing19.photos.attach(io: file91, filename: 'omg-1-1.png')
    # listing19.photos.attach(io: file92, filename: 'omg-1-2.png')
    # listing19.photos.attach(io: file93, filename: 'omg-1-3.png')
    # listing19.photos.attach(io: file94, filename: 'omg-1-4.png')
    # listing19.photos.attach(io: file95, filename: 'omg-1-5.png')
    
        # listing 20
    listing20 = Listing.create!(
        user_id: 20,
        category: 'omg',
        address: '1 Christmas Tree Point Rd',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94114,
        title: 'Renovated Firewatch Tower in the Trees',
        description: 'Our cozy treehouse is out of this world! A little one bed, one bath home is a short climb up. With a terrace on all sides, you can see all the way to the edge of the forest in our incredible home. Sit by the warm fire when it snows, or enjoy the crisp nature in the summer. Please note that the bathroom is located on the ground',
        bedrooms: 1,
        bathrooms: 1,
        price: 800,
        cleaning_fee: 300,
        latitude: 37.7545089,
        longitude: -122.4472691
    )

    omg_listings << listing20

    # file96 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-1.png')
    # file97 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-2.png')
    # file98 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-3.png')
    # file99 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-4.png')
    # file100 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-5.png')
    
    # listing20.photos.attach(io: file96, filename: 'omg-2-1.png')
    # listing20.photos.attach(io: file97, filename: 'omg-2-2.png')
    # listing20.photos.attach(io: file98, filename: 'omg-2-3.png')
    # listing20.photos.attach(io: file99, filename: 'omg-2-4.png')
    # listing20.photos.attach(io: file100, filename: 'omg-2-5.png')
    
    puts 'Done!'
end

pool_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-#{i + 1}-1.png"), filename: "amazingpools-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-#{i + 1}-2.png"), filename: "amazingpools-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-#{i + 1}-3.png"), filename: "amazingpools-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-#{i + 1}-4.png"), filename: "amazingpools-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-#{i + 1}-5.png"), filename: "amazingpools-#{i + 1}-5.png" }
    ])
end
view_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-#{i + 1}-1.png"), filename: "amazingviews-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-#{i + 1}-2.png"), filename: "amazingviews-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-#{i + 1}-3.png"), filename: "amazingviews-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-#{i + 1}-4.png"), filename: "amazingviews-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-#{i + 1}-5.png"), filename: "amazingviews-#{i + 1}-5.png" }
    ])
end
beachfront_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-#{i + 1}-1.png"), filename: "beachfront-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-#{i + 1}-2.png"), filename: "beachfront-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-#{i + 1}-3.png"), filename: "beachfront-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-#{i + 1}-4.png"), filename: "beachfront-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-#{i + 1}-5.png"), filename: "beachfront-#{i + 1}-5.png" }
    ])
end
cabin_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-#{i + 1}-1.png"), filename: "cabin-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-#{i + 1}-2.png"), filename: "cabin-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-#{i + 1}-3.png"), filename: "cabin-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-#{i + 1}-4.png"), filename: "cabin-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-#{i + 1}-5.png"), filename: "cabin-#{i + 1}-5.png" }
    ])
end
countryside_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-#{i + 1}-1.png"), filename: "countryside-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-#{i + 1}-2.png"), filename: "countryside-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-#{i + 1}-3.png"), filename: "countryside-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-#{i + 1}-4.png"), filename: "countryside-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-#{i + 1}-5.png"), filename: "countryside-#{i + 1}-5.png" }
    ])
end
design_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-#{i + 1}-1.png"), filename: "design-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-#{i + 1}-2.png"), filename: "design-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-#{i + 1}-3.png"), filename: "design-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-#{i + 1}-4.png"), filename: "design-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-#{i + 1}-5.png"), filename: "design-#{i + 1}-5.png" }
    ])
end
iconic_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-#{i + 1}-1.png"), filename: "iconiccities-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-#{i + 1}-2.png"), filename: "iconiccities-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-#{i + 1}-3.png"), filename: "iconiccities-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-#{i + 1}-4.png"), filename: "iconiccities-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-#{i + 1}-5.png"), filename: "iconiccities-#{i + 1}-5.png" }
    ])
end
lakeside_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-#{i + 1}-1.png"), filename: "lakefront-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-#{i + 1}-2.png"), filename: "lakefront-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-#{i + 1}-3.png"), filename: "lakefront-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-#{i + 1}-4.png"), filename: "lakefront-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-#{i + 1}-5.png"), filename: "lakefront-#{i + 1}-5.png" }
    ])
end
mansions_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-#{i + 1}-1.png"), filename: "mansion-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-#{i + 1}-2.png"), filename: "mansion-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-#{i + 1}-3.png"), filename: "mansion-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-#{i + 1}-4.png"), filename: "mansion-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-#{i + 1}-5.png"), filename: "mansion-#{i + 1}-5.png" }
    ])
end
omg_listings.each_with_index do |listing, i|
    listing.photos.attach([
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-#{i + 1}-1.png"), filename: "omg-#{i + 1}-1.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-#{i + 1}-2.png"), filename: "omg-#{i + 1}-2.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-#{i + 1}-3.png"), filename: "omg-#{i + 1}-3.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-#{i + 1}-4.png"), filename: "omg-#{i + 1}-4.png" },
        { io: URI.open("https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-#{i + 1}-5.png"), filename: "omg-#{i + 1}-5.png" }
    ])
end