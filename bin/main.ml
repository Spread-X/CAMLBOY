open Camlboy_lib

let () =
  let rom_bytes = Read_rom_file.f "./resource/test_roms/blargg/cpu_instrs/individual/02-interrupts.gb" in
  let camlboy = Camlboy.create_with_rom ~rom_bytes ~echo_flag:false in
  while true do
    Printf.printf "%s" (Camlboy.show camlboy);
    Camlboy.tick camlboy;
    Printf.printf " | %s\n" (Camlboy.For_tests.prev_inst camlboy |> Instruction.show)
  done
