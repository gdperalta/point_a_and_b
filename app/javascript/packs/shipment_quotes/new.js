import { assignCurrency } from '../utils/assignCurrency';
import { filterData, assignData } from '../utils/handleData';

class ComputeRates {
	constructor() {
		this.courierTable = document.getElementById('courier_table');
		this.couriers = JSON.parse(this.courierTable.dataset.couriers);
		[this.pickupProvince, this.deliveryProvince] =
			document.querySelectorAll('.province_input');
		this.computeBtn = document.getElementById('compute_button');
		this.addEvent();
	}

	addEvent = () => {
		this.computeBtn.addEventListener('click', (e) => this.iterateCouriers(e));
	};

	iterateCouriers = (e) => {
		e.preventDefault();
		this.courierTable.innerHTML = '';

		// TODO create proper error message
		if (this.pickupProvince.value.toUpperCase() !== 'METRO MANILA') {
			this.errorMessage();
			return;
		}

		this.couriers.forEach((courier) => {
			courier.rate = assignCurrency('Php', this.assignRates(courier));
			if (courier.rate.includes('null')) return;

			this.addFields(courier);
		});
	};

	addFields = (resource) => {
		let row = document.createElement('tr');
		let filteredData = filterData(resource);

		assignData(filteredData, row);
		this.courierTable.appendChild(row);
	};

	errorMessage = () => {
		let row = document.createElement('tr');
		let dataColumn = document.createElement('td');
		dataColumn.colSpan = '3';
		dataColumn.innerText =
			'We currently have no shipments available for pickup addresses outside Metro Manila';
		row.appendChild(dataColumn);
		this.courierTable.appendChild(row);
	};

	assignRates = (courier) => {
		return this.isWithinMetroManila()
			? courier.within_metro_manila
			: courier.outside_metro_manila;
	};

	isWithinMetroManila = () => {
		return this.pickupProvince.value === this.deliveryProvince.value;
	};
}

document.addEventListener('turbolinks:load', () => {
	new ComputeRates();
});
