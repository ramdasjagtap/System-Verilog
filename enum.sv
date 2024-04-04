module enum_method;

typedef enum {red,blue,green} colour;
colour c;

initial begin
	 c = c.first();
	 $display("%s",c.name());

	 c = c.last();
	 $display("%s",c.name());

         c = c.prev();
	 $display("%s",c.name());

         c = c.last();
	 $display("%s",c.name());


end
endmodule
