Return-Path: <SRS0=LKqF=JF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1A0C433B4
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 04:58:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19527610A6
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 04:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19527610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kf0X1FE6olk6cHLxuWRWyVNIEMx/P57hcQ1Et0etp7g=; b=B9kMlBHtGRCPEEPtFNrdkT5uuE
	TxfrvXV1ob5qwfm/LZo5AvRJLlG85/G/zwwKUDz45TNhFGgIqCUbgyBvLokyp7n0zGZJDkDjwscnN
	JIj7aksJYJqdxIE2qCY07+mrW38CtPCJlG3N5t8IM7tE59HQicleE7QVJou/5mXGaE+DT30gnDQjj
	jGAVYLGdWZWqtX2CgQN5tTCB5cWA6mOEF3IhUAl//Tz5cxVRevg/f79mwPKvXEP8TRo5ay1rlp4zR
	mn/mkQUIw+oDsg0V3f1S1JM69x4wl2HuR5njxNlBMGrda8bl2nLmNvyLCV1e28XYi6r+6euartZpE
	ycSLKPjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUMjq-006uZi-JJ; Thu, 08 Apr 2021 04:57:55 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUMji-006uYe-Gk
 for ath11k@lists.infradead.org; Thu, 08 Apr 2021 04:57:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617857867; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WQu857nGaqbPeUBYM2Ptee8d7W+UMIlYnLGn1v7CjAw=;
 b=OJDCzya53Vw6FlW4r1hKrv8Zx4irwrgAVkCsd6atFMnLqTGOcqQJjjc7dSGWRn0WnI2rn9Df
 WyRF9HYHPkHIaAv1Mu37eL4y/FK39zuysAMvzu8su3QH+g5re4dM286iozxUFi3JwPad2P2B
 JMh3NNHO9d/XDOEOqDmTtCetnwk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606e8d458807bcde1d5711f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 04:57:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B29A0C43461; Thu,  8 Apr 2021 04:57:41 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B066C433ED;
 Thu,  8 Apr 2021 04:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B066C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: fix warning in ath11k_mhi_config
Date: Thu,  8 Apr 2021 10:27:10 +0530
Message-Id: <1617857830-19315-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_055747_826145_341B742A 
X-CRM114-Status: UNSURE (   9.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Initialize static variable ath11k_mhi_config for all hw_rev,
return error for unknown hw_rev.
This patch fixes below Smatch warning:
    drivers/net/wireless/ath/ath11k/mhi.c:357 ath11k_mhi_register()
    error: uninitialized symbol 'ath11k_mhi_config'.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1

Fixes: a233811ef600 ("ath11k: Add qcn9074 mhi controller config")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 626764da4d6f..27b394d115e2 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -349,10 +349,19 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
 
-	if (ab->hw_rev == ATH11K_HW_QCA6390_HW20)
-		ath11k_mhi_config = &ath11k_mhi_config_qca6390;
-	else if (ab->hw_rev == ATH11K_HW_QCN9074_HW10)
+	switch (ab->hw_rev) {
+	case ATH11K_HW_QCN9074_HW10:
 		ath11k_mhi_config = &ath11k_mhi_config_qcn9074;
+		break;
+	case ATH11K_HW_QCA6390_HW20:
+		ath11k_mhi_config = &ath11k_mhi_config_qca6390;
+		break;
+	default:
+		ath11k_err(ab, "failed assign mhi_config for unknown hw rev %d\n",
+			   ab->hw_rev);
+		mhi_free_controller(mhi_ctrl);
+		return -EINVAL;
+	}
 
 	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
 	if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
