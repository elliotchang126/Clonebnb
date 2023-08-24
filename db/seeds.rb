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

    23.times do
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

    listing21 = Listing.create!(
        user_id: 21,
        category: 'amazing pools',
        address: '245 S Westgate Ave',
        city: 'Los Angeles',
        state: 'California',
        country: 'United States',
        zip_code: 90049,
        title: 'Incredible Poolhouse in the Heart of LA',
        description: "Welcome to our stunning resort home. This two story home has 6 bedrooms and 8 beds that will accommodate any large groups and family. Multiple seating areas are perfect for those who like to roam this beautiful home. Our large sunroom and game room makes this house an entertainers paradise. You will also be greeted with a private Oasis that features a heated grotto jacuzzi pool, and slide. This unique experience is what wonderful memories are made of.",
        bedrooms: 6,
        bathrooms: 3,
        price: 395,
        cleaning_fee: 100,
        latitude: 34.0590289,
        longitude: -118.4743393
    )
    
    pool_listings << listing21

    listing22 = Listing.create!(
        user_id: 22,
        category: 'design',
        address: '1035 N Clark St',
        city: 'Chicago',
        state: 'Illinois',
        country: 'United States',
        zip_code: 60610,
        title: 'Stunning Penthouse with Private Rooftop',
        description: "This exclusive listing offers a combined 4,000 sq. ft penthouse loft, encompassing the entire building with 5 bedrooms, located in the heart of downtown Chicago, next to the 'Magnificent Mile'. Renovated in 2016, the space boasts exposed brick, 20-foot ceilings, vintage barn wood floors, and a rooftop deck with views of Willis (Sears) Tower. Note: The unit is accessed via 45 steps (2 flights) and features unique accommodations including a reclaimed wood nook with a twin bed.",
        bedrooms: 5,
        bathrooms: 4,
        price: 425,
        cleaning_fee: 120,
        latitude: 41.901499,
        longitude: -87.6335937
    )

    design_listings << listing22

    listing23 = Listing.create!(
        user_id: 23,
        category: 'iconic cities',
        address: '240 E 27th St',
        city: 'New York',
        state: 'New York',
        country: 'United States',
        zip_code: 10016,
        title: 'Penthouse in NYC with Panoramic View',
        description: "Welcome to our exquisite retreat gem, perfectly positioned to offer breathtaking views of the Statue of Liberty and captivating sunsets. Nestled in a high-rise haven, this luxurious apartment provides an unparalleled experience, all while being conveniently located near all the city's attractions. Prepare to be dazzled as you step into our meticulously designed apartment. The living space is a masterpiece of modern comfort, adorned with floor-to-ceiling windows that frame stunning vistas. Relax on the plush furnishings and relish the vistas of the iconic Statue of Liberty and the mesmerizing sunsets that paint the skyline.",
        bedrooms: 4,
        bathrooms: 3,
        price: 550,
        cleaning_fee: 150,
        latitude: 40.7402195,
        longitude: -73.9795651
    )

    iconic_listings << listing23

    listing24 = Listing.create!(
        user_id: 24,
        category: 'beachfront',
        address: '1010 N Venetian Dr',
        city: 'Miami Beach',
        state: 'Florida',
        country: 'United States',
        zip_code: 33139,
        title: "Miami Beach's Premier Luxury Escape",
        description: "Introducing Villa Castillo, a luxurious haven situated a stone's throw away from the iconic Miami Beach. Nestled amidst the vibrant heartbeat of Miami, this residence is in proximity to the city's bustling nightlife, ensuring guests have the best of both tranquility and excitement. Ideal for sizable gatherings, from bachelor and bachelorette festivities to memorable family reunions, Villa Castillo caters to all. The property boasts of soaring high ceilings and a contemporary design aesthetic, providing a touch of elegance to your stay. To top it off, indulge in our heated pool, offering the ultimate relaxation and making your getaway truly impeccable.",
        bedrooms: 6,
        bathrooms: 3,
        price: 720,
        cleaning_fee: 200,
        latitude: 25.7904762,
        longitude: -80.176548
    )

    beachfront_listings << listing24
    
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
        random_listings = (1..24).to_a.shuffle[0...8]
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

    puts 'Creating reservations...'

    reservation1 = Reservation.create!(
        listing_id: 3,
        user_id: 1,
        num_guests: 4,
        start_date: "2023-12-02",
        end_date: "2023-12-05"
    )

    reservation2 = Reservation.create!(
        listing_id: 9,
        user_id: 1,
        num_guests: 5,
        start_date: "2024-01-11",
        end_date: "2024-01-15"
    )

    reservation3 = Reservation.create!(
        listing_id: 15,
        user_id: 1,
        num_guests: 3,
        start_date: "2023-11-20",
        end_date: "2023-11-21"
    )
    
    reservation4 = Reservation.create!(
        listing_id: 6,
        user_id: 1,
        num_guests: 4,
        start_date: "2024-02-16",
        end_date: "2024-02-18"
    )

    reservation5 = Reservation.create!(
        listing_id: 23,
        user_id: 1,
        num_guests: 6,
        start_date: "2023-06-09",
        end_date: "2023-06-12"
    )

    reservation6 = Reservation.create!(
        listing_id: 12,
        user_id: 1,
        num_guests: 4,
        start_date: "2023-04-27",
        end_date: "2023-04-29"
    )

    reservation7 = Reservation.create!(
        listing_id: 18,
        user_id: 1,
        num_guests: 4,
        start_date: "2023-08-01",
        end_date: "2023-08-04"
    )

    reservation8 = Reservation.create!(
        listing_id: 20,
        user_id: 1,
        num_guests: 4,
        start_date: "2023-01-16",
        end_date: "2023-01-18"
    )

    puts 'Done!'
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