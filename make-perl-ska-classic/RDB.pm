package Ska::RDB;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

use RDB;
use POSIX qw(strtod);
use File::Temp;
use File::Copy;
use Carp;

require Exporter;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

@EXPORT_OK = qw(
		create_rdb_template
		read_rdb
		merge_rdb
		write_rdb
);

%EXPORT_TAGS = (all => \@EXPORT_OK);

$VERSION = '0.4';


# Preloaded methods go here.


##****************************************************************************
sub create_rdb_template {
##****************************************************************************
    my ($file,$template) = @_;

    my $rdb_old = new RDB $template or die "Couldn't open $template\n";

    # Open new one using template from old

    my $rdb = new RDB;
    $rdb->open("$file", ">") or die "Couldn't open $file\n";
    $rdb->init($rdb_old);

    $rdb_old->close();
    
    return $rdb;
}    


##****************************************************************************
sub write_rdb {
##****************************************************************************
    my ($file, $data, @cols) = @_;
    my $unused_chars;
    my $col_data;
    my $data_out;
    my %type;
    my ($col, $i);
    local $_;

    # Figure out if its a hash of arrays or array of hashes
    my $hoa = (ref($data) eq 'HASH');

    # If cols are not supplied, use keys from data or first element (if not hoa)
    unless (@cols) {
	@cols = $hoa ? keys %{$data} : keys %{$data->[0]};
    }

    # Figure out number of data elements.  NO checking done for ill formed data
    my $n_data = $hoa ? @{$data->{$cols[0]}} : @{$data};

    # Figure out data type and length for each column
    foreach $col (@cols) {
	my $max_len = 0;
	my $could_be_double = 1;

	foreach $i (0 .. $n_data-1) {
	    $_ = $hoa ? $data->{$col}[$i] : $data->[$i]{$col};
	    $max_len = length if (length > $max_len);

	    if ($could_be_double and length>0) {
		(undef, $unused_chars) = strtod($_);
		next if ($unused_chars == 0);

		$could_be_double = 0;
	    }
	}
	$type{$col} = $could_be_double ? "${max_len}N" : "${max_len}S";
    }

    my $rdb = new RDB;
    $rdb->open($file, ">") or carp "write_rdb: Could not open $file for writing\n";
    $rdb->init( map {$_ => $type{$_}} @cols );
	    
    foreach $i (0 .. $n_data-1) {
	$data_out = $hoa ? {map { $_ => $data->{$_}[$i] } @cols} : $data->[$i];
	$rdb->write($data_out);
    }

    $rdb->close();

    1;
}


##****************************************************************************
sub read_rdb {
##****************************************************************************
    my $file = shift;
    my %data;
    my @db;

    my $rdb = new RDB $file or die "Couldn't open $file\n";
    while ($rdb->read(\%data)) {
	push @db, {%data};
    }

    return @db;
}

##****************************************************************************
sub merge_rdb {
##****************************************************************************
    my ($sort_cols, $new_file, $old_file) = @_;
    my $tmp = File::Temp::tmpnam();
    system("sorttbl < $new_file $sort_cols > $tmp");
    if (-e $old_file) {
	move($tmp, $new_file) or croak "Merge_rdb: error on file move\n";

	# Make a backup
	copy($old_file, "$old_file~") or croak "Merge_rdb: error on file move\n";

	# merge new info into master table
	system("mergetbl < $old_file $sort_cols $new_file > $tmp");
    }
    move($tmp, $old_file) or croak "Merge_rdb: error on file move\n";
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

Ska::RDB - Common tasks for RDB file processing

=head1 SYNOPSIS

  use Ska::RDB qw(:all);

  # Read entire 'foo.rdb' and return as an array of hashes
  @db =	read_rdb('foo.rdb');

  # Use an existing RDB as the template to create a new file for writing
  $rdb = create_rdb_template('new.rdb', 'template.rdb');
  while (...) { $rdb->write(\%data) }

  # Merge data from a 'new.rdb' file into 'existing.rdb', 
  # sorting on specified cols (space separated string)
  merge_rdb('obsid detector', 'new.rdb', 'existing.rdb');

  # Write a hash-of-arrays or an array-of-hashes to specified RDB file.
  # Optionally specify a list of columns
  write_rdb('out.rdb', \@db);
  write_rdb('out.rdb', \%db, @cols);

=head1 DESCRIPTION

Wrapper around RDB package to simplify some common tasks.

=head1 AUTHOR

Tom Aldcroft

=head1 SEE ALSO

perl(1).

=cut
