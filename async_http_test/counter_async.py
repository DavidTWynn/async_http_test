import asyncio
import time


async def async_count():
    print("One")
    await asyncio.sleep(1)
    print("Two")


async def async_counter():
    await asyncio.gather(async_count(), async_count(), async_count())


def sync_count():
    print("One")
    time.sleep(1)
    print("Two")


def run_async():
    start = time.perf_counter()

    asyncio.run(async_counter())

    elapsed = time.perf_counter() - start
    print(f"Async executed in {elapsed:0.2f} seconds.")


def run_sync():
    start = time.perf_counter()

    for _ in range(3):
        sync_count()

    elapsed = time.perf_counter() - start
    print(f"Sync executed in {elapsed:0.2f} seconds.")


if __name__ == "__main__":
    run_async()
    run_sync()
