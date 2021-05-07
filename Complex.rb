class ComplexNumber

    # @@plus = 0
    # @@multiply=0
    # @@bulk_add=0
    # @@bulk_multiply=0

    @@stats = {"plus" => 0, "multiply" => 0, "bulk_add" => 0, "bulk_multiply" => 0}
    attr_accessor :real, :imaginary

    #assign real and imaginary when create new instance
    def initialize (real,imaginary)
        @real      = real
        @imaginary = imaginary
    end

    ##operator overloading
    def +(cn)
        # @@plus += 1
        @@stats["plus"] += 1
        addedComplexNum = ComplexNumber.new(self.real + cn.real, self.imaginary + cn.imaginary)
        return addedComplexNum
    end
    
    ##operator overloading
    def *(cn)
        # @@multiply += 1
        @@stats["multiply"] += 1
        multComplexNum  = ComplexNumber.new(self.real * cn.real, self.imaginary * cn.imaginary)
        return multComplexNum
    end

    def self.bulk_add(cns)
        # @@bulk_add +=1
        @@stats["bulk_add"] += 1
        compNum = ComplexNumber.new(0,0)
        cns.each do |cn|
            compNum = compNum + cn
        end
        return compNum
    end

    def self.bulk_multiply(cns)
        # @@bulk_multiply += 1
        @@stats["bulk_multiply"] += 1
        compNum = cns.first
        cns.drop(1).each do |cn| 
            compNum =  compNum * cn 
        end
        return compNum 
    end

    def self.get_stats
        # puts ("Plus :#{@@plus} - Mul: #{@@multiply} - bulk_add: #{@@bulk_add} - bulk_multiply: #{@@bulk_multiply}")
        puts (@@stats)
    end

end



def printNum(cn)
    puts(cn.real.to_s + " + " + cn.imaginary.to_s + "i")
end 
compexNum1 = ComplexNumber.new(3,2)
compexNum2 = ComplexNumber.new(1,7)


printNum(compexNum1+compexNum2)
printNum(compexNum1*compexNum2)
printNum(ComplexNumber.bulk_add([compexNum1,compexNum2]))
printNum(ComplexNumber.bulk_multiply([compexNum1, compexNum2]))

ComplexNumber.get_stats
