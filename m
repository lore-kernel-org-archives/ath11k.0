Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A872BC4338F
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFD161100
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DFD161100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeFIV6tK/DIQQbH8q4O4NjP9n3cJLlT9djGKSO6NPow=; b=ISp7YGzl7Tkhyu
	iqkYdZ7TiBdkjWIwpnNHi5dEYRt/jFBIDHixOICraJbU1Yz+Aw7zTAZE4+YoVj6Yow47H8vI49dDn
	JcNf5E/+JV3j/2u5JB52uhqmif2MYq2mXAlytZ/05H8KtcLoLqVgkWruCA7NLKotcO+3bsHAy0LZo
	6sNvcSwJtu/wyVOlHHPCYB4gfnY+bst/8JI7Ud0DS+2gQQAGJiJET3B2ZaqPLdpkBexhxolJLtB9T
	UR5IVto7hnpNxh7Cy10k49vphj4Mox02YIwIp7N0mvZXyJfeimgJ0XLglUuH76lzbFdA76u5sbWDO
	e1UFCQBmL0F+cUm9dMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpNJ-006ApU-JN; Wed, 25 Aug 2021 09:39:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpNB-006Ahr-NK
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:39:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884348; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gjWRnhydAOjk1sR8RwwNsZBpFXGxC0oX6s53M8gpWVo=;
 b=nXGmfyjGT/VjCV0M5V3inF3B9y41m+I/YLz6GhdwtIsY6bnTiFnNwHHDhmpLJ07xoPX0A1ht
 U8vxZLZYI6sSoDotyEZVWdaRpdrpns2IV+uqhR7TN6q7wCfrjdylMWbsN07rE46UqIB37tqD
 25YRGB2+Kn29hiyXA/9twr5rhLI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61260fa71567234b8cbd2904 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:38:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CA6AC4360D; Wed, 25 Aug 2021 09:38:46 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 672EFC4338F;
 Wed, 25 Aug 2021 09:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 672EFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v2 01/12] ath11k: disable unused CE8 interrupts for ipq8074
Date: Wed, 25 Aug 2021 15:07:46 +0530
Message-Id: <1629884277-18759-2-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023908_815740_2A8DAEBC 
X-CRM114-Status: GOOD (  12.18  )
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

Host driver doesn't need to process CE8 interrupts (used
by target independently)

The volume of interrupts is huge within short interval,
 CPU0           CPU1       CPU2       CPU3
14022188          0          0          0       GIC  71 Edge      ce8

Hence disabling unused CE8 interrupt will improve CPU usage.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index de8b632..b6ffe03 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -77,7 +77,7 @@ const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 
 	/* CE8: target autonomous hif_memcpy */
 	{
-		.flags = CE_ATTR_FLAGS,
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
 		.src_nentries = 0,
 		.src_sz_max = 0,
 		.dest_nentries = 0,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
