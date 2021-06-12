#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <bitset>

using namespace std;

bool is_reference_instruction(string const &line)
{
    return line.find('(') != string::npos;
}

bool is_a_instruction(string const &line)
{
    return line.find('@') != string::npos;
}

bool is_number(const std::string &s)
{
    std::string::const_iterator it = s.begin();
    while (it != s.end() && std::isdigit(*it))
        ++it;
    return !s.empty() && it == s.end();
}

string replace(string const &starting_string, string const &char_to_remove)
{
    string final_string = starting_string;
    size_t found = final_string.find(" ");
    while (found != std::string::npos)
    {
        final_string = final_string.replace(found, 1, "");
        found = final_string.find(" ");
    }
    return final_string;
}

vector<string> parse_line(string line)
{
    vector<string> line_sections;

    if (is_reference_instruction(line))
    {
        line_sections.push_back("REF");
        line_sections.push_back(line.substr(line.find_first_of("(") + 1, line.find_first_of(")") - 1));
        return line_sections;
    }

    if (is_a_instruction(line))
    {
        line_sections.push_back("@");
        line_sections.push_back(line.substr(1));
        return line_sections;
    }

    size_t has_equal = line.find_first_of('=');
    size_t has_semicolon = line.find_first_of(';');

    string dest;
    string jmp;
    string comp;

    if (has_equal != string::npos)
    {
        dest = line.substr(0, has_equal);
    }
    else
        dest = "NULL";

    if (has_semicolon != string::npos)
    {
        jmp = line.substr(has_semicolon + 1, string::npos);
    }
    else
        jmp = "NULL";

    if (has_semicolon == string::npos && has_equal != string::npos)
    {
        comp = line.substr(has_equal + 1);
    }
    else if (has_semicolon != string::npos && has_equal != string::npos)
    {
        comp = line.substr(has_equal + 1, has_semicolon - 2);
    }
    else if (has_semicolon != string::npos && has_equal == string::npos)
    {
        comp = line.substr(0, has_semicolon);
    }

    for (int i = 0; i < dest.length(); i++)
    {
        dest[i] = toupper(dest[i]);
    }

    for (int i = 0; i < jmp.length(); i++)
    {
        jmp[i] = toupper(jmp[i]);
    }

    for (int i = 0; i < comp.length(); i++)
    {
        comp[i] = toupper(comp[i]);
    }

    string a = comp.find("M") != string::npos ? "1" : "0";

    line_sections.push_back(a);
    line_sections.push_back(comp);
    line_sections.push_back(dest);
    line_sections.push_back(jmp);

    return line_sections;
}

int main(int argc, char **argv)
{
    if (!argv[1])
    {
        cout << "Provide filename" << endl;
        return 0;
    }

    string const filename = string(argv[1]);

    size_t lastindex = filename.find_last_of(".");
    if (lastindex == std::string::npos)
    {
        cout << "Error, please provide a valid filetype for the assembly program (.asm)" << endl;
        return 0;
    }

    string const out_file = string(filename.substr(0, lastindex)).append(".hack");

    ifstream fin;
    ofstream fout;

    fin.open(filename, ios::in);
    fout.open(out_file, ios::out);

    if (!fin)
    {
        throw "Error, file could not be read";
    }

    unordered_map<string, string> c_codes;
    c_codes["0"] = "101010";
    c_codes["1"] = "111111";
    c_codes["-1"] = "111010";
    c_codes["D"] = "001100";
    c_codes["A"] = "110000";
    c_codes["M"] = "110000";
    c_codes["!D"] = "001101";
    c_codes["!A"] = "110001";
    c_codes["!M"] = "110001";
    c_codes["-D"] = "001111";
    c_codes["-A"] = "110011";
    c_codes["-M"] = "110011";
    c_codes["D+1"] = "011111";
    c_codes["A+1"] = "110111";
    c_codes["M+1"] = "110111";
    c_codes["D-1"] = "001110";
    c_codes["A-1"] = "110010";
    c_codes["M-1"] = "110010";
    c_codes["D+A"] = "000010";
    c_codes["D+M"] = "000010";
    c_codes["D-A"] = "010011";
    c_codes["D-M"] = "010011";
    c_codes["A-D"] = "000111";

    c_codes["M-D"] = "000111";
    c_codes["D&A"] = "000000";
    c_codes["D&M"] = "000000";
    c_codes["D|A"] = "010101";
    c_codes["D|M"] = "010101";

    unordered_map<string, string> dest_codes;
    dest_codes["NULL"] = "000";
    dest_codes["M"] = "001";
    dest_codes["D"] = "010";
    dest_codes["MD"] = "011";
    dest_codes["A"] = "100";
    dest_codes["AM"] = "101";
    dest_codes["AD"] = "110";
    dest_codes["AMD"] = "111";

    unordered_map<string, string> jmp_codes;
    jmp_codes["NULL"] = "000";
    jmp_codes["JGT"] = "001";
    jmp_codes["JEQ"] = "010";
    jmp_codes["JGE"] = "011";
    jmp_codes["JLT"] = "100";
    jmp_codes["JNE"] = "101";
    jmp_codes["JLE"] = "110";
    jmp_codes["JMP"] = "111";

    unordered_map<string, string> ref_map;
    ref_map["R0"]       = "000000000000000";
    ref_map["R1"]       = "000000000000001";
    ref_map["R2"]       = "000000000000010";
    ref_map["R3"]       = "000000000000011";
    ref_map["R4"]       = "000000000000100";
    ref_map["R5"]       = "000000000000101";
    ref_map["R6"]       = "000000000000110";
    ref_map["R7"]       = "000000000000111";
    ref_map["R8"]       = "000000000001000";
    ref_map["R9"]       = "000000000001001";
    ref_map["R10"]      = "000000000001010";
    ref_map["R11"]      = "000000000001011";
    ref_map["R12"]      = "000000000001100";
    ref_map["R13"]      = "000000000001101";
    ref_map["R14"]      = "000000000001110";
    ref_map["R15"]      = "000000000001111";
    ref_map["SCREEN"]   = "100000000000000";
    ref_map["KBD"]      = "110000000000000";
    ref_map["SP"]       = "000000000000000";
    ref_map["LCL"]      = "000000000000001";
    ref_map["ARG"]      = "000000000000010";
    ref_map["THIS"]     = "000000000000011";
    ref_map["THAT"]     = "000000000000100";

    string line;
    short line_number = 0;
    size_t instruction = 16;

    while (getline(fin, line))
    {
        string no_spaces = replace(line, " ");
        string no_comments_no_spaces = no_spaces.substr(0, no_spaces.find_first_of('/'));

        if (no_comments_no_spaces.length() == 0 || (no_spaces[0] == '/' && no_spaces[1] == '/'))
        {
            continue;
        }

        vector<string> parsed_line_section = parse_line(no_comments_no_spaces);
        if (parsed_line_section[0] == "REF")
        {
            ref_map[parsed_line_section[1]] = bitset<15>(line_number).to_string();
            cout << parsed_line_section[1] << ": " << ref_map[parsed_line_section[1]] << endl;
        } else {
            line_number++;
        }
    }
    fin.clear();
    fin.seekg(0);
    line_number = 1;

    while (getline(fin, line))
    {
        string no_spaces = replace(line, " ");
        string no_comments_no_spaces = no_spaces.substr(0, no_spaces.find_first_of('/'));

        if (is_reference_instruction(no_comments_no_spaces) || no_spaces.length() == 0 || (no_spaces[0] == '/' && no_spaces[1] == '/'))
        {
            continue;
        }

        vector<string> parsed_line_section = parse_line(no_comments_no_spaces);
        string binary = "";

        if (parsed_line_section[0] == "@")
        {
            if (is_number(parsed_line_section[1]))
            {
                binary += "0" + bitset<15>(stoi(parsed_line_section[1])).to_string();
            }
            else
            {
                auto it = ref_map.find(parsed_line_section[1]);
                if (it == ref_map.end())
                {
                    string bits = bitset<15>(instruction++).to_string();
                    ref_map[parsed_line_section[1]] = bits;
                    binary += "0" + bits;
                }
                else
                {
                    binary += "0" + ref_map[parsed_line_section[1]];
                }
            }
        }
        else
        {
            binary += "111" + parsed_line_section[0] + c_codes[parsed_line_section[1]] + dest_codes[parsed_line_section[2]] + jmp_codes[parsed_line_section[3]];
        }

        fout << binary << endl;

        string parsed_line_section_str;
        for (auto i = parsed_line_section.begin(); i != parsed_line_section.end(); ++i)
        {
            parsed_line_section_str += *i + "|";
        }



        cout << "Line Number: " << line_number++ << endl
             << "String: " << no_comments_no_spaces << endl
             << "Parsed: " << parsed_line_section_str << endl
             << "Binary: " << binary << endl
             << endl;
             
    }

    for (auto i = ref_map.begin(); i != ref_map.end(); ++i)
    {
        cout << (*i).first << ": " << (*i).second << endl;
    }

    fin.close();
    fout.close();

    return 0;
}