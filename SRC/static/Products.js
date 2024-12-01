// Fetch and display products based on filters
async function fetchProducts() {
    const name = document.getElementById('nameFilter').value;
    const minPrice = document.getElementById('minPriceFilter').value;
    const maxPrice = document.getElementById('maxPriceFilter').value;
    const inStock = document.getElementById('inStockFilter').checked;
  
    const params = new URLSearchParams();
    if (name) params.append('name', name);
    if (minPrice) params.append('minPrice', minPrice);
    if (maxPrice) params.append('maxPrice', maxPrice);
    if (inStock) params.append('inStock', true);
  
    try {
      const response = await fetch(`/api/products?${params.toString()}`);
      const products = await response.json();
  
      const productList = document.getElementById('productList');
      productList.innerHTML = ''; // Clear existing products
  
      products.forEach(product => {
        const productCard = document.createElement('div');
        productCard.className = 'product-card';
  
        productCard.innerHTML = `
          <h2>${product.Name}</h2>
          <p>${product.Description}</p>
          <p>Price: $${product.Price}</p>
          <p>${product.Stock > 0 ? 'In Stock' : 'Out of Stock'}</p>
        `;
  
        productList.appendChild(productCard);
      });
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  }
  