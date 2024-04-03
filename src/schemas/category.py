from schemas.base import CustomBaseModel
from pydantic import validator, field_validator
import re

class Category(CustomBaseModel):
    name: str
    slug: str
    
    @field_validator('slug')
    def validade_slug(cls, value):
        if not re.match('^([a-z]|-|_)+$', value):
            raise ValueError('Invalid slug')
        return value

## POR ALGUM MOTIVO O ARQIVO test_category_schema.py precisa ficar dentro da pasta schemas e nao em uma pasta test separada
