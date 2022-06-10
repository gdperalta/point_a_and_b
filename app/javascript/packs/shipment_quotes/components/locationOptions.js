import ApiLocations from '../../services/apiLocations';

class LocationOptions {
	constructor() {
		this.locations = new ApiLocations();
		this.countries = this.getCountries();
		this.countriesOptions = document.querySelectorAll('.countries');
		this.provincesOptions = document.querySelectorAll('.provinces');
		this.addEvents();
	}

	addEvents() {
		this.countriesOptions.forEach((el) => {
			el.addEventListener('change', (e) => this.updateProvinceOptions(e));
		});

		this.provincesOptions.forEach((el) => {
			el.addEventListener('change', (e) => this.updateCitiesOptions(e));
		});
	}

	updateProvinceOptions(e) {
		e.preventDefault();

		let field = e.target;
		let parentField = field.parentElement;
		let provincesField = parentField.querySelector('.provinces');

		this.getProvinces(field.value, provincesField);
	}

	updateCitiesOptions(e) {
		e.preventDefault();

		let field = e.target;
		let parentField = field.parentElement;
		let citiesField = parentField.querySelector('.cities');

		this.getCities(field.value, citiesField);
	}

	async getCountries() {
		const response = await this.locations.fetchCountries();

		this.countriesOptions.forEach((selectInput) => {
			this.appendOptions(response, selectInput);
		});
	}

	async getProvinces(country_id, selectInput) {
		const response = await this.locations.fetchProvinces(country_id);

		this.appendOptions(response, selectInput);
	}

	async getCities(province_id, selectInput) {
		const response = await this.locations.fetchCities(province_id);

		this.appendOptions(response, selectInput);
	}

	appendOptions(response, selectInput) {
		length = selectInput.length;
		this.removeOptions(selectInput);

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
