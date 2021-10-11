Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BA1C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:11:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6738960E98
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6738960E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATh1VE0M800YOwI6S2/M8EbASYY1DoyZLeZ7XqlZNzk=; b=AiYIPOSWmaR1WT
	2YBOXyUAf0yE5m4yAeWwskf79aa+vM/cvW35+zy+t038asJWzQTcQKerksxc2X9mz2ORIPLXzOE0G
	cbQIkP63FqNxLVO1QjeFTejHWkOSmerEOOGCoMjdgBnl0oJa+9gIRxsp52xzZRoae3p14tYFTmhIa
	iDFJrym19JbmwPTzDzzW2vPXtLxD2u8sa68giC84u1qOTajx/g3zFLLA29TIw+2SrCeweewgRA1zT
	BVLm/jxTp2fIS6GOH1SJFCkF39FHbE/fRViD2wfo8/0+9omOJYmXnKVDNCLNCaQxE3t72poS3haH9
	h6w1IV6UVhoR8vdGnpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoXL-007uAc-An; Mon, 11 Oct 2021 06:11:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoXE-007u8z-CY
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 06:11:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633932704; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=xhj5dxu+eDLVZQYYajqtKXXzXLf5dHufW15/ovtEr8A=;
 b=KhOn8a5DoAxzqKM8XEkHBabEdsqNaQvZAbOaVTAwzwTeLa81iU1WxzkjbMLn0vQceEnjiogG
 Me7akTiIgtJKikHtjtGK5MeDUl21bNXqx0apoBvDK7GqoplGuza6+8eCNrVU74ZKJCrLzV6e
 Y0m8Ui246nHQS2VB4SnjrMubaqw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6163d58e0605239689891383 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 06:11:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E7CDDC43460; Mon, 11 Oct 2021 06:11:25 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D672AC4338F;
 Mon, 11 Oct 2021 06:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D672AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] ath11k: Identify DFS channel when sending scan channel list
 command
Date: Mon, 11 Oct 2021 13:49:19 +0800
Message-Id: <20211011054919.77071-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_231144_566462_ECFE4B70 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

WMI_CHAN_INFO_DFS flag should be set when configuring a DFS channel
included in scan channel list. Without it, firmware will not send a
probe request frame which is needed in connection to an AP configured
with hidden SSID/network_id. So fix this to allow probe request frames
to be sent in cases where a beacon frame has been seen on the channel
first.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2d0acfb748cf..9781b69515dd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2371,6 +2371,8 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 				chan_info->info |= WMI_CHAN_INFO_QUARTER_RATE;
 			if (tchan_info->psc_channel)
 				chan_info->info |= WMI_CHAN_INFO_PSC;
+			if (tchan_info->dfs_set)
+				chan_info->info |= WMI_CHAN_INFO_DFS;
 
 			chan_info->info |= FIELD_PREP(WMI_CHAN_INFO_MODE,
 						      tchan_info->phy_mode);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
