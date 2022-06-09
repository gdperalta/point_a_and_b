import { assignCurrency } from '../utils/assignCurrency';

class ComputeRates {
	constructor() {
		this.ratesColumn = document.querySelectorAll('.rates_column');
		[this.pickupProvince, this.deliveryProvince] =
			document.querySelectorAll('.province_input');
		this.computeBtn = document.getElementById('compute_button');
		this.addEvent();
	}

	addEvent = () => {
		this.computeBtn.addEventListener('click', (e) => this.iterateRates(e));
	};

	iterateRates = (e) => {
		e.preventDefault();

		this.ratesColumn.forEach((rate) => {
			this.assignRates(rate);
		});
	};

	assignRates = (rate) => {
		rate.innerText = this.isWithinMetroManila()
			? assignCurrency('Php', rate.dataset.withinMetroManila)
			: assignCurrency('Php', rate.dataset.outsideMetroManila);
	};

	isWithinMetroManila = () => {
		return (
			this.pickupProvince.value === 'Metro Manila' &&
			this.pickupProvince.value === this.deliveryProvince.value
		);
	};
}

document.addEventListener('turbolinks:load', () => {
	new ComputeRates();
});
