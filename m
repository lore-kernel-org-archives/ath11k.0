Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB192C433ED
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 02:18:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1BE6121E
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 02:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1BE6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xAsyl1ZzYrRXbjn4wqR1JEAhgFXjlRlpqGDmB55KWFM=; b=kQszAbl9Yr39kTeL2V6UgKGpB6
	FI2d8SmPVJE3I92MuOjam0ao2Cx6Aen9cQz+JBLDCFdi/iQeVL0Q9kozJtvpM5cpi3vz41PRmQBEX
	PApP2Q2LS65pRcMyKWVZSHBm0kL/M2MdyMofaLgdETMBGUBrOPIFc7b4e0E9U7+5xXB8++yMZHAik
	qM1L36iDxH3aUEWaXgBXxFQ++Tk2YotNKeEBBJGLJuvXElmj4nGckWoWj33ii4diQ4fweMIcxyN4C
	UJ4Cqy+WTAoLt/DFvfLvuQ+q2BbQZOPzNZUpafdD5mkEjSmU/5cAAJIWv+LblCDDzK628XP5/weA6
	uEkyelPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuk6-003TvL-J6; Fri, 21 May 2021 02:18:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuk2-003Ttr-71
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 02:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=EQFDhszrTgfGuv/UxHUgWZQdR7DrSIYZ3g3o7KNNaqI=; b=3O8yZROhBXsb2ujGfwJPPjswwa
 PqXLu5bpmd1uRCodfdGk9U78ZXfIuyGOhJL2tD2/5siLOc4DtW75pxOQh1l6HLulZj2cIhPmLjgwk
 r7BAOQB6QHIAAHfyUzV+tCQEsNkXiC/gSo/r0ZnXcfrDvQ12kxvAScgjl5QnMLkwVaEeM4cHiRohO
 yVoR728AcPu4TvUFMqdVFNXdnIDc1DOz3BPMibja5EEvRLmpeks+mGSDbqNbyj3fkQcF5WHeDC+0E
 LTOpSzD6f/f87hL5Z9GBtDtmah/L/FjjiS1VyDWzfFXUlhX8Er0mwSc4yoGknzp2tXvQfFxyBLwkF
 8VvdQgVQ==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljujz-00Glh3-54
 for ath11k@lists.infradead.org; Fri, 21 May 2021 02:18:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621563498; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=EQFDhszrTgfGuv/UxHUgWZQdR7DrSIYZ3g3o7KNNaqI=;
 b=u7r7eaNeTh47C99T5mdQpF3yRLY4R6fMl5Y/+HQX/nod8dHP1+rdfOwLoJkAyOAMe+zFA2Cq
 b9NN+VIEFAHeKH0VW1TYFFlKgtPGYZa8jdOAu/uPNmNdPVzJXsov1DsMg0TxeITVEqUryKeg
 KDihi3Cpi6c2L1BxIUuGCuZaY+4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60a7186914eae4d741c92c61 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 02:18:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E4B7BC43217; Fri, 21 May 2021 02:18:16 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59D77C43460;
 Fri, 21 May 2021 02:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59D77C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2] wireless: add check of field VHT Extended NSS BW Capable
 for 160/80+80 MHz setting
Date: Thu, 20 May 2021 22:18:09 -0400
Message-Id: <20210521021809.23986-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_191819_282869_59C2334D 
X-CRM114-Status: GOOD (  11.66  )
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

VGFibGUgOS0yNTHigJRTdXBwb3J0ZWQgVkhULU1DUyBhbmQgTlNTIFNldCBzdWJmaWVsZHMsIGl0
IGhhcyBzdWJmaWVsZCBWSFQgRXh0ZW5kZWQKTlNTIEJXIENhcGFibGUsIGl0cyBkZWZpbml0aW9u
IGlzOgpJbmRpY2F0ZXMgd2hldGhlciB0aGUgU1RBIGlzIGNhcGFibGUgb2YgaW50ZXJwcmV0aW5n
IHRoZSBFeHRlbmRlZCBOU1MgQlcKU3VwcG9ydCBzdWJmaWVsZCBvZiB0aGUgVkhUIENhcGFiaWxp
dGllcyBJbmZvcm1hdGlvbiBmaWVsZC4KClRoaXMgcGF0Y2ggaXMgdG8gYWRkIGNoZWNrIGZvciB0
aGUgc3ViZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5v
cmc+Ci0tLQp2MjogY2hhbmdlIGNvZGUgc3R5bGUKIG5ldC93aXJlbGVzcy9jaGFuLmMgfCA4ICsr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL25ldC93aXJlbGVzcy9jaGFuLmMgYi9uZXQvd2lyZWxlc3MvY2hhbi5jCmlu
ZGV4IDI4NWI4MDc2MDU0Yi4uZTI5NTYyNjU5YWU1IDEwMDY0NAotLS0gYS9uZXQvd2lyZWxlc3Mv
Y2hhbi5jCisrKyBiL25ldC93aXJlbGVzcy9jaGFuLmMKQEAgLTk0Miw3ICs5NDIsNyBAQCBib29s
IGNmZzgwMjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBoeSAqd2lwaHksCiAJc3RydWN0IGll
ZWU4MDIxMV9zdGFfdmh0X2NhcCAqdmh0X2NhcDsKIAlzdHJ1Y3QgaWVlZTgwMjExX2VkbWcgKmVk
bWdfY2FwOwogCXUzMiB3aWR0aCwgY29udHJvbF9mcmVxLCBjYXA7Ci0JYm9vbCBzdXBwb3J0Xzgw
XzgwID0gZmFsc2U7CisJYm9vbCBleHRfbnNzX2NhcCwgc3VwcG9ydF84MF84MCA9IGZhbHNlOwog
CiAJaWYgKFdBUk5fT04oIWNmZzgwMjExX2NoYW5kZWZfdmFsaWQoY2hhbmRlZikpKQogCQlyZXR1
cm4gZmFsc2U7CkBAIC05NTAsNiArOTUwLDcgQEAgYm9vbCBjZmc4MDIxMV9jaGFuZGVmX3VzYWJs
ZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LAogCWh0X2NhcCA9ICZ3aXBoeS0+YmFuZHNbY2hhbmRlZi0+
Y2hhbi0+YmFuZF0tPmh0X2NhcDsKIAl2aHRfY2FwID0gJndpcGh5LT5iYW5kc1tjaGFuZGVmLT5j
aGFuLT5iYW5kXS0+dmh0X2NhcDsKIAllZG1nX2NhcCA9ICZ3aXBoeS0+YmFuZHNbY2hhbmRlZi0+
Y2hhbi0+YmFuZF0tPmVkbWdfY2FwOworCWV4dF9uc3NfY2FwID0gdmh0X2NhcC0+dmh0X21jcy50
eF9oaWdoZXN0ICYgSUVFRTgwMjExX1ZIVF9FWFRfTlNTX0JXX0NBUEFCTEU7CiAKIAlpZiAoZWRt
Z19jYXAtPmNoYW5uZWxzICYmCiAJICAgICFjZmc4MDIxMV9lZG1nX3VzYWJsZSh3aXBoeSwKQEAg
LTEwMTUsNyArMTAxNiw4IEBAIGJvb2wgY2ZnODAyMTFfY2hhbmRlZl91c2FibGUoc3RydWN0IHdp
cGh5ICp3aXBoeSwKIAkJCShjYXAgJiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhf
MTYwXzgwUExVUzgwTUhaKSB8fAogCQkJKGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hB
Tl9XSURUSF8xNjBNSFogJiYKIAkJCSBjYXAgJiBJRUVFODAyMTFfVkhUX0NBUF9FWFRfTlNTX0JX
X01BU0spIHx8Ci0JCQl1MzJfZ2V0X2JpdHMoY2FwLCBJRUVFODAyMTFfVkhUX0NBUF9FWFRfTlNT
X0JXX01BU0spID4gMTsKKwkJCShleHRfbnNzX2NhcCAmJgorCQkJIHUzMl9nZXRfYml0cyhjYXAs
IElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykgPiAxKTsKIAkJaWYgKGNoYW5kZWYt
PmNoYW4tPmJhbmQgIT0gTkw4MDIxMV9CQU5EXzZHSFogJiYgIXN1cHBvcnRfODBfODApCiAJCQly
ZXR1cm4gZmFsc2U7CiAJCWZhbGx0aHJvdWdoOwpAQCAtMTAzNyw3ICsxMDM5LDcgQEAgYm9vbCBj
Zmc4MDIxMV9jaGFuZGVmX3VzYWJsZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LAogCQljYXAgPSB2aHRf
Y2FwLT5jYXAgJiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfTUFTSzsKIAkJaWYg
KGNhcCAhPSBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwTUhaICYmCiAJCSAg
ICBjYXAgIT0gSUVFRTgwMjExX1ZIVF9DQVBfU1VQUF9DSEFOX1dJRFRIXzE2MF84MFBMVVM4ME1I
WiAmJgotCQkgICAgISh2aHRfY2FwLT5jYXAgJiBJRUVFODAyMTFfVkhUX0NBUF9FWFRfTlNTX0JX
X01BU0spKQorCQkgICAgIShleHRfbnNzX2NhcCAmJiAodmh0X2NhcC0+Y2FwICYgSUVFRTgwMjEx
X1ZIVF9DQVBfRVhUX05TU19CV19NQVNLKSkpCiAJCQlyZXR1cm4gZmFsc2U7CiAJCWJyZWFrOwog
CWRlZmF1bHQ6Ci0tIAoyLjMxLjEKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
