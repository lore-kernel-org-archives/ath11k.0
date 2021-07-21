Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2D0C6377B
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB69611C1
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB69611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzTNKpZbY3d2K5kl47lTzucmYf4yJ/mmWIkdYFRKf4U=; b=SqHtCu3dD+xgiX
	ohJIaFDIMddZBpuYIz6/XB/5ZMXwudSMXfq4IV2fCvGlANE/MgnmTuS6tLrsqznwHDMxVPqIQ2Wv3
	1LsXzR5vzyKVtQO+a2GFvPwGMsivVW6bMASisjzhIQkqpHhINgoj7nfgcO/sDK8mGo56KFU62a8gy
	LGcNhPhvAlaeW79ZEtjXjFfh1rbAX+9jAvMIEJuuVkCcTOxbJV9boQHuOcUhezY7dy8m0ldQFkhAl
	a+hMKGkH1VC+lZ1uDPbBwaNnIAh3NKEq0gFeDaAGy1yiTTOVNZO0Jwc0S4BwP3RnSCGGHKbJi3e9K
	sjkbpJSTNiNfrAR+hy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JeM-00HITz-Dv; Wed, 21 Jul 2021 21:21:06 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeG-00HIPO-L1
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902463; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=48LHo3wNgwwVhG80VEPTkY7graAWuPWEySqLrtrRA8Y=;
 b=UME2xkQApn6QSWrMuSwnI362I+7UlmPdspNtVFSnbOuiSIqdPizGyknumUeB/eGFGy/e1lAE
 W55jCC7yL4jtGgDZsgyEzgx+PmbR1le8NGLzTIbH7Rua3Eef7ST2SsSfL5Pb5SP3UfqM766a
 o3X+qIw7WBcw22ALa7B6Fp8a2Ic=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f88fb6b653fbdadd8ea6c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:20:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 824C5C4338A; Wed, 21 Jul 2021 21:20:53 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BD0ECC4323A;
 Wed, 21 Jul 2021 21:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD0ECC4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 05/12] ath11k: Add vdev start flag to disable hardware
 encryption
Date: Thu, 22 Jul 2021 00:20:22 +0300
Message-Id: <20210721212029.142388-5-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142103_893132_B05E98B8 
X-CRM114-Status: GOOD (  13.21  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

Firmware blocks all data traffic until the key is plumbed. But, with
software encryption mode, key is never plumbed to firmware. Due to this,
a traffic failure in software encryption mode has been observed. Hence,
firmware has introduced a flag to differentiate software encryption
mode. This flag can be passed during vdev_start command.

Enable WMI_VDEV_START_HW_ENCRYPTION_DISABLED flag in vdev_start command
to notify firmware to disable hardware encryption for a vdev. This is set
if raw mode software encryption is enabled.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01421-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 43344e774a31..020b2b7ee3c8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -884,6 +884,8 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 	}
 
 	cmd->flags |= WMI_VDEV_START_LDPC_RX_ENABLED;
+	if (test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags))
+		cmd->flags |= WMI_VDEV_START_HW_ENCRYPTION_DISABLED;
 
 	ptr = skb->data + sizeof(*cmd);
 	chan = ptr;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 1fff74b2b476..16b3f48bb378 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2577,6 +2577,7 @@ struct wmi_vdev_down_cmd {
 #define WMI_VDEV_START_HIDDEN_SSID  BIT(0)
 #define WMI_VDEV_START_PMF_ENABLED  BIT(1)
 #define WMI_VDEV_START_LDPC_RX_ENABLED BIT(3)
+#define WMI_VDEV_START_HW_ENCRYPTION_DISABLED BIT(4)
 
 struct wmi_ssid {
 	u32 ssid_len;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
