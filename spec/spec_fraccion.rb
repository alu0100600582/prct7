require "./lib/fraccion.rb"


describe Fraccion do
	
    before :each do
      @frac1 = Fraccion.new(5,2)	
      @frac2 = Fraccion.new(3,6)	
    end 

    describe "Almacenamiento de los datos" do
    
    	
		it "Debe existir un numerador de la fraccion 1" do
			@frac1.num.should == 5
		end
		it "Debe existir un numerador de la fraccion 1" do
			@frac1.denom.should == 2
		end
		it "Debe existir un numerador de la fraccion 2" do
			@frac2.num.should == 3
		end
		it "Debe existir un numerador de la fraccion 2" do
			@frac2.denom.should == 6
		end
	
		
		it "Debe de estar en su forma reducida" do
			@frac2.simplificar.numer.should eq(1)
			@frac2.simplificar.denomin.should eq(2)
		end
		
		
		it "Se debe invocar al metodo num() para obtener el numerador" do
			@frac1.num.should eq(5) 
		end
		it "Se debe invocar al metodo denom() para obtener el denominador" do
			@frac1.denom.should eq(2)  
		end
		
	end
	
	describe "Comprobamos las funciones to_s y to_f" do
		it "Se debe mostrar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
			@frac1.to_s.should eq("5/2")
		end
		it "Se debe mostrar por la consola la fraccion en formato flotante" do
			@frac1.to_f.should == 5/2.0
		end
	end
    
    describe "Comprobamos las funciones ==, absoluto, reciproco e inverso" do
		it "Se debe comparar si dos fracciones son iguales con ==" do
			temp = (@frac1 == @frac2)
			temp.should eq(false)
		end
    
		it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
			Aux1=Fraccion.new(-5,2)
			Aux1.absoluto
			Aux1.numer.should eq(@frac1.numer)
			Aux1.denomin.should eq(@frac1.denomin)
		end
	
		it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
			Aux=Fraccion.new(2,5)
			Aux.reciprocal
			Aux.numer.should eq(@frac1.numer)
			Aux.denomin.should eq(@frac1.denomin)
		end

		it "Se debe calcular el opuesto de una fraccion con -" do
			Aux2 = Fraccion.new(-5,2)
			Aux2.opuesto
			Aux2.numer.should eq(@frac1.numer)
		end
	
	end
	
    describe "Comprobamos los operadores arimeticos (suma, resta, multiplicacion y division" do
	
		it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
			aux =	(@frac1 + @frac2)	
			aux.denomin.should eq(1)
			aux.numer.should eq(3)
		end
   
		it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
			aux = @frac1 - @frac2
			aux.numer.should eq(2)
			aux.denomin.should eq(1)
		end
	
		it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
			aux = @frac1 * @frac2
			aux.numer.should eq(5)
			aux.denomin.should eq(4)
		end
    
		it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
			aux = @frac1 / @frac2
			aux.numer.should eq(5)
			aux.denomin.should eq(1)
		end
	
	end
 
    describe "Comprobamos las funciones resto, y las operaciones logicas" do

		it "Se debe calcular el resto de dos fracciones con % y dar el resultado de forma reducida" do
			aux = @frac1%@frac2
			aux.should eq(0)
		end
    
		it "Se debe de poder comprobar si una fracion es menor que otra" do
			(@frac1 < Fraccion.new(1,2)).should == false
		end

		it "Se debe de poder comprobar si una fracion es mayor que otra" do
			(@frac1 > Fraccion.new(1, 1)).should == true
		end
    
		it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
			(@frac1 <= Fraccion.new(1,2)).should == false
		end
    
		it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
			(@frac1 >= Fraccion.new(1,2)).should == true
		end  
    end
	

end
