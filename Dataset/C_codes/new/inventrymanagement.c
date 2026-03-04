#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PRODUCTS 100
#define MAX_NAME 100

typedef struct {
    int id;
    char name[MAX_NAME];
    int quantity;
    float price;
} Product;

Product inventory[MAX_PRODUCTS];
int product_count = 0;

// Save inventory to file
void save_inventory(const char *filename) {
    FILE *fp = fopen(filename,"w");
    if (!fp) { perror("fopen"); return; }
    for (int i=0;i<product_count;i++) {
        fprintf(fp,"%d,%s,%d,%.2f\n",inventory[i].id,inventory[i].name,
                inventory[i].quantity,inventory[i].price);
    }
    fclose(fp);
    printf("Inventory saved to %s\n",filename);
}

// Load inventory from file
void load_inventory(const char *filename) {
    FILE *fp = fopen(filename,"r");
    if (!fp) return;
    product_count=0;
    while (fscanf(fp,"%d,%99[^,],%d,%f\n",&inventory[product_count].id,
                  inventory[product_count].name,&inventory[product_count].quantity,
                  &inventory[product_count].price)==4) {
        product_count++;
    }
    fclose(fp);
    printf("Loaded inventory from %s\n",filename);
}

// Add product
void add_product() {
    if (product_count>=MAX_PRODUCTS) { printf("Inventory full!\n"); return; }
    Product p;
    p.id=product_count+1;
    printf("Enter product name: ");
    fgets(p.name,MAX_NAME,stdin);
    p.name[strcspn(p.name,"\n")]=0;
    printf("Enter quantity: ");
    scanf("%d",&p.quantity); getchar();
    printf("Enter price: ");
    scanf("%f",&p.price); getchar();
    inventory[product_count++]=p;
    printf("Product added.\n");
}

// List products
void list_products() {
    printf("\nID\tName\t\tQty\tPrice\n");
    for (int i=0;i<product_count;i++) {
        printf("%d\t%s\t\t%d\t%.2f\n",inventory[i].id,inventory[i].name,
               inventory[i].quantity,inventory[i].price);
    }
}

// Update stock
void update_stock() {
    int id;
    printf("Enter product ID to update: ");
    scanf("%d",&id); getchar();
    for (int i=0;i<product_count;i++) {
        if (inventory[i].id==id) {
            printf("Enter new quantity: ");
            scanf("%d",&inventory[i].quantity); getchar();
            printf("Stock updated.\n");
            return;
        }
    }
    printf("Product not found.\n");
}

// Record sale
void record_sale() {
    int id, qty;
    printf("Enter product ID sold: ");
    scanf("%d",&id);
    printf("Enter quantity sold: ");
    scanf("%d",&qty); getchar();
    for (int i=0;i<product_count;i++) {
        if (inventory[i].id==id) {
            if (inventory[i].quantity>=qty) {
                inventory[i].quantity-=qty;
                float total=qty*inventory[i].price;
                printf("Sale recorded. Total = %.2f\n",total);
            } else {
                printf("Not enough stock!\n");
            }
            return;
        }
    }
    printf("Product not found.\n");
}

// Delete product
void delete_product() {
    int id;
    printf("Enter product ID to delete: ");
    scanf("%d",&id); getchar();
    for (int i=0;i<product_count;i++) {
        if (inventory[i].id==id) {
            for (int j=i;j<product_count-1;j++) inventory[j]=inventory[j+1];
            product_count--;
            printf("Product deleted.\n");
            return;
        }
    }
    printf("Product not found.\n");
}

int main() {
    char filename[]="inventory.txt";
    load_inventory(filename);

    int choice;
    while (1) {
        printf("\n--- Inventory Menu ---\n");
        printf("1. Add Product\n");
        printf("2. List Products\n");
        printf("3. Update Stock\n");
        printf("4. Record Sale\n");
        printf("5. Delete Product\n");
        printf("6. Save & Exit\n");
        printf("Choice: ");
        scanf("%d",&choice); getchar();

        switch(choice) {
            case 1: add_product(); break;
            case 2: list_products(); break;
            case 3: update_stock(); break;
            case 4: record_sale(); break;
            case 5: delete_product(); break;
            case 6: save_inventory(filename); printf("Exiting.\n"); return 0;
            default: printf("Invalid choice.\n");
        }
    }
}