package org.hamcrest.mxml.core
{
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.core.not;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    /**
     * MXML facade for the not() / IsNotMatcher.
     *
     * @see org.hamcrest.core#not()
     * @see org.hamcrest.core.IsNotMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:Not&gt;
     *      &lt;hc:EqualTo value="{ 4 }" /&gt;
     *  &lt;hc:Not&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class Not extends BaseMXMLMatcherComposite
    {
        /**
         * Constructor.
         */
        public function Not()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return not(matcher);
        }
    }
}
