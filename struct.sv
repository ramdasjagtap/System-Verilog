

struct {
	int a;
	byte b;
	bit [7:0] c;
	}my_data_struct;

my_data_struct.a = 123;
$display("a value is %d",my_data_struct.a);
