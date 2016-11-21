function eslintblame --description 'Parse eslint output into git-blame to unveil the offenders'
    # Store eslint report from stdin, without the error/warning count
    # See: https://github.com/fish-shell/fish-shell/issues/206#issuecomment-255232968
    cat 1>| head --line=-3 | read -z report
    # Get list of files with errors
    set -l files (echo $report | grep $PWD)
    for file in $files
        # Escape slashes from file paths to use inside sed regular expression
        set -l escaped (echo $file | sed -e 's#/#\\\/#g')
        # Extract text, from file path to next empty line with sed (inclusive)
        # and then remove file path and empty line with head and tail
        set -l errors (echo $report | sed -n -e '/'$escaped'/,/^\s*$/p' | head -n -1 | tail -n +2)
        # Print out filename
        echo $file
        # For each error in a given file, print the error with its author
        for error in $errors
            # Get error line number to be passed to git blame
            set -l line (echo $error | cut -d : -f 1 | sed 's/\s//g')
            # Store git blame result, using read -z to preserve new lines
            # See: https://github.com/fish-shell/fish-shell/issues/159#issuecomment-240330354
            git blame --porcelain -L $line,$line -- $file | read -z blame
            # Extract commit hash
            set -l shasum (echo $blame | head -1 | cut -d ' ' -f 1)
            # Extract commit author
            set -l author (echo $blame | grep 'author ' | cut -d ' ' -f2-)
            # Print eslint error, using a tab to align with next line
            echo -e '\t'(echo $error | sed 's/^\s*//')
            # Then print commit hash and author
            echo -e "\t$shasum\t$author\n"
        end
        echo
    end
end
