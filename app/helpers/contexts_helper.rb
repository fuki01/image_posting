module ContextsHelper
    def wordCount(word)
        if word.size > 55
            "#{word.slice(1..55)}..."
        else
            "#{word}"
        end
    end
end
