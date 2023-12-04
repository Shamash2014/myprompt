import { Card, CardBody, Input } from "@nextui-org/react";
import { SearchIcon } from "./SearchIcon";
import { useState } from "react";
function App() {
  const [prompts, setPrompts] = useState([]);
  const calculatePrompts = (value) => {
    fetch(`http://localhost:3000/api/v1/prompts?q=${value}`)
      .then((res) => res.json())
      .then((data) => setPrompts(data));
  };

  return (
    <div className="bg-gradient-to-tr from-pink-500 to-yellow-500 shadow-lg w-screen h-screen">
      <div className="w-full px-8 rounded-2xl flex justify-center items-center text-white container mx-auto">
        <Input
          label="Search"
          isClearable
          radius="lg"
          onValueChange={calculatePrompts}
          classNames={{
            label: "text-black/50 dark:text-white/90",
            input: [
              "bg-transparent",
              "text-black/90 dark:text-white/90",
              "placeholder:text-default-700/50 dark:placeholder:text-white/60",
            ],
            innerWrapper: "bg-transparent",
            inputWrapper: [
              "shadow-xl",
              "mt-[200px]",
              "bg-default-200/50",
              "dark:bg-default/60",
              "backdrop-blur-xl",
              "backdrop-saturate-200",
              "hover:bg-default-200/70",
              "dark:hover:bg-default/70",
              "group-data-[focused=true]:bg-default-200/50",
              "dark:group-data-[focused=true]:bg-default/60",
              "!cursor-text",
            ],
          }}
          placeholder="Type to search..."
          startContent={
            <SearchIcon className="text-black/50 mb-0.5 dark:text-white/90 text-slate-400 pointer-events-none flex-shrink-0" />
          }
        />
      </div>

      <div className="grid grid-rows-4 grid-flow-col gap-4 px-8 mt-6">
        {prompts.map(({ _source }) => (
          <Card>
            <CardBody className="bg-black text-white">
              <p>{_source.prompt}</p>
            </CardBody>
          </Card>
        ))}
      </div>
    </div>
  );
}

export default App;
