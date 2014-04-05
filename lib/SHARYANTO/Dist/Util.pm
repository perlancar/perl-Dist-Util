package SHARYANTO::Dist::Util;

use 5.010001;
use strict;
use warnings;

use Config;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       packlist_for
               );

# VERSION

sub packlist_for {
    my $mod = shift;

    unless ($mod =~ s/\.pm\z//) {
        $mod =~ s!::!/!g;
    }

    for (@INC) {
        return if ref($_);
        my $f = "$_/$Config{archname}/auto/$mod/.packlist";
        return $f if -f $f;
    }
    undef;
}

1;
# ABSTRACT: Dist-related utilities

=head1 SYNOPSIS

 use SHARYANTO::Dist::Util qw(
     packlist_for
 );


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 packlist_for($mod) => STR

Find C<.packlist> file for module C<$mod> (which can be in the form of
C<Package::SubPkg> or C<Package/SubPkg.pm>). Return undef if none is found.


=head1 SEE ALSO

L<SHARYANTO>

=cut
