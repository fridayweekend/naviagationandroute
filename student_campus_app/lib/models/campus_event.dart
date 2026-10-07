class CampusEvent {
  final String date;
  final String title;
  final String time;
  final String venue;
  final String description;
  final bool registered;

  const CampusEvent({
    required this.date,
    required this.title,
    required this.time,
    required this.venue,
    required this.description,
    this.registered = false,
  });
}

const campusEvents = <CampusEvent>[
  CampusEvent(
    date: '12 OCT',
    title: 'Campus Innovation Day',
    time: '10:00 AM - 3:00 PM',
    venue: 'Main Hall',
    description:
        'A student showcase featuring technology projects, creative ideas and innovation activities.',
  ),
  CampusEvent(
    date: '18 OCT',
    title: 'Career Preparation Workshop',
    time: '2:00 PM - 4:00 PM',
    venue: 'Seminar Room 3',
    description:
        'A practical session covering CV preparation, interview skills and professional communication.',
  ),
  CampusEvent(
    date: '25 OCT',
    title: 'Student Sports Carnival',
    time: '8:00 AM - 1:00 PM',
    venue: 'Campus Sports Centre',
    description:
        'A friendly campus sports event with team activities and recreational games.',
  ),
];
