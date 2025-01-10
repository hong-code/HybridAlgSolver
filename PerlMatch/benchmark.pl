use Time::HiRes qw(gettimeofday);
use Encode;

sub measure {
    my ($data, $pattern) = @_;

    my $start = Time::HiRes::gettimeofday();

    my $count = () = $data =~ /$pattern/gi;

    my $elapsed = (Time::HiRes::gettimeofday() - $start) * 1e3;

    printf("%f - %d\n", $elapsed, $count);
}

if (@ARGV != 2) {
  die "Usage: ./benchmark.pl <filename>\n";
}

my ($regex_file, $data_file) = @ARGV;

# 读取正则表达式
open my $regex_fh, '<', $regex_file or die "Could not open regex file: $!";
my $pattern = <$regex_fh>;  # 读取第一行正则表达式
chomp $pattern;            # 去掉换行符
close $regex_fh;

# 读取文本文件
open my $data_fh, '<', $data_file or die "Could not open data file: $!";

my $data;
read $data_fh, $data, -s $data_file;  # 读取整个文件内容
if ($data =~ /\n/) {
    print "File ends with a newline.\n";
} else {
    print "No newline at the end of the file.\n";
}

# 测试正则表达式
print "Testing pattern: $pattern\n";
measure($data, $pattern);