#![warn(clippy::all, clippy::nursery)]

use std::{
    fs::File,
    io::{BufRead, BufReader},
    path::PathBuf,
};

use synixe_model::missions::Mission;
use walkdir::WalkDir;

use crate::mission::read_mission;

mod mission;

const DIRECTORIES: [&str; 4] = ["company", "contracts", "specials", "theatres"];

fn main() {
    let source = PathBuf::from(std::env::args().nth(1).expect("no source given"));
    let dest = PathBuf::from(std::env::args().nth(2).expect("no destination given"));

    let maps = read_maps(source.join("maps.txt"));
    if maps.is_empty() {
        println!("No maps found");
        return;
    }

    // Generate
    let scenarios = read_scenarios(source.join("generator"));
    if scenarios.is_empty() {
        println!("No scenarios found");
        return;
    }

    println!("Generator");
    for scenario in scenarios {
        println!(" {}", scenario);
        let mut pbo = hemtt_pbo::WritablePbo::<File>::new();
        for entry in WalkDir::new(source.join(format!("generator/{}", scenario))) {
            let entry = entry.unwrap();
            if !entry.path().is_file() {
                continue;
            }
            let pbo_path = entry
                .path()
                .display()
                .to_string()
                .trim_start_matches(source.display().to_string().as_str())
                .trim_start_matches(&format!(
                    "generator/{}{}",
                    scenario,
                    std::path::MAIN_SEPARATOR
                ))
                .to_string();
            pbo.add_file(pbo_path, File::open(entry.path()).unwrap())
                .unwrap();
        }
        let scenario = scenario.trim_end_matches(".VR");
        for map in &maps {
            println!("  gen_{}.{}.pbo", scenario, map);
            pbo.write(
                &mut File::create(dest.join(format!("gen_{}.{}.pbo", scenario, map))).unwrap(),
                false,
            )
            .unwrap();
        }
    }

    let mut missions: Vec<Mission> = Vec::new();

    println!("Standalone");
    for directory in DIRECTORIES {
        println!(" {}", directory);
        let scenarios = read_scenarios(source.join(directory));
        if scenarios.is_empty() {
            println!("  No scenarios found");
            continue;
        }
        for scenario in scenarios {
            println!("  {}", scenario);
            let mut pbo = hemtt_pbo::WritablePbo::<File>::new();
            for entry in WalkDir::new(source.join(format!("{}/{}", directory, scenario))) {
                let entry = entry.unwrap();
                if !entry.path().is_file() {
                    continue;
                }
                if ["readme.md", "readme.txt"].contains(
                    &entry
                        .path()
                        .file_name()
                        .unwrap()
                        .to_str()
                        .unwrap()
                        .to_lowercase()
                        .as_str(),
                ) {
                    continue;
                }
                let pbo_path = entry
                    .path()
                    .display()
                    .to_string()
                    .trim_start_matches(source.display().to_string().as_str())
                    .trim_start_matches(&format!(
                        "{}/{}{}",
                        directory,
                        scenario,
                        std::path::MAIN_SEPARATOR
                    ))
                    .to_string();
                pbo.add_file(pbo_path, File::open(entry.path()).unwrap())
                    .unwrap();
            }
            pbo.write(
                &mut File::create(dest.join(format!("{}.pbo", scenario))).unwrap(),
                false,
            )
            .unwrap();
            missions.push(read_mission(&source, directory, scenario));
        }
    }

    // Write mission list to mission.json
    let mut file = File::create(dest.join("mission.json")).unwrap();
    serde_json::to_writer_pretty(&mut file, &missions.sort_by(|a, b| a.id.cmp(&b.id))).unwrap();
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
