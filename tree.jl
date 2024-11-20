using Gumbo, HTTP, Cascadia
base = "https://catalog.sjsu.edu/"
url = "https://catalog.sjsu.edu/preview_course.php?catoid=15&coid=132160"

prereqs = []
function get_num_title_and_prereq_urls(url)
    s = String(HTTP.get(url).body)
    h = parsehtml(s)
    sel = Selector(".toplevel_popup > tbody:nth-child(1) > tr:nth-child(2)")
    hr = h.root
    ms = only(eachmatch(sel, h.root))
    asel = Selector("a")
    tsel = Selector("#course_preview_title")
    t = only(eachmatch(tsel, hr))
    num, title = split(text(t), " - ")

    as = eachmatch(asel, ms)
    get_prereqs(as) = filter(a -> haskey(a.attributes, "onclick") && !haskey(a.attributes, "alt") && occursin("preview_course", a.attributes["href"]), as)

    ps = get_prereqs(as)
    p_urls = base .* map(p-> p.attributes["href"], ps)
    return (num, title, p_urls)
end

get_num_title_and_prereq_urls(url)