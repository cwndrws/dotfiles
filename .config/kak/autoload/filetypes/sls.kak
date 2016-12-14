hook global BufCreate .*\.sls %{
    set buffer filetype yaml
}
