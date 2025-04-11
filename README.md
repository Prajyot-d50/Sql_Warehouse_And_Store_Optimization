# Store & Warehouse Management SQL Project

This SQL project simulates a real-world scenario involving product inventory, warehouse management, manufacturer relationships, and sales analytics. It demonstrates SQL capabilities for data extraction, filtering, calculations, transformations, and performance optimization.

## Features

### 1. Product & Pricing Analytics
- Retrieve product names and prices.
- Filter products by various price ranges (e.g., <= $100, between $50 and $120).
- Sort products by price and name (asc/desc).
- Identify the most and least expensive products.
- Compute average price across products and per manufacturer.

### 2. Manufacturer Insights
- Count the number of products per manufacturer.
- Link each product with its manufacturer.
- Filter manufacturers by product pricing behavior (e.g., average price > $100).
- Identify manufacturers with high-value or budget products.

### 3. Discounts & Pricing Updates
- Apply percentage-based discounts (e.g., 10%) on specific product categories.
- Simulate pricing changes and update product prices accordingly.

### 4. Warehouse & Inventory Management
- View all warehouses and their inventory.
- Analyze average value of boxes in each warehouse.
- Identify saturated warehouses based on capacity limits.
- Show empty warehouses with zero box count.
- Perform inventory actions:
  - Add a new warehouse and box.
  - Reduce box value by 15%.
  - Remove boxes below certain value (e.g., <$100).
  - Remove boxes from saturated warehouses.

### 5. Location-Based Inventory Insights
- Filter boxes and warehouses by city (e.g., Chicago, New York).
- Track inventory movement and location-specific box distribution.

### 6. Indexing & Performance Optimization
- Create and drop indexes on warehouse-related tables.
- Practice proper indexing strategy for performance optimization in large datasets.

