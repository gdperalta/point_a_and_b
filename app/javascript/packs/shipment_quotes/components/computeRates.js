import { assignCurrency } from '../../utils/assignCurrency';
import { filterData, assignData } from '../../utils/handleData';

class ComputeRates {
	constructor() {
		this.courierTable = document.getElementById('courier_table');
		this.couriers = JSON.parse(this.courierTable.dataset.couriers);
		[this.pickupProvince, this.deliveryProvince] =
			document.querySelectorAll('.provinces');
		[this.pickupCities, this.deliveryCities] =
			document.querySelectorAll('.cities');
		this.computeBtn = document.getElementById('compute_button');
		this.metroManilaId = '1347';
		this.invalidAddressMessage =
			'We currently have no shipments available for pickup addresses outside Metro Manila';
		this.requiredFieldsMessage =
			'Please fill up the cities field to compute the courier rates';
		this.addEvent();
	}

	addEvent = () => {
		this.computeBtn.addEventListener('click', (e) => this.iterateCouriers(e));
	};

	iterateCouriers = (e) => {
		e.preventDefault();
		this.courierTable.innerHTML = '';

		if (this.handleErrors()) {
			return;
		} else {
			this.couriers.forEach((courier) => {
				this.handleCourierRates(courier);
			});
		}
	};

	handleCourierRates(courier) {
		courier.rate = assignCurrency('Php', this.assignRates(courier));
		if (courier.rate.includes('null')) return;

		this.addFields(courier);
	}

	addFields = (resource) => {
		let row = document.createElement('tr');
		let filteredData = filterData(resource);

		assignData(filteredData, row);
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

	handleErrors() {
		if (!this.pickupCities.value || !this.deliveryCities.value) {
			this.showErrorMessage(this.requiredFieldsMessage);
			return true;
		} else if (this.pickupProvince.value !== this.metroManilaId) {
			this.showErrorMessage(this.invalidAddressMessage);
			return true;
		} else {
			return false;
		}
	}

	showErrorMessage = (message) => {
		// TODO create proper error message
		let row = document.createElement('tr');
		let dataColumn = document.createElement('td');
		dataColumn.colSpan = '3';
		dataColumn.innerText = message;
		row.appendChild(dataColumn);
		this.courierTable.appendChild(row);
	};
}

export default ComputeRates;
