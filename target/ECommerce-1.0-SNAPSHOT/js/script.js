function addToCartMsg()
{
	alert("Product added to cart successfully!");
	document.cart.submit();
}

function removeItem()
{
	if(confirm("Confirm remove?") == true)
	{
		document.f1.submit();
		return true;
	}
	else
	{
		return false;
	}
}