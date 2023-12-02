import { useState } from "react";
import { Textarea } from "@nextui-org/react";
function App() {
  return (
    <Textarea
      label="Prompts"
      labelPlacement="outside"
      placeholder="Enter keywords"
      className="max-w-xs"
    />
  );
}

export default App;
