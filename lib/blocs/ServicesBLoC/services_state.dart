import '../../Models/Service.dart';

abstract class ServicesState{
  List<Service> listService=[];
  ServicesState(this.listService);
}

List<Service> services = [
  Service(
    id: 1,
    name: 'Facial Treatment',
    duration: '60 minutes',
    details: 'A facial treatment that includes cleansing, exfoliation, and a hydrating mask.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
  Service(
    id: 2,
    name: 'Massage Therapy',
    duration: '90 minutes',
    details: 'A relaxing full-body massage using aromatic oils.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
  Service(
    id: 3,
    name: 'Manicure & Pedicure',
    duration: '45 minutes',
    details: 'A complete manicure and pedicure session including nail shaping, cuticle care, and polish.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
  Service(
    id: 4,
    name: 'Hot Stone Massage',
    duration: '75 minutes',
    details: 'A therapeutic massage using heated stones to relieve tension and promote relaxation.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
  Service(
    id: 5,
    name: 'Body Scrub',
    duration: '45 minutes',
    details: 'A refreshing exfoliation treatment to remove dead skin cells and improve circulation.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
  Service(
    id: 6,
    name: 'Hair Treatment',
    duration: '60 minutes',
    details: 'A nourishing hair treatment to repair and revitalize dry or damaged hair.',
    imageUrl: 'https://oakwell.com/wp-content/uploads/2023/12/spa-treatments-facial.jpg',
  ),
];
class ServicesInitial extends ServicesState{
  ServicesInitial():super(services);
}