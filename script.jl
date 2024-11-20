using Gumbo, HTTP, Cascadia

function fetch_course_info(url, base)
    """Fetch the course information (title, prerequisites) from a given URL."""
    response = String(HTTP.get(url).body)
    parsed_html = parsehtml(response)
    root = parsed_html.root

    # Extract the course title
    title_selector = Selector("#course_preview_title")
    title_node = only(eachmatch(title_selector, root))
    course_number, course_name = split(text(title_node), " - ")

    # Extract the prerequisite links
    prereq_selector = Selector("a")
    prereq_links = eachmatch(prereq_selector, root)

    function is_prereq_link(a)
        haskey(a.attributes, "onclick") &&
            occursin("preview_course", a.attributes["href"]) &&
            !haskey(a.attributes, "alt")
    end

    prereqs = filter(is_prereq_link, prereq_links)
    prereq_urls = [joinpath(base, a.attributes["href"]) for a in prereqs]

    return (course_number, course_name, prereq_urls)
end

function build_prereq_tree(url, base, depth=0, visited=Set())
    """Recursively fetch and print the prerequisite tree."""
    # Skip if the URL is already visited
    if url in visited
        return
    end
    push!(visited, url)

    # Fetch course information
    course_number, course_name, prereq_urls = fetch_course_info(url, base)

    # Print the course information
    println("  "^depth * "$course_number - $course_name")

    # Recursively process prerequisites
    for prereq_url in prereq_urls
        build_prereq_tree(prereq_url, base, depth + 1, visited)
    end
end

# Base URL for the SJSU course catalog
base_url = "https://catalog.sjsu.edu/"
start_url = "https://catalog.sjsu.edu/preview_course.php?catoid=15&coid=132160"

# Build and print the prerequisite tree
println("Course Prerequisite Tree:")
build_prereq_tree(start_url, base_url)
