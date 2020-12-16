Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E04C2BBCA
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A6B25E78
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A6B25E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMUFHyWWYtXoJtbqLQjlInz+Axd+VCW0Z5PGn0jTqGA=; b=fIBfTH3sduW0an0OT8ySok3W2I
	UmzJ2aQtNOBX3g0C8uCEOHshcu5fXgSMUJjAKOw2b2d9fUlNvukm3kJ2EchPjxHsFVPDodH0HxHlz
	6yl+BWZfcxaXBY269DZeZkCqh0F4Q2UW0RpXe67dxKVpxDBWoGtO40FJ1rJwiHA8gTX8blA5/lLgY
	8/XMhTnJJ/4WBdqyPAUYQIQHq2KF3JfwJGQvP7C9HraL1tLQt641zKKVS3QkUlEwpcwFo1u9nmW8N
	8Qdczm5dG6Tfcx4ZegoZsQOrHoWA8DUJXYQ6Vmf8yIbzEK0YjbfIdEu5szsm+gd/bZ3fuhqvAvKJx
	OYzfPNJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpbTL-0000tp-V2; Wed, 16 Dec 2020 18:24:24 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpbTI-0000t1-L2
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 18:24:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608143061; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Hj7xYRgtW8e6QXy3Cy5jsBPL35QpdkLcNo6ILdYYOQc=;
 b=TNuWIIsfz+DBmmS+cKrwXGME+ph16gS7gmID1jPQ04zKrrnP+AFg4pvOD+xHnCmxw7zbGM8z
 daXfrtZHnc2Jx47fDglnYYYuQHzMd71f/eZ/+uy7pRfdL4NgqoLvdxMnwXAQ5CMxgrMrxnbH
 cHy6XtTBrx4g8OFzR2irkpOUJHE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fda50d0ca81d9e625c53323 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 18:24:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BFF95C433ED; Wed, 16 Dec 2020 18:24:15 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89863C433C6;
 Wed, 16 Dec 2020 18:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89863C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: pci: remove unnecessary mask in
 ath11k_pci_enable_ltssm()
Date: Wed, 16 Dec 2020 20:24:11 +0200
Message-Id: <1608143051-5386-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_132421_254769_31B8716D 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

0x10 is a leftover and unnecessary, GCC_GCC_PCIE_HOT_RST_VAL is already defined
to 0x10.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7024648c9e4f..1cda36e674fe 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -328,7 +328,7 @@ static void ath11k_pci_enable_ltssm(struct ath11k_base *ab)
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "pci ltssm 0x%x\n", val);
 
 	val = ath11k_pci_read32(ab, GCC_GCC_PCIE_HOT_RST);
-	val |= GCC_GCC_PCIE_HOT_RST_VAL | 0x10;
+	val |= GCC_GCC_PCIE_HOT_RST_VAL;
 	ath11k_pci_write32(ab, GCC_GCC_PCIE_HOT_RST, val);
 	val = ath11k_pci_read32(ab, GCC_GCC_PCIE_HOT_RST);
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
