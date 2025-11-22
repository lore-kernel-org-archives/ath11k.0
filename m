Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B519CFC51E
	for <ath11k@archiver.kernel.org>; Sat, 22 Nov 2025 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pKBWMhJ2SgElDFki+fm9LRUr8FKdP9xaqNGPkk7snQ=; b=OnO6XBJ46QOu8pUfbiJEUZ5y/g
	JuJRlXaEw4ifWFS70A4QKK/0NDmcBeH++YOQYmUVcZdpfBFoqtPzQaf9408k1OC7O04S89LIeew4U
	p/aRzhDPYW8zmgqR6uhYSMG16dC+VXiMDmMoKdMs6Y8BZGDAlWe8hFdspB7EGGnXyQHf09Gdx16Qw
	I3Zi4nYObnvXwrQ/MGspKdE3uH/vhCewtwU7ve7NT/q0TirR5o2EqrVxq5SZqxHt1XM2+Y3oG92vT
	qxdVvxjNbQlush/shy7aBq3xaAk/CwYcKuAhNyuacZAlrQgaFOduDRMxcaCP4rlxLzrJSLIoa2uNu
	LYfoFJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkgk-00000009SGs-2xDd;
	Sat, 22 Nov 2025 10:17:54 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkgi-00000009SGV-08HL
	for ath11k@lists.infradead.org;
	Sat, 22 Nov 2025 10:17:53 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:49518 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1vMkgc-0000000038Y-1zO9;
	Sat, 22 Nov 2025 11:17:47 +0100
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1000_1099 0.000000,
	BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
	BODY_SIZE_7000_LESS 0.000000, CTE_8BIT 0.000000, DKIM_ALIGNS 0.000000,
	DKIM_SIGNATURE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
	IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
	MSGID_SAMEAS_FROM_HEX_844412 0.100000, MSG_THREAD 0.000000,
	MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
	NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
	REFERENCES 0.000000, SENDER_NO_AUTH 0.000000, SINGLE_URI_IN_BODY 0.000000,
	SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000, USER_AGENT 0.000000,
	__ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CP_MEDIA_BODY 0.000000, __CP_URI_IN_BODY 0.000000,
	__CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
	__DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000,
	__DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
	__FRAUD_PARTNERSHIP 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
	__FROM_NAME_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
	__HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
	__HAS_REFERENCES 0.000000, __HEADER_ORDER_FROM 0.000000,
	__HIGHBIT_ASCII_MIX 0.000000, __HTTPS_URI 0.000000, __IN_REP_TO 0.000000,
	__MAIL_CHAIN 0.000000, __MIME_BOUND_CHARSET 0.000000,
	__MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
	__MIME_VERSION 0.000000, __MOZILLA_USER_AGENT 0.000000,
	__MSGID_HEX_844412 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
	__MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJ_TEAM 0.000000,
	__RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
	__SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SINGLE_URI_TEXT 0.000000,
	__SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
	__SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
	__TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
	__TO_REAL_NAMES 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000,
	__URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
	__URI_WITH_PATH 0.000000, __USER_AGENT 0.000000, __X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2025.11.22.92719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=5pKBWMhJ2SgElDFki+fm9LRUr8FKdP9xaqNGPkk7snQ=;
	b=KQz0qpEI2vzI43CGLg2XeQgvZYXDIII/2xKhGOWFpdu3jfIJ9czufNj8fxbe2SXKwUUkhiIxDLtFnGsCEVnL5+S23OQLeFw9CTZzvdzrBCnHCcedYjGV7QnJPi11XZPYV4nBSfp/f7ZrcH660t0QoTkNOoT3wxq9OMjCrD9DkMA=;
Message-ID: <e7e4058e-6f95-444f-b843-d942496dcf07@dd-wrt.com>
Date: Sat, 22 Nov 2025 11:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
 =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_yuzha@quicinc.com
References: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
 <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
 <35c554a3-efdd-425c-ac34-858a927bbe15@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <35c554a3-efdd-425c-ac34-858a927bbe15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1vMkgb-000C3H-O4
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1vMkgb-000C3H-O4; Sat, 22 Nov 2025 11:17:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_021752_237119_6312DDC0 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Am 22.11.2025 um 08:55 schrieb Yu Zhang(Yuriy):

>
>
> On 11/21/2025 4:41 PM, Paweł Owoc wrote:
>> On Fri, Nov 21, 2025 at 6:00 AM Yu Zhang(Yuriy)
>> <yu.zhang@oss.qualcomm.com> wrote:
>>>
>>> hi,
>>>
>>>   From your log/calltrace, I didn’t see any errors related to MU EDCA;
>>> what I saw were related to SMPS. Did you also add changes related to 
>>> SMPS?
>>>
>>> Yuriy
>>
>> Hi Yuriy,
>>
>> Thanks for your reply. The ath11k driver is version 6.14.12.
>> Everything works if I remove the mu_edca setting without any other 
>> changes.
>>
>> The problem doesn't occur with the newer IPQ8074 firmware, version 
>> 2.12-01460,
>> which hasn't been publicly released.
>
> So the newer IPQ8074 firmware fixed this issue, great.
>
>>
>> More details: https://github.com/openwrt/openwrt/issues/20702
>>
>> Regards,
the point is what he mentions that these newer firmwares arent available 
public. i provided openwrt these images for testing
so he is asking if or when qualcomm does release newer firmwares to the 
public repositories

Sebastian

>
>
>

