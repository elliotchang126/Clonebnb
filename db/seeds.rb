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
    Review.destroy_all

    puts 'Resetting primary keys'
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('listings')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')

    puts "Creating users..."

    users = []

    #demo user
    demo = User.create!(
        email: 'demo@demo.io', 
        password: 'password',
        first_name: 'Demo',
        last_name: 'User'
    )

    users << demo

    20.times do
        user = User.create!(
            email: Faker::Internet.unique.email,
            password: Faker::Internet.password(min_length: 6, max_length: 20),
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name
        )

        users << user
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
        description: "Immerse yourself in the rich culture of San Francisco from our spacious, sunlit home. Designed for both relaxation and entertainment, this five-bedroom, four-bathroom haven boasts a crystal-clear pool surrounded by lounge chairs - ideal for weekend BBQs or sunbathing sessions. Inside, the blend of modern and vintage decors complements the well-equipped kitchen and high-speed WiFi, ensuring you're catered to, whether on a workcation or family reunion.",
        bedrooms: 5,
        bathrooms: 4,
        price: 595,
        cleaning_fee: 200,
        latitude: 37.7979887,
        longitude: -122.4448766
    )

    pool_listings << listing1

    # file1 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-1.png')
    
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
        description: "Discover a hidden gem in the heart of San Francisco. Designed to harmonize with its verdant surroundings, our four-bedroom house serves as a retreat from city life. Having undergone a recent high-end remodel, it's furnished with sophisticated decor and all modern amenities. A sprawling backyard beckons family gatherings, where the pool and patio set the stage for cherished memories.",
        bedrooms: 4,
        bathrooms: 3,
        price: 350,
        cleaning_fee: 150,
        latitude: 37.7311859,
        longitude: -122.481257
        )
        
    pool_listings << listing2
        
    # file6 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-1.png')
        
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
        description: "Nestled amidst the verdant tapestry of San Francisco's iconic hills, our home is a love letter to tranquility. This intimate two-bedroom sanctuary beckons you to experience unparalleled rest and rejuvenation. From the sumptuous linens adorning each bed to the panoramic hill views greeting you each morning, every element is curated for a sublime stay. Our fully-equipped kitchen invites culinary adventures, while the curated collection of books and high-speed WiFi keep you connected and entertained.",
        bedrooms: 2,
        bathrooms: 1,
        price: 245,
        cleaning_fee: 100,
        latitude: 37.704952,
        longitude: -122.4368568
        )
        
    view_listings << listing3

    # file11 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingpools-1-1.png')

    # listing 4
    listing4 = Listing.create!(
        user_id: 4,
        category: 'amazing views',
        address: '45 26th Ave',
        city: 'San Francisco',
        state: 'California',
        country: 'United States',
        zip_code: 94121,
        title: 'Amazing Coastline View from the Terrace',
        description: "Ensconced in a grove of ancient trees, our property stands as an emblem of serenity and luxury. Every inch of this three-bedroom, two-bathroom house has been designed to provide an immersive ocean-viewing experience. The chorus of waves will be your daily alarm, and the sprawling terrace, with its panoramic views, will quickly become your favorite spot for coffee and contemplation. Indoors, the eclectic decor tells tales of distant lands, offering an inviting blend of comfort and charm.",
        bedrooms: 3,
        bathrooms: 2,
        price: 300,
        cleaning_fee: 150,
        latitude: 37.7879,
        longitude: -122.4865757
        )
        
    view_listings << listing4

    # file16 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-1.png')

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
        description: "Crafted to perfection, our six-bedroom coastal residence is a symphony of luxury and comfort. Located just a stone's throw from the mesmerizing coast, each day here promises new adventures. When the evening fog wraps the city, retreat to the warmth of our fireplace, or indulge in gourmet meals prepared in the well-appointed kitchen. Each floor offers unique views and experiences, ensuring that your stay is nothing short of magical.",
        bedrooms: 6,
        bathrooms: 4,
        price: 595,
        cleaning_fee: 250,
        latitude: 37.7732908,
        longitude: -122.5110819
        )
        
    beachfront_listings << listing5

    # file21 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-1.png')

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
        description: "Situated at the very heart of San Francisco's coveted beachfront, our four-bedroom home is a haven of sophistication and charm. Every room offers unobstructed ocean views, turning each sunrise into an event. The recent renovations have infused a contemporary flair, accentuated by art pieces that reflect the city's vibrant culture. Its prime location ensures that the city's hotspots are within easy reach, while the home remains a sanctuary of peace.",
        bedrooms: 4,
        bathrooms: 3,
        price: 650,
        cleaning_fee: 250,
        latitude: 37.8062447,
        longitude: -122.4364991
        )
        
    beachfront_listings << listing6

    # file26 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-1.png')

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
        description: "Our three-bedroom home is a tribute to nature's grandeur. Nestled amidst towering trees in the heart of San Francisco, it's a world where city sounds fade, replaced by the whispers of leaves. The interiors, echoing the rustic charm of classic cabins, feature wooden accents and a cozy fireplace, transporting guests to a tranquil forest retreat while ensuring every modern comfort.",
        bedrooms: 3,
        bathrooms: 2,
        price: 200,
        cleaning_fee: 75,
        latitude: 37.8066231,
        longitude: -122.4733352
        )
        
    cabin_listings << listing7
    
    # file31 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-1.png')
    
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
        description: "Drawing inspiration from the vast landscapes of the desert, our four-bedroom home in Sausalito promises a unique escape. Panoramic views stretch out from every window, offering an ever-changing tableau of nature. A stone's throw away, pristine trails invite exploration, while back home, every modern amenity ensures your stay is comfortable and memorable.",
        bedrooms: 4,
        bathrooms: 2,
        price: 310,
        cleaning_fee: 125,
        latitude: 37.8363342,
        longitude: -122.4792593
    )
    
    cabin_listings << listing8
    
    # file36 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-1.png')
    
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
        description: "A testament to architectural brilliance, our Oakland residence stands atop a serene hill, offering unparalleled city views. This three-bedroom, two-bathroom gem masterfully balances luxury with comfort. Whether it's the attic-styled bedroom that evokes nostalgia or the sun-drenched patio ideal for evening soirees, every corner has been crafted for sensory delight.",
        bedrooms: 3,
        bathrooms: 2,
        price: 600,
        cleaning_fee: 200,
        latitude: 37.8158974,
        longitude: -122.210704
        )
        
    countryside_listings << listing9
    
    # file41 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-1.png')
        
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
        description: "Discover a slice of Napa Valley in San Francisco with our seven-bedroom, five-bathroom villa, surrounded by vineyards. Revel in the tranquility of our lush estate: sunbathe by the pool or enjoy the serene ambiance on the patio. Inside, rustic charm meets modern luxury, creating a cozy retreat. Whether sipping wine amidst the vines or unwinding in our comfortable interiors, you're assured a captivating stay.",
        bedrooms: 7,
        bathrooms: 5,
        price: 650,
        cleaning_fee: 200,
        latitude: 37.6498537,
        longitude: -122.4433525
    )
    
    countryside_listings << listing10

    # file46 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-1.png')
    
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
        description: "Embodying a harmonious blend of minimalistic design and natural elegance, our home is an oasis for those seeking a serene escape in the city's heart. Every corner of this two-bedroom residence whispers tranquility, from the expansive windows framing the verdant outdoors to the meticulously chosen decor elements. Whether you're soaking in the tub with nature views or sipping wine by the expansive sliding doors, this property promises a restorative experience.",
        bedrooms: 2,
        bathrooms: 1,
        price: 995,
        cleaning_fee: 300,
        latitude: 37.768744,
        longitude: -122.4028469
    )
    
    design_listings << listing11
    
    # file51 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-1.png')
    
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
        description: "An epitome of sustainable luxury, our five-bedroom, three-bathroom home is a testament to modern architectural prowess and eco-consciousness. Harness the sun's power with our state-of-the-art solar panels, even as you charge your electric vehicle. The guest house, with its private ambiance, is perfect for those seeking solitude. Panoramic views greet you from every corner, ensuring a stay that's as visually stunning as it's comfortable.",
        bedrooms: 5,
        bathrooms: 3,
        price: 800,
        cleaning_fee: 250,
        latitude: 37.7724016,
        longitude: -122.4540734
    )

    design_listings << listing12

    # file56 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-1.png')

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
        description: "Transport yourself to the heart of Marrakech without leaving San Francisco! Every inch of our palatial eight-bedroom, nine-bathroom home exudes the exotic charm of Moroccan design. From intricate tile work to the expansive pool reminiscent of royal courtyards, every detail has been curated for an authentic experience. With plush interiors and expansive outdoor spaces, it's not just a stay, but a journey through a different world.",
        bedrooms: 8,
        bathrooms: 9,
        price: 1200,
        cleaning_fee: 300,
        latitude: 37.7923849,
        longitude: -122.4421848
    )
    
    iconic_listings << listing13
    
    # file61 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-1.png')
    
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
        description: "Amidst the hustle and bustle of Downtown San Francisco, our home stands as a beacon of contemporary comfort. Boasting modern aesthetics, the upper-floor bedrooms ensure privacy while the ground floor is an entertainer's delight. From cocktail evenings in the chic living area to barbecue nights in the intimate backyard, this home turns every moment into a cherished memory.",
        bedrooms: 2,
        bathrooms: 1,
        price: 300,
        cleaning_fee: 150,
        latitude: 37.7903566,
        longitude: -122.4258617
    )

    iconic_listings << listing14

    # file66 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-1.png')

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
        description: "Discover the magic of waterfront living in our sprawling six-bedroom, four-bathroom abode. Days here are all about lakeside fun: bask in the outdoor jacuzzi, engage in playful water activities, or simply laze by the dock. As night falls, retreat indoors, where every amenity, from plush furnishings to a state-of-the-art kitchen, ensures unparalleled comfort.",
        bedrooms: 6,
        bathrooms: 4,
        price: 500,
        cleaning_fee: 150,
        latitude: 37.7299818,
        longitude: -122.4876728
    )
    
    lakeside_listings << listing15
    
    # file71 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-1.png')
    
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
        description: "Elegantly poised on the shores of Oakland's pristine lake, our five-bedroom masterpiece offers a living experience like no other. Towering windows flood the interiors with natural light, casting a shimmering glow that reflects the tranquil waters outside. Whether you're lounging in the spacious living area or enjoying a cuppa with lakeside views, our home promises a mix of relaxation and luxury.",
        bedrooms: 5,
        bathrooms: 4,
        price: 550,
        cleaning_fee: 200,
        latitude: 37.7996449,
        longitude: -122.2578886
    )
    
    lakeside_listings << listing16
    
    # file76 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-1.png')
    
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
        description: "Step into a world of opulence and grandeur reminiscent of the iconic mansions of Beverly Hills. Our ten-bedroom chateau, with its imposing staircase and glimmering chandelier, is a statement of luxury. Outdoors, the magnificent pool beckons for sun-soaked afternoons. With every comfort considered, from sumptuous bedrooms to lavish lounges, it's a stay tailored for those with discerning tastes.",
        bedrooms: 10,
        bathrooms: 12,
        price: 1600,
        cleaning_fee: 500,
        latitude: 37.7953393,
        longitude: -122.415301
    )
    
    mansions_listings << listing17
    
    # file81 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-1.png')
    
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
        description: "Sitting majestically atop San Francisco's famed hills, our twelve-bedroom mansion offers a star-studded experience. Contemporary design meets rustic woodwork, creating an ambiance that's both chic and warm. The crown jewel? An infinity pool with mesmerizing city views. From spa-like bathrooms to gourmet kitchens, luxury permeates every nook of this property.",
        bedrooms: 12,
        bathrooms: 10,
        price: 2000,
        cleaning_fee: 600,
        latitude: 37.8012649,
        longitude: -122.4040532
    )
        
    mansions_listings << listing18
        
    # file86 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-1.png')
        
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
        description: "Celebrated in the pages of Architectural Digest, our residence is a masterclass in design and innovation. With floor-to-ceiling windows framing the city's iconic landscape, the views here are just the beginning. Dive into the indoor swimming pool, embark on a hiking trail right from the doorstep, or simply revel in the modern interiors that have won accolades from design aficionados globally.",
        bedrooms: 10,
        bathrooms: 8,
        price: 1000,
        cleaning_fee: 300,
        latitude: 37.8794086,
        longitude: -122.4491799
        )
        
        omg_listings << listing19
        
        # file91 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-1.png')
        
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
        description: "Experience enchantment like never before in our ethereal treehouse. Hovering amidst the treetops, this one-bedroom gem is a blend of rustic charm and modern conveniences. Wraparound terraces offer panoramic forest views, ensuring a connect with nature like no other. From snowy evenings by the fireplace to sunny afternoons with a book, every moment here is magical. Note: The bathroom is conveniently located at ground level, ensuring easy access.",
        bedrooms: 1,
        bathrooms: 1,
        price: 800,
        cleaning_fee: 300,
        latitude: 37.7545089,
        longitude: -122.4472691
    )
    
    omg_listings << listing20
    
    # file96 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-1.png')
    
    puts 'Done!'
    
    puts 'Creating reviews...'
    
    sample_reviews = [
        "The place was essentially as described and served its purpose as a base for our trip. The location is its biggest advantage, being close to main attractions. However, the amenities felt quite basic and the space could benefit from some refreshing. It's suitable for those looking for no-frills accommodation.", 
        "The property has potential, but there are areas that need attention. While the living area was spacious, the kitchen appliances seemed dated and the bathroom fixtures showed signs of wear. A little maintenance could go a long way in elevating the overall experience.",
        "This listing offered a decent stay, but there were aspects that left room for improvement. Some furnishings seemed mismatched, and the lighting in the bedroom was dim. The outdoor patio was a nice touch, but could use some upkeep. With a bit more attention to detail, this place could truly shine.",
        "Our stay was absolutely delightful. The attention to detail, from the modern decor to the well-equipped kitchen, made our stay comfortable and memorable. The surrounding neighborhood was charming, offering local gems just a short walk away. Would recommend to anyone seeking a quality stay.",
        "This place was a calming retreat after our city excursions. The garden view from the balcony was a daily treat, and the interiors were thoughtfully designed. While most amenities were top-notch, the WiFi occasionally faltered.",
        "From the moment we walked in, the place radiated warmth and coziness. The bookshelf filled with classics, the plush throw blankets, and the inviting living space - everything made us feel right at home. We left refreshed and grateful for such a hospitable environment.",
        "For the price, this listing was a steal. The space was clean, centrally located, and equipped with essentials. While the ambiance was slightly generic, the comfort and convenience it offered were unparalleled.",
        "The best part of this listing is its serene ambiance. Nestled in a quiet street, it offered the peace we sought on this trip. The interiors were clean and tidy, though some decor felt a bit outdated. Nonetheless, a restful stay.",
        "The listing's charm lies in its authenticity. It felt like a lived-in, cherished space rather than a sterile hotel room. Personal touches, from art pieces to houseplants, added character and life to the entire place. Truly a memorable stay.",
        "Overall, our experience was pleasant. The location was ideal, and the space itself was neat and spacious. However, we had some minor hitches with the shower temperature and a squeaky bedroom door. Minor fixes could elevate the experience significantly.",
    ]
    
    users.each do |user|
        random_listings = (1..20).to_a.shuffle[0...9]
        random_listings.each do |i|
            Review.create!(
                listing_id: i,
                user_id: user.id,
                cleanliness: rand(4..5),
                communication: rand(4..5),
                check_in: rand(4..5),
                accuracy: rand(4..5),
                location: rand(4..5),
                value: rand(4..5),
                body: sample_reviews.sample 
            )
        end
    end

    puts "Done!"
end
    
    puts 'Attaching images to listings...'

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
    
    puts "Done!"

# file97 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-2.png')
# file92 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-2.png')
# file87 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-2.png')
# file82 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-2.png')
# file77 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-2.png')
# file72 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-2.png')
# file67 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-2.png')
# file62 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-2.png')
# file57 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-2.png')
# file52 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-2.png')
# file47 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-2.png')
# file42 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-2.png')
# file37 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-2.png')
# file32 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-2.png')
# file27 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-2.png')
# file22 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-2.png')
# file17 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-2.png')
# file12 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-2.png')
# file7 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-2.png')
# file2 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-2.png')
# file3 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-3.png')
# file4 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-4.png')
# file5 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-1-5.png')

# listing1.photos.attach(io: file1, filename: 'amazingpools-1-1.png')
# listing1.photos.attach(io: file2, filename: 'amazingpools-1-2.png')
# listing1.photos.attach(io: file3, filename: 'amazingpools-1-3.png')
# listing1.photos.attach(io: file4, filename: 'amazingpools-1-4.png')
# listing1.photos.attach(io: file5, filename: 'amazingpools-1-5.png')
# file8 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-3.png')
# file9 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-4.png')
# file10 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-pools/amazingpools-2-5.png')

# listing2.photos.attach(io: file6, filename: 'amazingpools-2-1.png')
# listing2.photos.attach(io: file7, filename: 'amazingpools-2-2.png')
# listing2.photos.attach(io: file8, filename: 'amazingpools-2-3.png')
# listing2.photos.attach(io: file9, filename: 'amazingpools-2-4.png')
# listing2.photos.attach(io: file10, filename: 'amazingpools-2-5.png')
# file13 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-3.png')
# file14 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-4.png')
# file15 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-1-5.png')

# listing3.photos.attach(io: file11, filename: 'amazingviews-1-1.png')
# listing3.photos.attach(io: file12, filename: 'amazingviews-1-2.png')
# listing3.photos.attach(io: file13, filename: 'amazingviews-1-3.png')
# listing3.photos.attach(io: file14, filename: 'amazingviews-1-4.png')
# listing3.photos.attach(io: file15, filename: 'amazingviews-1-5.png')
# file18 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-3.png')
# file19 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-4.png')
# file20 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/amazing-views/amazingviews-2-5.png')

# listing4.photos.attach(io: file16, filename: 'amazingviews-2-1.png')
# listing4.photos.attach(io: file17, filename: 'amazingviews-2-2.png')
# listing4.photos.attach(io: file18, filename: 'amazingviews-2-3.png')
# listing4.photos.attach(io: file19, filename: 'amazingviews-2-4.png')
# listing4.photos.attach(io: file20, filename: 'amazingviews-2-5.png')
# file23 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/aeachfront/beachfront-1-3.png')
# file24 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-4.png')
# file25 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-1-5.png')

# listing5.photos.attach(io: file21, filename: 'beachfront-1-1.png')
# listing5.photos.attach(io: file22, filename: 'beachfront-1-2.png')
# listing5.photos.attach(io: file23, filename: 'beachfront-1-3.png')
# listing5.photos.attach(io: file24, filename: 'beachfront-1-4.png')
# listing5.photos.attach(io: file25, filename: 'beachfront-1-5.png')
# file28 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-3.png')
# file29 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-4.png')
# file30 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/beachfront/beachfront-2-5.png')

# listing6.photos.attach(io: file26, filename: 'beachfront-2-1.png')
# listing6.photos.attach(io: file27, filename: 'beachfront-2-2.png')
# listing6.photos.attach(io: file28, filename: 'beachfront-2-3.png')
# listing6.photos.attach(io: file29, filename: 'beachfront-2-4.png')
# listing6.photos.attach(io: file30, filename: 'beachfront-2-5.png')
# file33 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-3.png')
# file34 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-4.png')
# file35 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-1-5.png')

# listing7.photos.attach(io: file31, filename: 'cabin-1-1.png')
# listing7.photos.attach(io: file32, filename: 'cabin-1-2.png')
# listing7.photos.attach(io: file33, filename: 'cabin-1-3.png')
# listing7.photos.attach(io: file34, filename: 'cabin-1-4.png')
# listing7.photos.attach(io: file35, filename: 'cabin-1-5.png')
# file38 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-3.png')
# file39 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-4.png')
# file40 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/cabin/cabin-2-5.png')

# listing8.photos.attach(io: file36, filename: 'cabin-2-1.png')
# listing8.photos.attach(io: file37, filename: 'cabin-2-2.png')
# listing8.photos.attach(io: file38, filename: 'cabin-2-3.png')
# listing8.photos.attach(io: file39, filename: 'cabin-2-4.png')
# listing8.photos.attach(io: file40, filename: 'cabin-2-5.png')
# file43 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-3.png')
# file44 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-4.png')
# file45 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-1-5.png')

# listing9.photos.attach(io: file41, filename: 'countryside-1-1.png')
# listing9.photos.attach(io: file42, filename: 'countryside-1-2.png')
# listing9.photos.attach(io: file43, filename: 'countryside-1-3.png')
# listing9.photos.attach(io: file44, filename: 'countryside-1-4.png')
# listing9.photos.attach(io: file45, filename: 'countryside-1-5.png')
# file48 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-3.png')
# file49 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-4.png')
# file50 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/countryside/countryside-2-5.png')

# listing10.photos.attach(io: file46, filename: 'countryside-2-1.png')
# listing10.photos.attach(io: file47, filename: 'countryside-2-2.png')
# listing10.photos.attach(io: file48, filename: 'countryside-2-3.png')
# listing10.photos.attach(io: file49, filename: 'countryside-2-4.png')
# listing10.photos.attach(io: file50, filename: 'countryside-2-5.png')
# file53 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-3.png')
# file54 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-4.png')
# file55 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-1-5.png')

# listing11.photos.attach(io: file51, filename: 'design-1-1.png')
# listing11.photos.attach(io: file52, filename: 'design-1-2.png')
# listing11.photos.attach(io: file53, filename: 'design-1-3.png')
# listing11.photos.attach(io: file54, filename: 'design-1-4.png')
# listing11.photos.attach(io: file55, filename: 'design-1-5.png')
# file58 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-3.png')
# file59 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-4.png')
# file60 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/design/design-2-5.png')

# listing12.photos.attach(io: file56, filename: 'design-2-1.png')
# listing12.photos.attach(io: file57, filename: 'design-2-2.png')
# listing12.photos.attach(io: file58, filename: 'design-2-3.png')
# listing12.photos.attach(io: file59, filename: 'design-2-4.png')
# listing12.photos.attach(io: file60, filename: 'design-2-5.png')
# file63 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-3.png')
# file64 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-4.png')
# file65 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-1-5.png')

# listing13.photos.attach(io: file61, filename: 'iconiccities-1-1.png')
# listing13.photos.attach(io: file62, filename: 'iconiccities-1-2.png')
# listing13.photos.attach(io: file63, filename: 'iconiccities-1-3.png')
# listing13.photos.attach(io: file64, filename: 'iconiccities-1-4.png')
# listing13.photos.attach(io: file65, filename: 'iconiccities-1-5.png')
# file68 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-3.png')
# file69 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-4.png')
# file70 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/iconic-cities/iconiccities-2-5.png')

# listing14.photos.attach(io: file66, filename: 'iconiccities-2-1.png')
# listing14.photos.attach(io: file67, filename: 'iconiccities-2-2.png')
# listing14.photos.attach(io: file68, filename: 'iconiccities-2-3.png')
# listing14.photos.attach(io: file69, filename: 'iconiccities-2-4.png')
# listing14.photos.attach(io: file70, filename: 'iconiccities-2-5.png')
# file73 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-3.png')
# file74 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-4.png')
# file75 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-1-5.png')

# listing15.photos.attach(io: file71, filename: 'lakefront-1-1.png')
# listing15.photos.attach(io: file72, filename: 'lakefront-1-2.png')
# listing15.photos.attach(io: file73, filename: 'lakefront-1-3.png')
# listing15.photos.attach(io: file74, filename: 'lakefront-1-4.png')
# listing15.photos.attach(io: file75, filename: 'lakefront-1-5.png')
# file78 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-3.png')
# file79 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-4.png')
# file80 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/lakefront/lakefront-2-5.png')

# listing16.photos.attach(io: file76, filename: 'lakefront-2-1.png')
# listing16.photos.attach(io: file77, filename: 'lakefront-2-2.png')
# listing16.photos.attach(io: file78, filename: 'lakefront-2-3.png')
# listing16.photos.attach(io: file79, filename: 'lakefront-2-4.png')
# listing16.photos.attach(io: file80, filename: 'lakefront-2-5.png')
# file83 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-3.png')
# file84 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-4.png')
# file85 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-1-5.png')

# listing17.photos.attach(io: file81, filename: 'mansion-1-1.png')
# listing17.photos.attach(io: file82, filename: 'mansion-1-2.png')
# listing17.photos.attach(io: file83, filename: 'mansion-1-3.png')
# listing17.photos.attach(io: file84, filename: 'mansion-1-4.png')
# listing17.photos.attach(io: file85, filename: 'mansion-1-5.png')
# file88 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-3.png')
# file89 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-4.png')
# file90 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/mansions/mansion-2-5.png')

# listing18.photos.attach(io: file86, filename: 'mansion-2-1.png')
# listing18.photos.attach(io: file87, filename: 'mansion-2-2.png')
# listing18.photos.attach(io: file88, filename: 'mansion-2-3.png')
# listing18.photos.attach(io: file89, filename: 'mansion-2-4.png')
# listing18.photos.attach(io: file90, filename: 'mansion-2-5.png')
# file93 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-3.png')
# file94 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-4.png')
# file95 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-1-5.png')

# listing19.photos.attach(io: file91, filename: 'omg-1-1.png')
# listing19.photos.attach(io: file92, filename: 'omg-1-2.png')
# listing19.photos.attach(io: file93, filename: 'omg-1-3.png')
# listing19.photos.attach(io: file94, filename: 'omg-1-4.png')
# listing19.photos.attach(io: file95, filename: 'omg-1-5.png')
# file98 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-3.png')
# file99 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-4.png')
# file100 = URI.open('https://clonebnb-seeds.s3.us-west-1.amazonaws.com/Clonebnb-Photos/omg/omg-2-5.png')

# listing20.photos.attach(io: file96, filename: 'omg-2-1.png')
# listing20.photos.attach(io: file97, filename: 'omg-2-2.png')
# listing20.photos.attach(io: file98, filename: 'omg-2-3.png')
# listing20.photos.attach(io: file99, filename: 'omg-2-4.png')
# listing20.photos.attach(io: file100, filename: 'omg-2-5.png')