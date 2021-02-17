Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AF1C433DB
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 19:17:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A44D64E4D
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 19:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A44D64E4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAnyR2hgJyAFLRUk/BXKurRBf/GP4CXdAcmOLj+3nRo=; b=OmtFlTfg5S+G8HbO/nU2skKbx9
	BsM3ZJAoHh1QoHV+90YXYNm65N84ts6heRN3mCOB72+c6zlfnyhx4OLd/rZhiyOOkjRgcK7N/a/T4
	8SP4mzvsqQ0w1LU4CHEc/JMowgMdSS5yqbDjnBE5Odu5aeUSNLzJtN0gzdVea77SgboPFGggQbaAU
	Il9jfaUmcZfYanhMLEpNLHESeXvdrejh7vLnbKD3C6Wu41z9Q1h6wciX6jJlgWdga5wVMftUfOpvZ
	uD32B0DBzy0RrpAjYkk+Ip82Gkfs8OnVSqsfzKS8FN9XpqLrBDiPrORypa1OozXiFg+ieScTD4tJp
	z62w3qxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCSJm-00035B-HQ; Wed, 17 Feb 2021 19:16:58 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCSJi-00034H-NT
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 19:16:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613589415; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+Uv8rzU3yyfu1nObMEb3ysJ1lA3TWYdg3pXEEeXsODg=;
 b=ng8j7V0bH2w2xccHhDY3tLYOLB4mlqNoG1oiBIN06YYAiJKBSAbY+8ukhwJgIW5JIcQ4NVti
 h+5yshhooG9Ch438t/K8Fnm3pZgDU76zslHlWZOjF+NxCrElihEt8qZ1ZM/3Y9/Qtj8VnckX
 T/PXYy2EficnTi9DB6KQnbd9KeY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 602d6b9c97484ee2ac7c37b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 19:16:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4FEDDC433C6; Wed, 17 Feb 2021 19:16:44 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BD60C433CA;
 Wed, 17 Feb 2021 19:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BD60C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: print hardware name and version during initialisation
Date: Wed, 17 Feb 2021 21:16:40 +0200
Message-Id: <1613589400-18891-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_141655_580199_B177DF10 
X-CRM114-Status: GOOD (  12.67  )
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

This way it's easy for the user to find what device is actually installed. This
also helps reporting bugs.

Screenshot:

[  459.988812] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem 0xdb000000-0xdbffffff 64bit]
[  459.988867] ath11k_pci 0000:06:00.0: enabling device (0000 -> 0002)
[  459.997048] ath11k_pci 0000:06:00.0: qca6390 hw2.0
[  460.058093] mhi mhi0: Requested to power ON
[  460.059741] mhi mhi0: Power on setup success
[  460.476924] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[  460.477032] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index ddedc331edef..77ce3347ab86 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1017,7 +1017,7 @@ static int ath11k_init_hw_params(struct ath11k_base *ab)
 
 	ab->hw_params = *hw_params;
 
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "Hardware name %s\n", ab->hw_params.name);
+	ath11k_info(ab, "%s\n", ab->hw_params.name);
 
 	return 0;
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
