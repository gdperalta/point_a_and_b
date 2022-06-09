/**
 *
 * @param {Object} param0 - Object to be filtered
 * @returns {Object} - Returns only the following data from the passed object
 */
export const filterData = ({ name, delivery_option, rate }) => ({
	name,
	delivery_option,
	rate,
});

/**
 * Iterates throught the object keys and assigns the data to created table data
 * Then appends data to row
 * @param {Object} resource - Object to be iterated
 * @param {HTMLElement} row - element where data will be appended
 */
export const assignData = (resource, row) => {
	for (let data in resource) {
		let dataColumn = document.createElement('td');
		dataColumn.innerText = resource[data];
		row.appendChild(dataColumn);
	}
};
