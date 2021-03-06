package org.hamcrest.mxml.date
{
    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateBetween;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the dateBetween() / DateBetweenMatcher.
     *
     * @see org.hamcrest.date#dateBetween()
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:DateBetween min="{ today() }" max="{ advanceDate(today(), { month: 1 }) }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class DateBetween extends BaseMXMLMatcher
    {
        private var _min:Date;
        private var _max:Date;
        private var _exclusive:Boolean;

        /**
         * Constructor.
         */
        public function DateBetween()
        {
            super();
        }

        /**
         * Date the target value must be after.
         */
        [Bindable('minChanged')]
        public function get min():Date
        {
            return _min;
        }

        public function set min(value:Date):void
        {
            if (_min != value)
            {
                _min = value;
                changed('min');
            }
        }

        /**
         * Date the target value must be before.
         */
        [Bindable('maxChanged')]
        public function get max():Date
        {
            return _max;
        }

        public function set max(value:Date):void
        {
            if (_max != value)
            {
                _max = value;
                changed('max');
            }
        }

        /**
         * Indicates whether to exclude the exact min and max values.
         */
        [Bindable('exclusiveChanged')]
        public function get exclusive():Boolean
        {
            return _exclusive;
        }

        public function set exclusive(value:Boolean):void
        {
            _exclusive = value;
            changed('exclusive');
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return dateBetween(min, max, exclusive);
        }

        // TODO other matchers require this pattern if multiple dependant parameters, push to BaseMXMLMatcher
        override protected function evaluateDescription():void
        {
            if (min && max)
            {
                super.evaluateDescription();
            }
        }

        override protected function evaluateMatchTarget():void
        {
            if (min && max)
            {
                super.evaluateMatchTarget();
            }
        }
    }
}
