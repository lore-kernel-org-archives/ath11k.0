Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F3DC433ED
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847D460FEB
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847D460FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W8py+w9+/2TFNxSqfe9k/UubqrUp3ijqOLf6Y5XmiKM=; b=YDuZRJU59metBBJvS3OhgFVH2
	mxmZojNjN+vnckMx+1KdYCZaxAJBgqoFmaMOTxvCEEltnUUQQ8bRpjbmr2fexZ/pxmvSicYbC8JeL
	XEAFN3G9Ox+zbAq4gMDIOt+6s6f/QOGSck1K7o1rbOVjxtEmHYpN6UO56n1xAImjAXOh/A3/tgzGp
	HVOlp05+RdX+oT4eptjc9CQ6xxzi+aYihx/l6lN9HcffZcVtnrLnja+I/DXJl+sEEzqlX+kMgdCXT
	8ADlyMh8+tGsrRC7NQrgbkXha6VMl8nvJWDwUqNNWfWATEL/btWUEPlS3TFQqLEgr5VAVibBdlOqE
	Iqb3Nc5pA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijiq-00G2hw-Me; Mon, 17 May 2021 20:20:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijik-00G2gz-Md
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ku7yAvD5M3SMfIgtuSth8sXJbT35O3EqpZxbNrqYVOU=; b=UAqMqlQNYfpEbcYRPGWH+pLtyd
 Ca9cMAVXvoAKW5vMMACktFrYTaOultQf4gk7B9KZkJStfd8i7y51ASEWQwR9nf1MZ41daiRDXNHuW
 Zuar/PNhjEJOKOMr8vEtD8Dy404ghGMKdH6Yo+218r26R94aebqhXfa4FbCvYwXZKuDYWwdRPbHVz
 XYJVCDPu1deDv1ggcsChIpgsPHDQwIpzd2N7h4tOz9/GqdCHF2EU3QMPJCWersEa42K6Z5YgJSliO
 ZDIXsV3ujNMqvV/nERko1d6lCShkuJZWUReuuqAUg4npoDMXRWxbGfihKCObV8x3dbiMAHhsWErdI
 nPqO0FzA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijii-00E7mP-8I
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282808; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=ku7yAvD5M3SMfIgtuSth8sXJbT35O3EqpZxbNrqYVOU=;
 b=ggRY8CEQtmrHs9lDsfdWwYtAFaQtxIQq5RSO7N3w91efNAKy0NSNRau+B18/uZAQXAVaFHCa
 57amOSbUqPpf9Ejwnb9EkyktaprBUicNSAm6SpOwrnut+SSJLHKRcPFnc3EG6sLglSrqw3Tf
 lK/f/n69RQxgYlEbtx1MBUCvv04=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60a2cff7b15734c8f971a83f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BA535C43460; Mon, 17 May 2021 20:20:06 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43B19C433D3;
 Mon, 17 May 2021 20:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43B19C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 2/9] mac80211: add definition of regulatory info in 6G Hz
 operation information
Date: Mon, 17 May 2021 16:19:25 -0400
Message-Id: <20210517201932.8860-3-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132008_359033_03F8C003 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SUVFRSBQODAyLjExYXjihKIvRDguMCBhZGRlZCByZWd1bGF0b3J5IGluZm8gc3ViZmllbGQgaW4g
SEUgb3BlcmF0aW9uCmVsZW1lbnQsIHRoaXMgcGF0Y2ggaXMgdG8gYWRkIGl0IGluIG1hYzgwMjEx
IGRlZmluaXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5v
cmc+Ci0tLQogaW5jbHVkZS9saW51eC9pZWVlODAyMTEuaCB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaWVlZTgwMjEx
LmggYi9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCmluZGV4IDNkOGNmNTc5NzQ1ZC4uODk0YTJj
NGQ3Y2I3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCisrKyBiL2luY2x1
ZGUvbGludXgvaWVlZTgwMjExLmgKQEAgLTIyNjYsNiArMjI2Niw5IEBAIGllZWU4MDIxMV9oZV9w
cGVfc2l6ZSh1OCBwcGVfdGhyZXNfaGRyLCBjb25zdCB1OCAqcGh5X2NhcF9pbmZvKQogI2RlZmlu
ZSBJRUVFODAyMTFfSEVfT1BFUkFUSU9OX1BBUlRJQUxfQlNTX0NPTE9SCQkweDQwMDAwMDAwCiAj
ZGVmaW5lIElFRUU4MDIxMV9IRV9PUEVSQVRJT05fQlNTX0NPTE9SX0RJU0FCTEVECQkweDgwMDAw
MDAwCiAKKyNkZWZpbmUgSUVFRTgwMjExXzZHSFpfQ1RSTF9SRUdfTFBJX0FQCTAKKyNkZWZpbmUg
SUVFRTgwMjExXzZHSFpfQ1RSTF9SRUdfU1BfQVAJMQorCiAvKioKICAqIGllZWU4MDIxMV9oZV82
Z2h6X29wZXIgLSBIRSA2IEdIeiBvcGVyYXRpb24gSW5mb3JtYXRpb24gZmllbGQKICAqIEBwcmlt
YXJ5OiBwcmltYXJ5IGNoYW5uZWwKQEAgLTIyODIsNiArMjI4NSw3IEBAIHN0cnVjdCBpZWVlODAy
MTFfaGVfNmdoel9vcGVyIHsKICNkZWZpbmUJCUlFRUU4MDIxMV9IRV82R0haX09QRVJfQ1RSTF9D
SEFOV0lEVEhfODBNSFoJMgogI2RlZmluZQkJSUVFRTgwMjExX0hFXzZHSFpfT1BFUl9DVFJMX0NI
QU5XSURUSF8xNjBNSFoJMwogI2RlZmluZSBJRUVFODAyMTFfSEVfNkdIWl9PUEVSX0NUUkxfRFVQ
X0JFQUNPTgkweDQKKyNkZWZpbmUgSUVFRTgwMjExX0hFXzZHSFpfT1BFUl9DVFJMX1JFR19JTkZP
CTB4MzgKIAl1OCBjb250cm9sOwogCXU4IGNjZnMwOwogCXU4IGNjZnMxOwotLSAKMi4zMS4xCgoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
