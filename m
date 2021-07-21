Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFD0C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1F461208
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1F461208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiSMFwRWaPf9iQ9TKoytKr8v7acW5xpaNgLFf196f0M=; b=q2xLESaVKrJKic
	Lfa15f3wFg6USRnSQRwWCkyWLLRvxCNv1olJeTr7sc8S0Y9jeh1cGqbkylk4tflPctJ95N1dp2iwE
	Cay4yhfhxetBy7aEK+rNgIsYDS0qjCa5cQETYDtMBTQqckvgLLPhfGnh4A9JOgLhlOCSvpUsuoRiy
	u85OPhoyh9JCsMjXD3BQR2kHAxp7praiSHRJbKxtmjL/QSnU1dZZGJvN8c+lajtuX3cjnXHeB9VC1
	CJvBOiPr6XzAPOsBVKnsYLI2bTtXTI+Gm5lQQWlSRCqng50x/8cMe9M3sO0KuwS15dz0AsYYNtzYH
	WjeLjvSP7YXZqQYZwC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Jed-00HIgM-SU; Wed, 21 Jul 2021 21:21:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeW-00HIMB-Kt
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902479; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vArDi1udIpplxBRZqopeIC7gjgAL4qDN+Saz0J9AB0c=;
 b=SoX08ISk+nfavetrWwpWlE+gQLV1lmsOfd14Vpc0WXpq0j8zfm61Ah7eFoV8g+br2AAsv//q
 nQW1HgffmDhncZqGdEXx6Hp37EJHHyQm7eJZypFRRAy1+aK7IQjyj4U0sqsk290Ahbuh9rYr
 hE65wD7FSOOQMIGSwsvAPf7u5TY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f88fc1b653fbdadd8ed91c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:21:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 67FB2C4479C; Wed, 21 Jul 2021 21:21:04 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DD544C4338A;
 Wed, 21 Jul 2021 21:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD544C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 08/12] ath11k: Avoid "No VIF found" warning message
Date: Thu, 22 Jul 2021 00:20:25 +0300
Message-Id: <20210721212029.142388-8-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142119_739172_AD072838 
X-CRM114-Status: GOOD (  15.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Facing below warning prints when we do wifi down in multiple VAPs scenario.

warning print:

ath11k c000000.wifi: No VIF found for vdev 2
...
ath11k c000000.wifi: No VIF found for vdev 0

In ath11k_mac_get_arvif_by_vdev_id(), we iterate all the radio to get the
arvif for the requested vdev_id through ath11k_mac_get_arvif().
ath11k_mac_get_arvif() throws a warning message if the given vdev_id is
not found in the given radio. So to avoid the warning message, add
the allocated_vdev_map cross check against the given vdev_id before using
ath11k_mac_get_arvif() to ensure that vdev_id is allocated in the
given radio.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 20121479af6e..11276617a11f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -500,7 +500,8 @@ struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = rcu_dereference(ab->pdevs_active[i]);
-		if (pdev && pdev->ar) {
+		if (pdev && pdev->ar &&
+		    (pdev->ar->allocated_vdev_map & (1LL << vdev_id))) {
 			arvif = ath11k_mac_get_arvif(pdev->ar, vdev_id);
 			if (arvif)
 				return arvif;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
