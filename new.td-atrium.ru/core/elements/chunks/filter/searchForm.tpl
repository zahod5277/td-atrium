<form action="[[~[[+pageId]]]]" method="get" class="msearch2" id="mse2_form">
    <div class="row">
        <div class="form-group col-md-10 no-padding">
            <input type="text" class="form-control" name="[[+queryVar]]" placeholder="Умный поиск!" value="[[+mse2_query]]" />
            <div class="hidden-xs col-md-12" id="search-wrng">
                <p>Введите страну-производителя, назначение, поверхность, название фабрики или размер и 
                    мы постараемся что-нибудь найти</p>
            </div>
        </div>
        <i class="fa fa-search search-btn"></i>
    </div>
</form>