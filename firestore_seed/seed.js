const { initializeApp, cert, deleteApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");

const serviceAccount = require("./serviceAccountKey.json");

const app = initializeApp({
    credential: cert(serviceAccount),
});

const db = getFirestore(app);

// الأقسام والمنتجات التابعة لكل قسم
const categories = [
    {
        id: "cat_roses",
        name: "Roses",
        image:
            "https://images.unsplash.com/photo-1494972308805-463bc619d34e",
        products: [
            {
                id: "prod_001",
                name: "Red Rose Bouquet",
                description: "Fresh red roses for special occasions.",
                isTrending: true,
                price: 25,
                image: [
                    "https://images.unsplash.com/photo-1494972308805-463bc619d34e",
                    "https://images.unsplash.com/photo-1518895949257-7621c3c786d7",
                ],
            },
            {
                id: "prod_002",
                name: "Pink Dream",
                description: "A beautiful pink flower bouquet.",
                isTrending: true,
                price: 32.5,
                image: [
                    "https://images.unsplash.com/photo-1520763185298-1b434c919102",
                ],
            },
        ],
    },
    {
        id: "cat_bouquets",
        name: "Bouquets",
        image:
            "https://images.unsplash.com/photo-1520763185298-1b434c919102",
        products: [
            {
                id: "prod_003",
                name: "White Elegance",
                description: "Elegant white flowers.",
                isTrending: false,
                price: 28,
                image: [
                    "https://images.unsplash.com/photo-1490750967868-88aa4486c946",
                ],
            },
            {
                id: "prod_004",
                name: "Birthday Flowers",
                description: "A colorful birthday bouquet.",
                isTrending: true,
                price: 35,
                image: [
                    "https://images.unsplash.com/photo-1494972308805-463bc619d34e",
                ],
            },
        ],
    },
    {
        id: "cat_gifts",
        name: "Gifts",
        image:
            "https://images.unsplash.com/photo-1512909006721-3d6018887383",
        products: [
            {
                id: "prod_005",
                name: "Luxury Flower Box",
                description: "A premium flower gift.",
                isTrending: true,
                price: 50,
                image: [
                    "https://images.unsplash.com/photo-1518895949257-7621c3c786d7",
                ],
            },
        ],
    },
    {
        id: "cat_plants",
        name: "Plants",
        image:
            "https://images.unsplash.com/photo-1485955900006-10f4d324d411",
        products: [
            {
                id: "prod_006",
                name: "Little Green Plant",
                description: "A lovely indoor plant.",
                isTrending: false,
                price: 15,
                image: [
                    "https://images.unsplash.com/photo-1485955900006-10f4d324d411",
                ],
            },
        ],
    },
];

// العروض
const sales = [
    {
        id: "sale_001",
        image:
            "https://images.unsplash.com/photo-1520763185298-1b434c919102",
    },
    {
        id: "sale_002",
        image:
            "https://images.unsplash.com/photo-1490750967868-88aa4486c946",
    },
    {
        id: "sale_003",
        image:
            "https://images.unsplash.com/photo-1494972308805-463bc619d34e",
    },
];

async function seedCategoriesAndProducts() {
    const batch = db.batch();

    for (const category of categories) {
        const { products, ...categoryData } = category;

        const categoryRef = db
            .collection("categories")
            .doc(category.id);

        batch.set(categoryRef, categoryData);

        for (const product of products) {
            const productRef = categoryRef
                .collection("products")
                .doc(product.id);

            batch.set(productRef, product);
        }
    }

    await batch.commit();
    console.log("Categories and nested products created.");
}

async function seedSales() {
    const batch = db.batch();

    for (const sale of sales) {
        batch.set(
            db.collection("sales").doc(sale.id),
            sale
        );
    }

    await batch.commit();
    console.log("Sales created.");
}

async function main() {
    try {
        await seedCategoriesAndProducts();
        await seedSales();

        console.log("All dummy data created successfully!");
    } catch (error) {
        console.error("Seeding failed:", error);
        process.exitCode = 1;
    } finally {
        await deleteApp(app);
    }
}

main();