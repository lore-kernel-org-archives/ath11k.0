Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06BC3ABC3
	for <ath11k@archiver.kernel.org>; Fri,  9 May 2025 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqQdyORHbJ+WljesHXXhhkp3aHmrD2aDHe/8+59w2QQ=; b=Xpp6xLnZjQZzeokVa0tE36apV5
	MHQGmeewncTaavhz4j5+wFOIA8/SdqH87EN04d+RKkYgsGkcNYgpqSWwQnWE399wKMiIbaz+i+Rrw
	c7Td8s4QSdtl+vZ4tZqrm1XH+uXqTUhYwoQeAYLLR/wg2rW+ypjCooyBlm5YEkNcJcMupSCokwWNo
	4svIWhqE9tIgXa3xXgI47L20oVV1y1xUtwEia9j1AVirtyha5tMJuesHyfb4Looz0Zy5I3FpbsHRK
	qZO8cFhT/eB7TBjsC2pBE+uHZSNrIdpsrjTzto6ACv2jOXaaLoY/s0Ri4SLNO7ifNl8admWSo+0IF
	e/mkXMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPQG-0000000434c-1yXP;
	Fri, 09 May 2025 15:14:00 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO71-00000003ptf-0ilY
	for ath11k@lists.infradead.org;
	Fri, 09 May 2025 13:50:04 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:40864 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1uDO6u-000000001zf-1ShG;
	Fri, 09 May 2025 15:49:56 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000,
	BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
	CTE_7BIT 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
	HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
	LEGITIMATE_SIGNS 0.000000, MSGID_SAMEAS_FROM_HEX_844412 0.100000,
	MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
	NO_CTA_FOUND 0.000000, NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000,
	NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
	REFERENCES 0.000000, SENDER_NO_AUTH 0.000000, SUSP_DH_NEG 0.000000,
	USER_AGENT 0.000000, __ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
	__CC_REAL_NAMES 0.000000, __CT 0.000000, __CTE 0.000000,
	__CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000,
	__DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
	__FORWARDED_MSG 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
	__FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
	__HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
	__HEADER_ORDER_FROM 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
	__MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
	__MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
	__MOZILLA_USER_AGENT 0.000000, __MSGID_HEX_844412 0.000000,
	__MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
	__REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000,
	__SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_NO_MAILTO 0.000000, __URI_NO_WWW 0.000000, __USER_AGENT 0.000000,
	__X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2025.5.9.132728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=LqQdyORHbJ+WljesHXXhhkp3aHmrD2aDHe/8+59w2QQ=;
	b=NLdoh3NNhArpXhthKv2u62pOB9Z61p7IeFxyyFcwf6NZVPOOz0IXk+tKjlZ1uZgqHDXfAJjs/NCikEXGzA9hNWIDMjvRc5ap51dBaYKrQf3o1acaFo/KBPsItAeBUOMgEafVQI1Mp5lSoZCjz5rlBfxq8irv0y32Fkus/ivfk8E=;
Message-ID: <592e4722-d7e1-4202-897f-e2a522074fe6@dd-wrt.com>
Date: Fri, 9 May 2025 15:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Question about TX power
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <aB3AK83USvOdTvDv@FUE-ALEWI-WINX>
 <73b2bd16-66aa-405c-acda-237d56be63dd@dd-wrt.com>
 <aB3uKfu3frLyJ/2c@FUE-ALEWI-WINX>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <aB3uKfu3frLyJ/2c@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1uDO6t-000AmL-Ei
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1uDO6t-000AmL-Ei; Fri, 09 May 2025 15:49:55 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065003_354118_AA346601 
X-CRM114-Status: GOOD (  17.02  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


Am 09.05.2025 um 13:59 schrieb Alexander Wilhelm:
> Am Fri, May 09, 2025 at 12:54:47PM +0200 schrieb Sebastian Gottschall:
>> Am 09.05.2025 um 10:43 schrieb Alexander Wilhelm:
>>> Hello devs,
>>>
>>> I'd like to understand how TX power setting works on ath11k devices. For example
>>> when I'm using channel 36 for ETSI based regulatory domain, I can set up to 23
>>> dBm. But then I get only 20 dBm as a result. On different channels and/or
>>> regulatory domains I get different reductions. I tried to follow the source
>>> code. As far as I understood is that 'ath11k_mac_txpower_recalc' sets the
>>> correct values and 'ath11k_mac_op_get_txpower' return the different one.
>>>
>>> My question is where this reduction offset is encoded. Is it in the module's
>>> firmware or is it part of the boardfile? Thank you in advance.
>>>
>>>
>>> Best regards
>>> Alexander Wilhelm
>> the boardfile contains chipset specific calibration data which also defines
>> the hardware power limits (more specific data also included in the on board
>> calibration flash of the device or if its a router, in flash memory of the
>> router itself. in addition it includes a regulatory database which is used
>> by the firmware for managing the total power. you have also to consider that
>> the 23dbm are specified without antenna gain.
>> so if the antenna gain is 3 dbm, you get 20 dbm in total. this antenna gain
>> may again be specified in the boardfile.
>> so you will not find your answers in any sourcecode. its all encoded in
>> binary data.
>>
>> Sebastian
>>
> Alright, thank you Sebastian. Since I'm not using any calibration data on my
> router/AP device, all data come from the boardfile. I've also understood that
> the power limit reduction is related to antenna gain. I'll ask the radio module
> manufacturer to create another boardfile for me that matches the required
> antenna gain for my router/AP device.
my answer might be not accurate here. which chipset we are talking about 
for ath11k?
>
> Best regards
> Alexander Wilhelm
>

