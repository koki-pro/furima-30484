function fee (){
  const itemPrice = document.getElementById('item-price')
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    if( 300 <= price && price <= 9999999) {
    let tax  = document.getElementById('add-tax-price');
    tax.innerHTML = `${price / 10}`;
    let profit  = document.getElementById('profit');
    profit.innerHTML = `${price - price / 10}`;
    } else {
      const fee  = document.getElementById('add-tax-price');
    fee.innerHTML = ``;
    const profit  = document.getElementById('profit');
    profit.innerHTML = ``;
    }
  });
}

window.addEventListener('load', fee);