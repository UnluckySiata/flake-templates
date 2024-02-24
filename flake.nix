{
  description = "Some basic development flakes";

  outputs = { self }: {
    templates = {
      cpp = {
        path = ./cpp;
        description = "c++ template with llvm-17";
      };
    };
  };
}

