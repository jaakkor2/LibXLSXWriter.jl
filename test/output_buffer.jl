#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/output_buffer.c
/*
 * Example of using libxlsxwriter to write a workbook file to a memory buffer.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    lxw_workbook_options,
    workbook_new_opt,
    workbook_add_worksheet,
    worksheet_write_string,
    worksheet_write_number,
    workbook_close,
    LXW_NO_ERROR

function main()

    output_buffer = Ref{Ptr{Cchar}}(C_NULL)
    output_buffer_size = Ref{Csize_t}(0)

    # Set the worksheet options.
    options = lxw_workbook_options(
        output_buffer = output_buffer,
        output_buffer_size = output_buffer_size,
        constant_memory = false,
        tmpdir = C_NULL,
        use_zip64 = false,
    )

    # Create a new workbook with options.
    workbook = workbook_new_opt(C_NULL, options)
    worksheet = workbook_add_worksheet(workbook, C_NULL)

    worksheet_write_string(worksheet, 0, 0, "Hello", C_NULL)
    worksheet_write_number(worksheet, 1, 0, 123, C_NULL)

    err = workbook_close(workbook)

    err == LXW_NO_ERROR || return err

    # Do something with the XLSX data in the output buffer.
    open("output_buffer.xlsx", "w") do file
        len = output_buffer_size[]
        buf = unsafe_wrap(Vector{Int8}, output_buffer[], len, own = false)
        write(file, buf)
    end

    Libc.free(output_buffer[])

    nothing
end

main()
