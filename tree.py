import requests
from bs4 import BeautifulSoup

def fetch_course_info(url):
    """Fetch the course name, number, and prerequisites from the given URL."""
    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')

    # Extract course name and number
    course_title_element = soup.find('h1', {'id': 'course_preview_title'})
    course_title = course_title_element.text.strip() if course_title_element else "Unknown Course"

    # Restrict search to prerequisites
    prerequisites = []
    prereq_section = soup.find('strong', text="Prerequisite(s):")  # Find the specific prerequisite section
    if prereq_section:
        parent = prereq_section.find_parent()  # Get the parent element containing the prerequisites
        ls = parent.find_all('a', href=True)
        print(ls)
        for prereq_link in ls:
            if 'preview_course.php?catoid' in prereq_link['href']:
                prerequisites.append({
                    'url': f"https://catalog.sjsu.edu/{prereq_link['href']}"
                })
    return course_title, prerequisites


def build_prereq_tree(url, depth=0, visited=None):
    """Recursively fetch and print the prerequisite tree."""
    if visited is None:
        visited = set()
    
    # Skip already visited URLs
    if url in visited:
        return
    visited.add(url)

    # Fetch course info
    course_title, prerequisites = fetch_course_info(url)

    # Print the current course
    print("  " * depth + course_title)

    # Recurse into prerequisites
    for prereq in prerequisites:
        build_prereq_tree(prereq['url'], depth + 1, visited)


def splitit(s):
    """Utility function to split a string by '-' and strip spaces."""
    return list(map(lambda x: x.strip(), s.split("-")))


if __name__ == "__main__":
    # Starting URL (can replace with input URL)
    start_url = "https://catalog.sjsu.edu/preview_course.php?catoid=15&coid=132160"
    print("Course Prerequisite Tree:")
    build_prereq_tree(start_url)
