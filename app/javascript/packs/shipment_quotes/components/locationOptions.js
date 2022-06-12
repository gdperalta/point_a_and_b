import ApiLocations from '../../services/apiLocations';

class LocationOptions {
	constructor() {
		this.locations = new ApiLocations();
		this.countriesOptions = document.querySelectorAll('.countries');
		[this.countriesOptionsPickup, this.countriesOptionsDelivery] =
			this.countriesOptions;
		this.provincesOptions = document.querySelectorAll('.provinces');
		this.addEvents();
		this.getLocations(this.countriesOptionsPickup);
		this.getLocations(this.countriesOptionsDelivery);
	}

	addEvents() {
		this.countriesOptions.forEach((el) => {
			el.addEventListener('change', (e) =>
				this.updateSelectOptions(e, '.provinces')
			);
		});

		this.provincesOptions.forEach((el) => {
			el.addEventListener('change', (e) => this.updateSelectOptions(e, '.cities'));
		});
	}

	updateSelectOptions(e, query) {
		e.preventDefault();

		let field = e.target;
		let parentField = field.parentElement;
		let selectInput = parentField.querySelector(query);

		this.getLocations(selectInput, field.value);
	}

	async getLocations(selectInput, location_id = null) {
		let response;
		if (selectInput.className.includes('provinces')) {
			response = await this.locations.fetchProvinces(location_id);
		} else if (selectInput.className.includes('cities')) {
			response = await this.locations.fetchCities(location_id);
		} else if (selectInput.className.includes('countries')) {
			response = await this.locations.fetchCountries();
		}

		this.appendOptions(response, selectInput);
	}

	appendOptions(response, selectInput) {
		length = selectInput.length;
		this.removeOptions(selectInput);
		selectInput.disabled = false;

		response.forEach((data) => {
			let option = document.createElement('option');
			option.value = data.id;
			option.innerText = data.name;

			selectInput.append(option);
		});
	}

	removeOptions(selectInput) {
		for (let i = length - 1; i >= 0; i--) {
			selectInput.options.remove(i);
		}
	}
}

export default LocationOptions;
