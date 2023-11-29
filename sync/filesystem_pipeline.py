import json
import os
import posixpath
from typing import Iterator

import dlt
from dlt.sources import TDataItem, TDataItems

try:
    from .filesystem import FileItemDict, filesystem, readers, read_csv, read_jsonl, read_parquet  # type: ignore
except ImportError:
    from filesystem import (
        FileItemDict,
        filesystem,
        readers,
        read_csv,
        read_jsonl,
        read_parquet,
    )


BUCKET_URL = posixpath.abspath("../../Stable-Diffusion-Prompts/data/")

def read_parquet_and_jsonl_chunked() -> None:
    pipeline = dlt.pipeline(
        pipeline_name="sync_data",
        destination='postgres',
        dataset_name="public",
    )
    # When using the readers resource, you can specify a filter to select only the files you
    # want to load including a glob pattern. If you use a recursive glob pattern, the filenames
    # will include the path to the file inside the bucket_url.

    # PARQUET reading
    print(BUCKET_URL)
    parquet_reader = readers(BUCKET_URL, file_glob="*.parquet").read_parquet()
    # load both folders together to specified tables
    load_info = pipeline.run(
            parquet_reader.with_name("prompts"),
    )
    print(load_info)
    print(pipeline.last_trace.last_normalize_info)


if __name__ == "__main__":
    read_parquet_and_jsonl_chunked()
