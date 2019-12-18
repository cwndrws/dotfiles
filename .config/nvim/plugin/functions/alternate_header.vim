function AlternateHeader()
    let source_extensions = ["c", "cpp", "c++"]
    let header_extensions = ["h"]
    let extension = expand("%:e")
    let file_base = expand("%:r")
    let alternate_extension = ""
    if InList(extension, source_extensions)
        let alternate_extension = FindFileWithExtension(file_base, header_extensions)
    elseif InList(extension, header_extensions)
        let alternate_extension = FindFileWithExtension(file_base, source_extensions)
    else
        throw "unrecognized extension: " . extension
    endif
    execute('edit ' . file_base . '.' . alternate_extension)    
endfunction

function InList(item, list)
    return (index(a:list, a:item) >= 0)
endfunction

function FindFileWithExtension(file_base, extensions)
    for ext in a:extensions 
        let file_to_try = a:file_base . '.' . ext
        if filereadable(file_to_try)
            return ext
        endif
    endfor
    throw "no source file found for " . a:file_base
endfunction
