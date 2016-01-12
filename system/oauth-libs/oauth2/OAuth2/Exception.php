<?php

class OAuth2_Exception extends Exception {
	/**
	 * @var int
	 */
	protected $subcode;

	/**
	 * @var string
	 */
	protected $type;

	/**
	 * Construct the exception. Note: The message is NOT binary safe.
	 *
	 * @link http://php.net/manual/en/exception.construct.php
	 * @param string $message [optional] The Exception message to throw.
	 * @param int $code [optional] The Exception code.
	 * @param int $subcode [optional] The Exception code.
	 * @param string $type optional] The Exception type
	 * @param Exception $previous [optional] The previous exception used for the exception chaining. Since 5.3.0
	 */
	public function __construct($message = '', $code = 0, $subcode = 0, $type = 'OAuth2_Adapter', Exception $previous = null) {
		if (PHP_VERSION_ID > 50300) {
			parent::__construct($message, $code, $previous);
		} else {
			parent::__construct($message, $code);
		}

		$this->subcode = $subcode;
		$this->type = $type;
	}

	/**
	 * Gets the Exception Subcode
	 *
	 * @return int the exception code as integer
	 */
	final public function getSubCode() {
		return $this->subcode;
	}

	/**
	 * Gets the Exception Type
	 *
	 * @return string the Exception type as a string.
	 */
	final public function getType() {
		return $this->type;
	}
}