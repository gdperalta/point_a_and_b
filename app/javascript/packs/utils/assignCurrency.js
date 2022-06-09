/**
 *
 * @param {String} currency - Currency to be used (Php, Usd)
 * @param {Number} rate - The price or rate to be formatted
 * @returns {String} - Returns formatted amount with currency
 */
export const assignCurrency = (currency, rate) => {
	return `${currency} ${rate}`;
};
