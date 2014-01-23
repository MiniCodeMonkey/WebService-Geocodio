use 5.014;
use WebService::Geocodio;
use WebService::Geocodio::Location;

use Test::More;

BEGIN { 
    if (! $ENV{GEOCODIO_API_KEY} ) {
        say "Set GEOCODIO_API_KEY to run these tests.";
    }
};

my $geo = WebService::Geocodio->new(
    api_key => $ENV{GEOCODIO_API_KEY}
);
    
# Wrigley Field
my $loc = WebService::Geocodio::Location->new(
    number => 1060,
    street => 'W Addison',
    suffix => 'Street',
    city => 'Chicago',
    state => 'IL',
);

$geo->add_location($loc, '20050');

map { say $_->city, ": ", $_->lat, ", ", $_->lng, "\n" } $geo->geocode();

ok(1);
done_testing();