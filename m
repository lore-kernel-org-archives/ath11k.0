Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44DC3DA61
	for <ath11k@archiver.kernel.org>; Sat, 27 Jul 2024 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFbtf2rb8LQbBQsG+YxU/GYv6bh3Zq86eK1TSFfuEV8=; b=SOgzPSXZOMz8QZNgws7yE6f7Eb
	WG1ljdmZEpX3jw5Xumrc7OVrduymiIcKOYXOXmhjra0UmyEQokoK+72fr6oLH2YbNQQu+5DM1vNTK
	07V5qspv6GiDODa6A/RnawL/Ft6GrddED+GuaRR7mL1xMjq4qpSmbefH3ojuAEEx/yR4K4umnpoZR
	SK75ywjLdYk4zXxD2KrrI3eHAMz/AnZhifl+nFDc7wwpFwN+te/c7+pbvpo2ioFqd9VBjA9Tr9U9U
	Z/0AorfRE81M2YhzFFw/1u57DbbIknFbpRkkscdwELC+ifrkpGzisY3rAZg0R41Ulye+ltHwIr028
	G9Lu0F9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXeDp-00000006SY0-1lYn;
	Sat, 27 Jul 2024 10:00:17 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXeDm-00000006SX2-0o8S
	for ath11k@lists.infradead.org;
	Sat, 27 Jul 2024 10:00:16 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:48362 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1sXeDa-000000000zF-1wpG;
	Sat, 27 Jul 2024 12:00:03 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000,
	BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
	BODY_SIZE_500_599 0.000000, BODY_SIZE_7000_LESS 0.000000, CTE_7BIT 0.000000,
	DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, HTML_00_01 0.050000,
	HTML_00_10 0.050000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
	MSGID_SAMEAS_FROM_HEX_844412 0.100000, MSG_THREAD 0.000000,
	MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
	NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000,
	OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
	SENDER_NO_AUTH 0.000000, SUSP_DH_NEG 0.000000, USER_AGENT 0.000000,
	__ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CT 0.000000, __CTE 0.000000,
	__CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000,
	__DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
	__FORWARDED_MSG 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
	__FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
	__HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
	__HEADER_ORDER_FROM 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
	__MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
	__MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
	__MOZILLA_USER_AGENT 0.000000, __MSGID_HEX_844412 0.000000,
	__MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJECT 0.000000,
	__PHISH_SPEAR_SUBJ_ALERT 0.000000, __PHISH_SPEAR_SUBJ_PREDICATE 0.000000,
	__RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
	__SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_NO_MAILTO 0.000000, __URI_NO_WWW 0.000000, __USER_AGENT 0.000000,
	__X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2024.7.27.92417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID; bh=OFbtf2rb8LQbBQsG+YxU/GYv6bh3Zq86eK1TSFfuEV8=;
	b=sijTrzUrD8D+ASeNn+hlf4rrR6aU6OxQuJUQvaoPg+EnExZGDlIA2JeJ4tnWbB4FrezhAu5JNGLrT0Tg2GHXiu+QkMPqdElxVWyI+U0bi9uk04BNODFt2j7uzVIq7dsj3Kkur/YX4L6Xo9/q9Sgp235Ir3Esoc2F23CF8thhkOw=;
Message-ID: <dd2e9f4b-2cc8-486d-a6cc-2f7f77217109@dd-wrt.com>
Date: Sat, 27 Jul 2024 11:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH] ath11k: fix peer addition/deletion error on sta band
 migration
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20220603164559.27769-1-ansuelsmth@gmail.com>
 <420ae7cf-7b7a-4350-9dbb-00f00485acb8@dd-wrt.com>
In-Reply-To: <420ae7cf-7b7a-4350-9dbb-00f00485acb8@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1sXeDH-000FWd-Uw
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost.localdomain ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1sXeDH-000FWd-Uw; Sat, 27 Jul 2024 11:59:44 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_030014_417744_C8898297 
X-CRM114-Status: UNSURE (   7.35  )
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


Am 16.07.2024 um 04:49 schrieb Sebastian Gottschall:
> I honestly think a correct solution would be have a rhash list per 
> vdev_id
> or per mac_id but again this is problematic for some function that 
> just handles
> data and have only the addr as a way to identify the peer. 


regarding this comment. i made a patch which exactly does that thing and 
solves the problem. there are just 2 functions which
have the problem. but both can be handled in a easy way. these are wmi 
events for kick station etc. in such a case i just kick them from all
mac's


