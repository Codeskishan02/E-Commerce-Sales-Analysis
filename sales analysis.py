import pandas as pd

df = pd.read_csv("ecommerce_orders_cleaned.csv")

print(df.head())
print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Records:")
print(df.duplicated().sum())

total_sales = df["Sales amount"].sum()

print("\nTotal Sales:")
print(round(total_sales, 2))

total_orders = df["Order_ID"].nunique()

print("\nTotal Orders:")
print(total_orders)

total_quantity = df["Quantity"].sum()

print("\nTotal Quantity:")
print(total_quantity)

aov = total_sales / total_orders

print("\nAverage Order Value:")
print(round(aov, 2))

category_sales = df.groupby("Category")["Sales amount"].sum()

print("\nCategory-wise Sales:")
print(category_sales.round(2))
import matplotlib.pyplot as plt

category_sales.plot(
    kind="bar",
    color="skyblue",
    figsize=(10, 6)
)

plt.title("Category-wise Sales Analysis")
plt.xlabel("Product Category")
plt.ylabel("Total Sales (INR)")

plt.xticks(rotation=45)
plt.tight_layout()

plt.savefig("category_sales.png", dpi=300, bbox_inches="tight")
plt.show()