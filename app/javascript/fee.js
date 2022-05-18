function fee (){
  const priceNum = document.getElementById("item-price");
  priceNum.addEventListener("keyup", () => {
    const feeVal = document.getElementById("add-tax-price");
    const revenueVal = document.getElementById("profit");
    const feeNum = Math.floor(priceNum.value * 0.1)
    feeVal.innerHTML = `${feeNum}`;
    revenueVal.innerHTML = `${priceNum.value}` - `${feeNum}`;
  });
};

window.addEventListener('load', fee);
