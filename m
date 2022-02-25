Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519DC433F5
	for <ath11k@archiver.kernel.org>; Fri, 25 Feb 2022 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gipgb/GSqpsaMLq7cMbe6BoLHJNJyc8OFTCeqY0hpEI=; b=FttAV4rNn7CUtg
	Tc3uzPIqC6RflRJko1yHmIV+QnxqEC8dxjznw+XuC1B3Gv6t9mcGQqjCTzl/1ZmioobQksr92Nrg4
	ETIhE3ZB57MdsvUKCA2NHNiJc1MKALmnGr1y9bPgWTCIqYr7trInmW/29EchWKD2j24VuECWGyez8
	JmPXgELRX3ZhOM7ONTj9tuzJCxcZtzwrI3pvxeJhlPYP/IARay3o+9AWgaaMJqjS5qLMtFcGYXM1A
	eYmkX8/NP1Vb7pLcg+R7vuufVkXvOyC806rO2DLxdmh4andipc9ARPK22G/IzO9iuCe345/rELmcS
	8WQ6tI/7cyWsAH9fpqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWEw-0040cd-NQ; Fri, 25 Feb 2022 08:46:14 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWEs-0040ZO-MA
 for ath11k@lists.infradead.org; Fri, 25 Feb 2022 08:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645778770; x=1677314770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqWY9/rbKVCqvD3Eg6vHChDIW5QC7U0HRyQcATZeaPw=;
 b=YAJrpCkKxRNbsOvyPuvAxq61wtrQhU6TYwEoprkINb1zz/YbQLGp43e2
 SJLJ/a8haoLL8TDLkWeZXOyQqX2WG7LbFqXLB+yg8uCdkUB2DaWRpQnB2
 0xgVU8LVjvKsUQ9O1wPtoUh5pNpLluN/DgsQZJHhCRAqBPu9pVCMA1RyS s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Feb 2022 00:46:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 00:46:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 00:46:10 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 00:46:08 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v7 3/4] ath11k: Add hw-restart option to simulate_fw_crash
Date: Fri, 25 Feb 2022 03:45:47 -0500
Message-ID: <20220225084548.19534-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225084548.19534-1-quic_wgong@quicinc.com>
References: <20220225084548.19534-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_004610_782890_AA8C3DB8 
X-CRM114-Status: UNSURE (   8.33  )
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

Add hw-restart to directly restart wlan. Like UTF mode start it will
restart hardware and download firmware again.

Usage:
1. Run command:
   echo hw-restart > /sys/kernel/debug/ath11k/qca6390\ hw2.0/simulate_fw_crash
   echo hw-restart > /sys/kernel/debug/ath11k/wcn6855\ hw2.0/simulate_fw_crash
2. wlan will be restart and do recovery process and success.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index c0ebdb1262f0..7375defb0f23 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -557,6 +557,10 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
 		ret = ath11k_wmi_force_fw_hang_cmd(ar,
 						   ATH11K_WMI_FW_HANG_ASSERT_TYPE,
 						   ATH11K_WMI_FW_HANG_DELAY);
+	} else if (!strcmp(buf, "hw-restart")) {
+		ath11k_info(ab, "user requested hw restart\n");
+		queue_work(ab->workqueue_aux, &ab->reset_work);
+		ret = 0;
 	} else {
 		ret = -EINVAL;
 		goto exit;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
