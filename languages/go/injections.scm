; Refer to https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/go/injections.scm#L4C1-L16C41
(call_expression
  (selector_expression) @_function
  (#any-of? @_function
    "regexp.Match" "regexp.MatchReader" "regexp.MatchString" "regexp.Compile" "regexp.CompilePOSIX"
    "regexp.MustCompile" "regexp.MustCompilePOSIX")
  (argument_list
    .
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @injection.content
    (#set! injection.language "regex")))

(const_spec
 name: (identifier) @_object
 value: (expression_list  
              (raw_string_literal 
                (raw_string_literal_content) @injection.content))
  (#match? @_object "\w*Query")
  (#set! injection.language "sql"))
