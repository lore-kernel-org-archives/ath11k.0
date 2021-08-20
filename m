Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C921C4338F
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4077E60F45
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4077E60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObwEBkGdxMSzgj/WbqF//hM3zWr/qbQU1+VjWU8f5Rk=; b=XWNrhCSSZNNw6G
	G9CzoExDqRn2VMN/ceqOH9bi6orfHMaG6hcsQZhydccAPPtH71H9DHtW8V4LwwP61BY1Njk60pJEg
	eaeyoJYVwZekUk166mu7Qys7qc6ycsHKgs2n+KzGFeLgrZFbFTI2Pz9OEnNGJ8jl6P5B2GoFb7qmI
	peKCNdHkh3kWNjKHw1FmnjENBXiT3PziP+VRQnLtw2n90UDIlkA21ZTgL4MCk/Tu3HrVMCXigiIgu
	0qfuH/XTGCXp0uKIo4RINy0JKEIDhuzzd1lE1JjaCJmUuLU+kIq7Vv23SaLtWc0/QwoNRhVqGOoEK
	xBLL1LyLrKQ2jMUDSeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WM-00B6hX-LK; Fri, 20 Aug 2021 12:21:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3WC-00B6aG-9T
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462067; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=zvEJtpbingpsiN3/ToulAmxrC6ZipGNFY5kyMai1SfE=;
 b=LjOvVr7DnVTNi5LCawAjgV3jPN/dCiRwJ/lRF0wm6NSeT1ZdYezPsS++BPalaCH333k3WE+Z
 rVwAnwAdA28MEYns6Uhtb6t8VuuQwt4k2PhQpTg4l99b/twXmTo1Xls4YCPz1p8iDZwYf4bD
 ekEnPxo07kiQDu4AV/u5NOm6m0U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 611f9e23f588e42af14dd0c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D987DC43460; Fri, 20 Aug 2021 12:20:51 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44FEAC4360C;
 Fri, 20 Aug 2021 12:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 44FEAC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 2/8] mac80211: add definition of regulatory info in 6 GHz
 operation information
Date: Fri, 20 Aug 2021 08:20:35 -0400
Message-Id: <20210820122041.12157-3-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052107_307528_7AED5587 
X-CRM114-Status: GOOD (  10.48  )
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

SUVFRSBTdGQgODAyLjExYXjihKItMjAyMSBhZGRlZCByZWd1bGF0b3J5IGluZm8gc3ViZmllbGQg
aW4gSEUgb3BlcmF0aW9uCmVsZW1lbnQsIHRoaXMgcGF0Y2ggaXMgdG8gYWRkIGl0IGluIG1hYzgw
MjExIGRlZmluaXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9y
YS5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9pZWVlODAyMTEuaCB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaWVlZTgw
MjExLmggYi9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCmluZGV4IDY4ZDhiOWNkZDNiOC4uZGVi
MmY1MzZkMTA0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvaWVlZTgwMjExLmgKQEAgLTIyNjQsNiArMjI2NCw5IEBAIGllZWU4MDIxMV9o
ZV9wcGVfc2l6ZSh1OCBwcGVfdGhyZXNfaGRyLCBjb25zdCB1OCAqcGh5X2NhcF9pbmZvKQogI2Rl
ZmluZSBJRUVFODAyMTFfSEVfT1BFUkFUSU9OX1BBUlRJQUxfQlNTX0NPTE9SCQkweDQwMDAwMDAw
CiAjZGVmaW5lIElFRUU4MDIxMV9IRV9PUEVSQVRJT05fQlNTX0NPTE9SX0RJU0FCTEVECQkweDgw
MDAwMDAwCiAKKyNkZWZpbmUgSUVFRTgwMjExXzZHSFpfQ1RSTF9SRUdfTFBJX0FQCTAKKyNkZWZp
bmUgSUVFRTgwMjExXzZHSFpfQ1RSTF9SRUdfU1BfQVAJMQorCiAvKioKICAqIGllZWU4MDIxMV9o
ZV82Z2h6X29wZXIgLSBIRSA2IEdIeiBvcGVyYXRpb24gSW5mb3JtYXRpb24gZmllbGQKICAqIEBw
cmltYXJ5OiBwcmltYXJ5IGNoYW5uZWwKQEAgLTIyODAsNiArMjI4Myw3IEBAIHN0cnVjdCBpZWVl
ODAyMTFfaGVfNmdoel9vcGVyIHsKICNkZWZpbmUJCUlFRUU4MDIxMV9IRV82R0haX09QRVJfQ1RS
TF9DSEFOV0lEVEhfODBNSFoJMgogI2RlZmluZQkJSUVFRTgwMjExX0hFXzZHSFpfT1BFUl9DVFJM
X0NIQU5XSURUSF8xNjBNSFoJMwogI2RlZmluZSBJRUVFODAyMTFfSEVfNkdIWl9PUEVSX0NUUkxf
RFVQX0JFQUNPTgkweDQKKyNkZWZpbmUgSUVFRTgwMjExX0hFXzZHSFpfT1BFUl9DVFJMX1JFR19J
TkZPCTB4MzgKIAl1OCBjb250cm9sOwogCXU4IGNjZnMwOwogCXU4IGNjZnMxOwotLSAKMi4zMS4x
CgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
