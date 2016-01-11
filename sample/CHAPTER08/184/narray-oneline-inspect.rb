for klass in [NArray, NMatrix, NVector]
  klass.class_eval do
    alias :inspect_orig :inspect
    def inspect
      inspect_orig.gsub(/\n */,'').gsub(/\[ +/, '[').gsub(/ \]/, ']')
    end
  end
end