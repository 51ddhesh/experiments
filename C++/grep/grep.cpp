#include <iostream>              
#include <fstream>               
#include <regex>                 // For regular expression matching
#include <vector>                
#include <string>                
#include <filesystem>            // For filesystem operations like recursive directory iteration

using namespace std;            
using namespace std::filesystem; // Use the standard filesystem namespace for file and directory handling

// Function to search for a regex pattern in a given file and return matching lines
static vector<pair<size_t, string>> match(const path& p, const regex& r) {
    vector<pair<size_t, string>> d;  // Vector to store pairs of line number and matching string
    ifstream is {p.c_str()};          
    string s;                         // String to hold each line of the file
    for (size_t line {1}; getline(is, s); line++) {  // Read the file line by line
        if (regex_search(begin(s), end(s), r)) {     // If the regex matches the current line
            d.emplace_back(line, move(s)); // Store the line number and matching line in the vector
        }
    }
    return d;  // Return the vector of matches (line number and content)
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cout << "Usage: " << argv[0] << " <pattern>\n";  
        return 1;  
    }

    regex pattern;  // Declare a regex object to store the pattern

    try {
        // Attempt to compile the regex from the user-provided pattern
        pattern = regex{argv[1]};
    }
    catch (const regex_error &e) {  // If an error occurs during pattern compilation
        cout << "Invalid pattern\n";  // Inform the user that the pattern is invalid
        return 1;  // Exit with error code
    }

    // Iterate through all files and directories in the current directory recursively
    for (const auto &entry : recursive_directory_iterator{current_path()}) {
        // Match the pattern in the current file (entry.path())
        auto ms = match(entry.path(), pattern);
        
        // If there are any matches, print them with the file name and line number
        for (const auto &[number, content] : ms) {
            cout << entry.path().c_str() << ":" << number << " - " << content << '\n';
            // Print file path, line number, and the content of the matching line
        }
    }

    return 0;  
}
