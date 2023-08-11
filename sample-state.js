{
    entities: {
        users: {
            1: {
                id: 1,
                email: "demo@clonebnb.com",
                first_name: "Demo",
                last_name: "User" 
            },
            2: {
                id: 2,
                email: "elliot@gmail.com",
                first_name: "elliot",
                last_name: "chang"
            },
            3: {
                id: 3,
                email: "kobebryant@thekobebryant.com",
                first_name: "kobe",
                last_name: "bryant"
            }
        },
        locations: {
            1: {
                id: 1,
                user_id: 1,
                type: "beachfront",
                address: "3451 N. Beach St.",
                city: "Oceanside",
                state: "California",
                country: "United States",
                zip_code: 12581,
                title: "Cozy Beach House on the Shore",
                description: "Comfortable 2 bed 2 bath right in ideal location! Walking distance to the boardwalk.",
                imgUrl: ['imghost.com/1/img/1', 'imghost.com/1/img/2', 'imghost.com/1/img/3', 'imghost.com/1/img/4', 'imghost.com/1/img/5' ],
                bedrooms: 2,
                bathrooms: 2,
                longitude: -148.5674,
                latitude: 22.1231
            },
            2: {
                id: 2,
                user_id: 2,
                type: "mansion",
                address: "9835 Mansion Rd.",
                city: "Beverly Hills",
                state: "California",
                country: "United States",
                zip_code: 92357,
                title: "Beverly Hills Mansion with Incredible Views",
                description: "Amazing 12 bed 16 bath mansion in the heart of Beverly Hills. 15 minutes from all the hot spots in Los Angeles!",
                imgUrl: ['imghost.com/2/img/1', 'imghost.com/2/img/2', 'imghost.com/2/img/3', 'imghost.com/2/img/4', 'imghost.com/2/img/5' ],
                bedrooms: 12,
                bathrooms: 16,
                longitude: -118.9821,
                latitude: 34.0346
            }
        },
        reservations: {
            1: {
                id: 1,
                listing_id: 1,
                user_id: 2,
                num_guests: 6,
                price: 680.50,
                start_date: "08/15/2023",
                end_date: "08/17/2023"
            },
            2: {
                id: 2,
                listing_id: 2,
                user_id: 3,
                num_guests: 18,
                price: 16290.99,
                start_date: "12/15/2023",
                end_date: "12/20/2023"
            }
        },
        reviews: {
            1: {
                id: 1,
                listing_id: 2,
                user_id: 1,
                rating: 4.9,
                cleanliness: 5,
                communication: 5,
                check_in: 5,
                accuracy: 5,
                location: 5,
                value: 4,
                body: "Great stay! Our entire party loved the mansion and it was incredibly clean. Only downside was that it was a little expensive but still worth it."
            },
            2: {
                id: 2,
                listing_id: 1,
                user_id: 2,
                rating: 4.5,
                cleanliness: 4,
                communication: 5,
                check_in: 4,
                accuracy: 5,
                location: 5,
                value: 4,
                body: "Overall we liked the home, but there was sand everywhere and getting in and out took forever because the roads were so packed with cars"
            }
        }
    },
    ui: {
        loading: true/false,
        modal: true/false
    },
    errors: {
        login: ["Invalid username/password"],
        reservationForm: ["Number of guests cannot be blank"],
        reviewForm: ["Review form cannot be blank", "Body cannot be blank"]
    },
    session: { currentUserId: 1 }
}