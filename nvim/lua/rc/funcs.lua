function echo(val)
    print((type(val) == "table") and vim.inspect(val) or val)
end

-------------------------------------------------------------------------------

string.split = vim.fn.split

-------------------------------------------------------------------------------

table.map = function(tbl, fn)
    local return_tbl = {}
    table.foreach(tbl, function(i, val)
        table.insert(return_tbl, (fn(val)))
    end)
    return return_tbl
end

table.filter = function(tbl, cond_fn)
    local return_tbl = {}
    table.foreach(tbl, function(i, val)
        if(cond_fn(val)) then table.insert(return_tbl, val) end
    end)
    return return_tbl
end

-------------------------------------------------------------------------------

function io.find(dirs, pat)
    return vim.fn.globpath(dirs, pat, false, true)
end

function io._basename(filename)
    return string.gsub(string.gsub(filename, ".*/", ""), "%..*", "")
end

function io._dirname(filename)
    return string.gsub(filename, "(/.+)", "")
end

-------------------------------------------------------------------------------
