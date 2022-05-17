use std::{fs::File, io::{BufReader, BufRead}, path::PathBuf};

use walkdir::WalkDir;

fn main() {
    let maps = read_maps("maps.txt");
    if maps.is_empty() {
        println!("No maps found");
        return;
    }

    let scenarios = read_scenarios("scenarios");
    if scenarios.is_empty() {
        println!("No scenarios found");
        return;
    }

    for scenario in scenarios {
        println!("{}", scenario);
        let mut pbo = hemtt_pbo::sync::WritablePbo::<File>::new();
        for entry in WalkDir::new(format!("scenarios/{}", scenario)) {
            let entry = entry.unwrap();
            if !entry.path().is_file() { continue }
            let pbo_path = entry.path().display().to_string().trim_start_matches(&format!("scenarios/{}{}", scenario, std::path::MAIN_SEPARATOR)).to_string();
            println!("  {}", pbo_path);
            pbo.add_file(pbo_path, File::open(entry.path()).unwrap()).unwrap();
        }
        let scenario = scenario.trim_end_matches(".VR");
        std::fs::create_dir_all(format!("output/{}", scenario)).unwrap();
        for map in &maps {
            pbo.write(&mut File::create(format!("output/{}/synixe_generator_{}.{}.pbo", scenario, scenario, map)).unwrap(), false).unwrap();
        }
    }
}

fn read_maps<P: Into<PathBuf>>(path: P) -> Vec<String> {
    let mut maps = Vec::new();
    let file = File::open(path.into()).unwrap();
    for line in BufReader::new(file).lines() {
        let line = line.unwrap();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        maps.push(line);
    }
    maps
}

fn read_scenarios<P: Into<PathBuf>>(path: P) -> Vec<String> {
    let mut scenarios = Vec::new();
    let paths = std::fs::read_dir(path.into()).unwrap();
    for path in paths {
        let path = path.unwrap().path();
        if path.is_dir() {
            scenarios.push(path.file_name().unwrap().to_str().unwrap().to_string());
        }
    }
    scenarios
}
