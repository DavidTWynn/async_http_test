"""Test."""
import httpx
import rich


class Example:
    """HI.

    _extended_summary_
    """

    def __init__(self, a: int):
        """Test.

        _extended_summary_

        Args:
            a: info
        """
        self.a = a

    def print(self) -> None:
        """_summary_.

        _extended_summary_
        """
        print(self.a)

    def lint_test(self) -> int:
        """_summary_.

        _extended_summary_

        Returns:
            _description_
        """
        return 1


def get_data() -> None:
    """_summary_.

    _extended_summary_
    """
    base_url = (
        "https://api.fiscaldata.treasury.gov",
        "/services/api/fiscal_service",
    )
    endpoint = (
        "/v1/accounting/od/securities_sales",
        "?sort=-record_date&format=json",
    )
    url = f"{base_url}{endpoint}"
    # parameters = {
    #     "fields": ["country_currency_desc", "exchange_rate", "record_date"],
    #     "filter": "record_date:gte:2015-01-01",
    # }
    headers = {"accept": "application/json"}

    response = httpx.get(url=url, headers=headers)

    rich.print(response.json())


def main() -> int:
    """_summary_.

    _extended_summary_

    Returns:
        _description_
    """
    get_data()

    return 1


if __name__ == "__main__":
    main()
