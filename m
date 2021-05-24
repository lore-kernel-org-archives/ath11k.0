Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025D6C2B9F7
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 23:29:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0E3661026
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 23:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0E3661026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ROAb7bIqkfU+nve7NrJr/P8cV1s9NUbEsM7DsnnkVo=; b=RHWiiF2uO7XvvU
	G8mzABi2Zufjd1D9JY9CS+Hdgizq12u595lWcK9j636n9i6Pxurubq7QDeuzAjx/zg6rUkJqGsiXn
	wQnSTZqC2Trl8/JD2BIFxe/+t0qasamnsrtW+IXRMS2nQil3f8rwxS/EDH9zZ9tFLKaTUYitwJh47
	MS/20z0tm4K+RW6HTFGpWoSLmxN4TQ1s5ADRLeaH7e125GKvisz1VIK+MaMK6j/qeMuWA0WgfXJub
	JncgWe4nc6586LdpzSqSDKWtnY6jNDfmAXGn1qcOzM6+5z3H+gFRnGET1QsnEhNhKWah/xPOFTT/d
	/PEt+c2SXCzkDGTA/SkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llK0I-002LI5-1b; Mon, 24 May 2021 23:28:58 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll1OY-000fZX-US
 for ath11k@lists.infradead.org; Mon, 24 May 2021 03:36:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621827406; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=oKAkKSZrsrmoutto39uMBJ+LDG+zUwDxjXkEC8nxgr0=;
 b=S0VCEdwbfzv8hc+TACa51JMkSCEdilA2WwHrKnfrk6QrZBgj5YeZFw5F8EtoIyi/ogvY570T
 CUoRdO/cwo0DBALhrKOu4hogl4d/AL8AwSPN0ezHYN3VTdZSPK3p4IMMcPHZ4AW1snZnDTMR
 Y9pO7PpqbKQS3fZHb6TTVlYD/Nw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60ab1f4e063320cd138c57af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 03:36:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48302C43460; Mon, 24 May 2021 03:36:45 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 30FCCC433F1;
 Mon, 24 May 2021 03:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30FCCC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3] wireless: add check of field VHT Extended NSS BW Capable
 for 160/80+80 MHz setting
Date: Sun, 23 May 2021 23:36:24 -0400
Message-Id: <20210524033624.16993-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_203647_054811_A63B249E 
X-CRM114-Status: GOOD (  10.91  )
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
cmc+Ci0tLQp2MzogYWRkIF9fbGUxNl90b19jcHUgZm9yIF9fbGUxNiB0eF9oaWdoZXN0CnYyOiBj
aGFuZ2UgY29kZSBzdHlsZQogbmV0L3dpcmVsZXNzL2NoYW4uYyB8IDggKysrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bmV0L3dpcmVsZXNzL2NoYW4uYyBiL25ldC93aXJlbGVzcy9jaGFuLmMKaW5kZXggMjg1YjgwNzYw
NTRiLi5hMmQxMWM4MDE1ODUgMTAwNjQ0Ci0tLSBhL25ldC93aXJlbGVzcy9jaGFuLmMKKysrIGIv
bmV0L3dpcmVsZXNzL2NoYW4uYwpAQCAtOTQyLDcgKzk0Miw3IEBAIGJvb2wgY2ZnODAyMTFfY2hh
bmRlZl91c2FibGUoc3RydWN0IHdpcGh5ICp3aXBoeSwKIAlzdHJ1Y3QgaWVlZTgwMjExX3N0YV92
aHRfY2FwICp2aHRfY2FwOwogCXN0cnVjdCBpZWVlODAyMTFfZWRtZyAqZWRtZ19jYXA7CiAJdTMy
IHdpZHRoLCBjb250cm9sX2ZyZXEsIGNhcDsKLQlib29sIHN1cHBvcnRfODBfODAgPSBmYWxzZTsK
Kwlib29sIGV4dF9uc3NfY2FwLCBzdXBwb3J0XzgwXzgwID0gZmFsc2U7CiAKIAlpZiAoV0FSTl9P
TighY2ZnODAyMTFfY2hhbmRlZl92YWxpZChjaGFuZGVmKSkpCiAJCXJldHVybiBmYWxzZTsKQEAg
LTk1MCw2ICs5NTAsNyBAQCBib29sIGNmZzgwMjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBo
eSAqd2lwaHksCiAJaHRfY2FwID0gJndpcGh5LT5iYW5kc1tjaGFuZGVmLT5jaGFuLT5iYW5kXS0+
aHRfY2FwOwogCXZodF9jYXAgPSAmd2lwaHktPmJhbmRzW2NoYW5kZWYtPmNoYW4tPmJhbmRdLT52
aHRfY2FwOwogCWVkbWdfY2FwID0gJndpcGh5LT5iYW5kc1tjaGFuZGVmLT5jaGFuLT5iYW5kXS0+
ZWRtZ19jYXA7CisJZXh0X25zc19jYXAgPSBfX2xlMTZfdG9fY3B1KHZodF9jYXAtPnZodF9tY3Mu
dHhfaGlnaGVzdCkgJiBJRUVFODAyMTFfVkhUX0VYVF9OU1NfQldfQ0FQQUJMRTsKIAogCWlmIChl
ZG1nX2NhcC0+Y2hhbm5lbHMgJiYKIAkgICAgIWNmZzgwMjExX2VkbWdfdXNhYmxlKHdpcGh5LApA
QCAtMTAxNSw3ICsxMDE2LDggQEAgYm9vbCBjZmc4MDIxMV9jaGFuZGVmX3VzYWJsZShzdHJ1Y3Qg
d2lwaHkgKndpcGh5LAogCQkJKGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURU
SF8xNjBfODBQTFVTODBNSFopIHx8CiAJCQkoY2FwICYgSUVFRTgwMjExX1ZIVF9DQVBfU1VQUF9D
SEFOX1dJRFRIXzE2ME1IWiAmJgogCQkJIGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1Nf
QldfTUFTSykgfHwKLQkJCXUzMl9nZXRfYml0cyhjYXAsIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9O
U1NfQldfTUFTSykgPiAxOworCQkJKGV4dF9uc3NfY2FwICYmCisJCQkgdTMyX2dldF9iaXRzKGNh
cCwgSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CV19NQVNLKSA+IDEpOwogCQlpZiAoY2hhbmRl
Zi0+Y2hhbi0+YmFuZCAhPSBOTDgwMjExX0JBTkRfNkdIWiAmJiAhc3VwcG9ydF84MF84MCkKIAkJ
CXJldHVybiBmYWxzZTsKIAkJZmFsbHRocm91Z2g7CkBAIC0xMDM3LDcgKzEwMzksNyBAQCBib29s
IGNmZzgwMjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBoeSAqd2lwaHksCiAJCWNhcCA9IHZo
dF9jYXAtPmNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF9NQVNLOwogCQlp
ZiAoY2FwICE9IElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFogJiYKIAkJ
ICAgIGNhcCAhPSBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgw
TUhaICYmCi0JCSAgICAhKHZodF9jYXAtPmNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1Nf
QldfTUFTSykpCisJCSAgICAhKGV4dF9uc3NfY2FwICYmICh2aHRfY2FwLT5jYXAgJiBJRUVFODAy
MTFfVkhUX0NBUF9FWFRfTlNTX0JXX01BU0spKSkKIAkJCXJldHVybiBmYWxzZTsKIAkJYnJlYWs7
CiAJZGVmYXVsdDoKLS0gCjIuMzEuMQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
