Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10481C433ED
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 03:41:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8C8611AD
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 03:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D8C8611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upIX3UxhdT4oSqZLYPDiFWcEvJFgncejtDQiCEYHmU0=; b=UG1lxa0hZGNaPXn5d36h40hSf+
	uhN4VUexMSdvce8UG0XSRSo9zRltPwXEq6FRPkt8ljQquqQIhbzRgC9ciRpK1TPxOb2aX+a721Pw7
	DLFklmMB6z7HevMqPxTUokD+loJtdQ9B3SbIYGpIKYHagIKlhDia6x89LI5HwOtn2OwQuj2nLPAbF
	xXfWoV4RXY7gC5A7c79ZglpWAh7huANmAHw5+ZdZixdekmuGIg3ps8mW6ud2iP7/kwMmrNynbPQV6
	6YU/sAqpTWrvpm+Zkr+jk6KaoboYleJsEGh4LvWPX5cHDEij48y3l9SBaRxlEwIn6mX6oXBowOov3
	jQvibUJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZYS-005mMP-44; Thu, 20 May 2021 03:41:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZYQ-005mLy-Of
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 03:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Dm0UeqvKp5/7TvMPXjTUVVNafJUynQkZ6bgIdN/L1SI=; b=rESi5kzGGQnipWP39R0w8y92Se
 4WwmxzAA5pBWJ0ypvuf8mqZl3Hv9qKyakCOL6lZKmdvYt5dPhZZ4ZEPm60FOnTTtk3rj5a5ivUvD3
 WHKJbU+XraZpw/DztGMRWJbN9hfZTfGVApRw4Zz0G8QSQ27wGiChccI9BQF8s+uL7zu9CgzH9bOcX
 bgtG2ZRfMKPv8VZPIS+3h6msTvR4zXReRCfXAjtfsrrKPeSSsAf6h9JT/vCK6TStdsH7/I1je8Nsu
 RhuIgPg6fZYsbtAGfJoa7DV4yNhyHNWMkfU6x0O4NY2IgzSqh+kmP0ny0wV3S4AQU5N4iv+PHekd8
 UwnIG8kA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZYM-00Fue7-23
 for ath11k@lists.infradead.org; Thu, 20 May 2021 03:40:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621482056; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Dm0UeqvKp5/7TvMPXjTUVVNafJUynQkZ6bgIdN/L1SI=;
 b=kLO56sdmUuexxtZ7SmJd+Km8RYi4tXasrxplZ95tdE23y6PWIsSRW2G2J9i3woVA7HGMZoF/
 baz3SjKsGtHV1F6RiHGTRMDttyfZvPotKeecQexYZI5Efes8og9hTRXVA7WtwYqwq6glR4nX
 RIzdZcdHYlVKh/SBINU/7SyDAvI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60a5da2dd1aee7698d230e95 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 03:40:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 00C61C4338A; Thu, 20 May 2021 03:40:29 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 30118C433D3;
 Thu, 20 May 2021 03:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30118C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] wireless: add check of field VHT Extended NSS BW Capable for
 160/80+80 MHz setting
Date: Wed, 19 May 2021 23:40:21 -0400
Message-Id: <20210520034021.14690-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_204056_168235_6B69FC09 
X-CRM114-Status: GOOD (  11.05  )
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
cmc+Ci0tLQogbmV0L3dpcmVsZXNzL2NoYW4uYyB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0L3dpcmVs
ZXNzL2NoYW4uYyBiL25ldC93aXJlbGVzcy9jaGFuLmMKaW5kZXggMjg1YjgwNzYwNTRiLi5mN2Y4
NmJkNzVjYzAgMTAwNjQ0Ci0tLSBhL25ldC93aXJlbGVzcy9jaGFuLmMKKysrIGIvbmV0L3dpcmVs
ZXNzL2NoYW4uYwpAQCAtOTQyLDcgKzk0Miw3IEBAIGJvb2wgY2ZnODAyMTFfY2hhbmRlZl91c2Fi
bGUoc3RydWN0IHdpcGh5ICp3aXBoeSwKIAlzdHJ1Y3QgaWVlZTgwMjExX3N0YV92aHRfY2FwICp2
aHRfY2FwOwogCXN0cnVjdCBpZWVlODAyMTFfZWRtZyAqZWRtZ19jYXA7CiAJdTMyIHdpZHRoLCBj
b250cm9sX2ZyZXEsIGNhcDsKLQlib29sIHN1cHBvcnRfODBfODAgPSBmYWxzZTsKKwlib29sIGV4
dF9uc3NfY2FwLCBzdXBwb3J0XzgwXzgwID0gZmFsc2U7CiAKIAlpZiAoV0FSTl9PTighY2ZnODAy
MTFfY2hhbmRlZl92YWxpZChjaGFuZGVmKSkpCiAJCXJldHVybiBmYWxzZTsKQEAgLTk1MCw2ICs5
NTAsNyBAQCBib29sIGNmZzgwMjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBoeSAqd2lwaHks
CiAJaHRfY2FwID0gJndpcGh5LT5iYW5kc1tjaGFuZGVmLT5jaGFuLT5iYW5kXS0+aHRfY2FwOwog
CXZodF9jYXAgPSAmd2lwaHktPmJhbmRzW2NoYW5kZWYtPmNoYW4tPmJhbmRdLT52aHRfY2FwOwog
CWVkbWdfY2FwID0gJndpcGh5LT5iYW5kc1tjaGFuZGVmLT5jaGFuLT5iYW5kXS0+ZWRtZ19jYXA7
CisJZXh0X25zc19jYXAgPSB2aHRfY2FwLT52aHRfbWNzLnR4X2hpZ2hlc3QgJiBJRUVFODAyMTFf
VkhUX0VYVF9OU1NfQldfQ0FQQUJMRTsKIAogCWlmIChlZG1nX2NhcC0+Y2hhbm5lbHMgJiYKIAkg
ICAgIWNmZzgwMjExX2VkbWdfdXNhYmxlKHdpcGh5LApAQCAtMTAxNSw3ICsxMDE2LDggQEAgYm9v
bCBjZmc4MDIxMV9jaGFuZGVmX3VzYWJsZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LAogCQkJKGNhcCAm
IElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBfODBQTFVTODBNSFopIHx8CiAJ
CQkoY2FwICYgSUVFRTgwMjExX1ZIVF9DQVBfU1VQUF9DSEFOX1dJRFRIXzE2ME1IWiAmJgogCQkJ
IGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykgfHwKLQkJCXUzMl9nZXRf
Yml0cyhjYXAsIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykgPiAxOworCQkJKGV4
dF9uc3NfY2FwICYmCisJCQkgdTMyX2dldF9iaXRzKGNhcCwgSUVFRTgwMjExX1ZIVF9DQVBfRVhU
X05TU19CV19NQVNLKSA+IDEpOwogCQlpZiAoY2hhbmRlZi0+Y2hhbi0+YmFuZCAhPSBOTDgwMjEx
X0JBTkRfNkdIWiAmJiAhc3VwcG9ydF84MF84MCkKIAkJCXJldHVybiBmYWxzZTsKIAkJZmFsbHRo
cm91Z2g7CkBAIC0xMDM3LDcgKzEwMzksNyBAQCBib29sIGNmZzgwMjExX2NoYW5kZWZfdXNhYmxl
KHN0cnVjdCB3aXBoeSAqd2lwaHksCiAJCWNhcCA9IHZodF9jYXAtPmNhcCAmIElFRUU4MDIxMV9W
SFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF9NQVNLOwogCQlpZiAoY2FwICE9IElFRUU4MDIxMV9WSFRf
Q0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFogJiYKIAkJICAgIGNhcCAhPSBJRUVFODAyMTFfVkhU
X0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgwTUhaICYmCi0JCSAgICAhKHZodF9jYXAt
PmNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykpCisJCSAgICAhKGV4dF9u
c3NfY2FwICYmIHZodF9jYXAtPmNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFT
SykpCiAJCQlyZXR1cm4gZmFsc2U7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjMxLjEKCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
