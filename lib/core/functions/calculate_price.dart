calcPrice({required num productPrice, required num discountValue}) {
  num discountAmount = (discountValue / 100) * productPrice;

  //Calculate the new price after applying the discount
  num newPrice = productPrice - discountAmount;
  return newPrice;
}