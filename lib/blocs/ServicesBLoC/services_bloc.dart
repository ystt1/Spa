

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/Models/CategoryService.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_event.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_state.dart';

import '../../Models/Service.dart';
import '../../repositories/ServiceRepository.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServiceRepository _serviceRepository;
  List<CategoryService> _listCate=[];
  ServicesBloc(this._serviceRepository) : super(ServicesInitial()) {
    on<ServiceLoadEvent>((event, emit)  async {
      _listCate=await _serviceRepository.getAllCategory();
      return emit(ServicesLoaded( _listCate));
    });

      on<ServiceSeachEvent>((event, emit) {
        // List<CategoryService> listCate = searchServices(event.name);
        List<CategoryService> listCate = searchServices(event.name);
        return emit(ServicesSearch( listCate));
      });
  }
  List<CategoryService> searchServices(String query) {
    query = query.toLowerCase();

    List<CategoryService> result = [];

    for (var category in _listCate) {
      var filteredServices = category.services
          .where((service) => service.name.toLowerCase().contains(query))
          .toList();

      if (filteredServices.isNotEmpty) {
        result.add(CategoryService(
          id: category.id,
          name: category.name,
          services: filteredServices,
        ));
      }
    }

    return result;
  }


}

List<Service> highlighServices = [
  Service(
    id: '1-1',
    imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Basic Haircut',
    duration: '30 mins',
    detail: 'A simple haircut to keep you looking fresh.',
    isHighlight: true,
    price: 15,
    categoryId: '1',
  ),
  Service(
    id: '1-2',
    imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Advanced Haircut',
    duration: '45 mins',
    detail: 'A more detailed haircut with styling included.',
    isHighlight: false,
    price: 25,
    categoryId: '1',
  ),
  Service(
    id: '2-1',
    imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Swedish Massage',
    duration: '60 mins',
    detail: 'A relaxing full-body massage.',
    isHighlight: true,
    price: 50,
    categoryId: '2',
  ),
];

List<CategoryService> categoryServices = [
  CategoryService(
    id: '1',
    name: 'Haircut',
    services: [
      Service(
        id: '1-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Haircut',
        duration: '30 mins',
        detail: 'A simple haircut to keep you looking fresh.',
        isHighlight: true,
        price: 15,
        categoryId: '1',
      ),
      Service(
        id: '1-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Advanced Haircut',
        duration: '45 mins',
        detail: 'A more detailed haircut with styling included.',
        isHighlight: false,
        price: 25,
        categoryId: '1',
      ),
    ],
  ),
  CategoryService(
    id: '2',
    name: 'Massage',
    services: [
      Service(
        id: '2-1',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Swedish Massage',
        duration: '60 mins',
        detail: 'A relaxing full-body massage.',
        isHighlight: true,
        price: 50,
        categoryId: '2',
      ),
      Service(
        id: '2-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Deep Tissue Massage',
        duration: '90 mins',
        detail: 'A deeper massage to relieve tension.',
        isHighlight: false,
        price: 70,
        categoryId: '2',
      ),
    ],
  ),
  CategoryService(
    id: '3',
    name: 'Manicure',
    services: [
      Service(
        id: '3-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Manicure',
        duration: '30 mins',
        detail: 'A simple manicure to tidy up your nails.',
        isHighlight: false,
        price: 20,
        categoryId: '3',
      ),
    ],
  ),
  CategoryService(
    id: '4',
    name: 'Pedicure',
    services: [
      Service(
        id: '4-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Pedicure',
        duration: '45 mins',
        detail: 'A basic pedicure to clean and shape your nails.',
        isHighlight: true,
        price: 25,
        categoryId: '4',
      ),
      Service(
        id: '4-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Deluxe Pedicure',
        duration: '60 mins',
        detail: 'A deluxe pedicure with exfoliation and massage.',
        isHighlight: false,
        price: 40,
        categoryId: '4',
      ),
    ],
  ),
  CategoryService(
    id: '5',
    name: 'Facial',
    services: [
      Service(
        id: '5-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Facial',
        duration: '30 mins',
        detail: 'A basic facial to cleanse and refresh your skin.',
        isHighlight: true,
        price: 30,
        categoryId: '5',
      ),
    ],
  ),
  CategoryService(
    id: '6',
    name: 'Spa Package',
    services: [
      Service(
        id: '6-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Relaxation Package',
        duration: '120 mins',
        detail: 'A package including a massage and facial.',
        isHighlight: true,
        price: 100,
        categoryId: '6',
      ),
    ],
  ),
  CategoryService(
    id: '7',
    name: 'Waxing',
    services: [
      Service(
        id: '7-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Waxing',
        duration: '30 mins',
        detail: 'A basic waxing service for smooth skin.',
        isHighlight: false,
        price: 20,
        categoryId: '7',
      ),
      Service(
        id: '7-2',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Full Body Waxing',
        duration: '90 mins',
        detail: 'A comprehensive waxing service for the whole body.',
        isHighlight: true,
        price: 60,
        categoryId: '7',
      ),
    ],
  ),
  CategoryService(
    id: '8',
    name: 'Hair Coloring',
    services: [
      Service(
        id: '8-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Root Touch-up',
        duration: '60 mins',
        detail: 'A root touch-up to cover regrowth.',
        isHighlight: true,
        price: 40,
        categoryId: '8',
      ),
      Service(
        id: '8-2',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Full Hair Color',
        duration: '120 mins',
        detail: 'A full hair coloring service.',
        isHighlight: false,
        price: 80,
        categoryId: '8',
      ),
    ],
  ),
  CategoryService(
    id: '9',
    name: 'Makeup',
    services: [
      Service(
        id: '9-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Day Makeup',
        duration: '45 mins',
        detail: 'Makeup application for a day look.',
        isHighlight: true,
        price: 30,
        categoryId: '9',
      ),
      Service(
        id: '9-2',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Evening Makeup',
        duration: '60 mins',
        detail: 'Makeup application for an evening look.',
        isHighlight: false,
        price: 50,
        categoryId: '9',
      ),
    ],
  ),
  CategoryService(
    id: '10',
    name: 'Skincare',
    services: [
      Service(
        id: '10-1',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Skincare',
        duration: '30 mins',
        detail: 'A basic skincare routine.',
        isHighlight: false,
        price: 20,
        categoryId: '10',
      ),
      Service(
        id: '10-2',
        imgUrl:
            'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Advanced Skincare',
        duration: '60 mins',
        detail: 'An advanced skincare routine with treatments.',
        isHighlight: true,
        price: 50,
        categoryId: '10',
      ),
    ],
  ),
  CategoryService(
    id: '1',
    name: 'Haircut',
    services: [
      Service(
        id: '1-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Haircut',
        duration: '30 mins',
        detail: 'A simple haircut to keep you looking fresh.',
        isHighlight: true,
        price: 15,
        categoryId: '1',
      ),
      Service(
        id: '1-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Advanced Haircut',
        duration: '45 mins',
        detail: 'A more detailed haircut with styling included.',
        isHighlight: false,
        price: 25,
        categoryId: '1',
      ),
    ],
  ),
  CategoryService(
    id: '2',
    name: 'Massage',
    services: [
      Service(
        id: '2-1',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Swedish Massage',
        duration: '60 mins',
        detail: 'A relaxing full-body massage.',
        isHighlight: true,
        price: 50,
        categoryId: '2',
      ),
      Service(
        id: '2-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Deep Tissue Massage',
        duration: '90 mins',
        detail: 'A deeper massage to relieve tension.',
        isHighlight: false,
        price: 70,
        categoryId: '2',
      ),
    ],
  ),
  CategoryService(
    id: '3',
    name: 'Manicure',
    services: [
      Service(
        id: '3-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Manicure',
        duration: '30 mins',
        detail: 'A simple manicure to tidy up your nails.',
        isHighlight: false,
        price: 20,
        categoryId: '3',
      ),
    ],
  ),
  CategoryService(
    id: '4',
    name: 'Pedicure',
    services: [
      Service(
        id: '4-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Pedicure',
        duration: '45 mins',
        detail: 'A basic pedicure to clean and shape your nails.',
        isHighlight: true,
        price: 25,
        categoryId: '4',
      ),
      Service(
        id: '4-2',
        imgUrl: 'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Deluxe Pedicure',
        duration: '60 mins',
        detail: 'A deluxe pedicure with exfoliation and massage.',
        isHighlight: false,
        price: 40,
        categoryId: '4',
      ),
    ],
  ),
  CategoryService(
    id: '5',
    name: 'Facial',
    services: [
      Service(
        id: '5-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Facial',
        duration: '30 mins',
        detail: 'A basic facial to cleanse and refresh your skin.',
        isHighlight: true,
        price: 30,
        categoryId: '5',
      ),
    ],
  ),
  CategoryService(
    id: '6',
    name: 'Spa Package',
    services: [
      Service(
        id: '6-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Relaxation Package',
        duration: '120 mins',
        detail: 'A package including a massage and facial.',
        isHighlight: true,
        price: 100,
        categoryId: '6',
      ),
    ],
  ),
  CategoryService(
    id: '7',
    name: 'Waxing',
    services: [
      Service(
        id: '7-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Waxing',
        duration: '30 mins',
        detail: 'A basic waxing service for smooth skin.',
        isHighlight: false,
        price: 20,
        categoryId: '7',
      ),
      Service(
        id: '7-2',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Full Body Waxing',
        duration: '90 mins',
        detail: 'A comprehensive waxing service for the whole body.',
        isHighlight: true,
        price: 60,
        categoryId: '7',
      ),
    ],
  ),
  CategoryService(
    id: '8',
    name: 'Hair Coloring',
    services: [
      Service(
        id: '8-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Root Touch-up',
        duration: '60 mins',
        detail: 'A root touch-up to cover regrowth.',
        isHighlight: true,
        price: 40,
        categoryId: '8',
      ),
      Service(
        id: '8-2',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Full Hair Color',
        duration: '120 mins',
        detail: 'A full hair coloring service.',
        isHighlight: false,
        price: 80,
        categoryId: '8',
      ),
    ],
  ),
  CategoryService(
    id: '9',
    name: 'Makeup',
    services: [
      Service(
        id: '9-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Day Makeup',
        duration: '45 mins',
        detail: 'Makeup application for a day look.',
        isHighlight: true,
        price: 30,
        categoryId: '9',
      ),
      Service(
        id: '9-2',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Evening Makeup',
        duration: '60 mins',
        detail: 'Makeup application for an evening look.',
        isHighlight: false,
        price: 50,
        categoryId: '9',
      ),
    ],
  ),
  CategoryService(
    id: '10',
    name: 'Skincare',
    services: [
      Service(
        id: '10-1',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Basic Skincare',
        duration: '30 mins',
        detail: 'A basic skincare routine.',
        isHighlight: false,
        price: 20,
        categoryId: '10',
      ),
      Service(
        id: '10-2',
        imgUrl:
        'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
        name: 'Advanced Skincare',
        duration: '60 mins',
        detail: 'An advanced skincare routine with treatments.',
        isHighlight: true,
        price: 50,
        categoryId: '10',
      ),
    ],
  ),
];
