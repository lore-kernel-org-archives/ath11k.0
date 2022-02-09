Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A2BC433EF
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gipgb/GSqpsaMLq7cMbe6BoLHJNJyc8OFTCeqY0hpEI=; b=BMimA6hWDh3a92
	WR0JW4hWvquhl5SpYgGE7V1RdTutBs71ZdtXC/svvJSf3lkI6FfcHmMvzMp/eUX1df+RX311l0AOb
	7GDzRJaGp6wmnHbuIQnYrsA1DO4AbviOx6yDVjx1YE5Uo9JZCHVD4JyApzMaPvuZ1EM9jjeCgxjUr
	bN/rQ7zvzfsgiABaj7gwKVeZAY+x9ubQTSDhQHoOLGuz6S2KjPbbO1de7Kyn2LLciJ0MxLr+llpLj
	EhO1zXXNc0PEeMk1Cu9rojyJgZn5O20N72fV0TXAh2+Eud5GvkpGQMfrlYmA1QHMgr6H5uIN4dT8L
	3Xr3N3GemLaYuAmhA4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg1x-00GIki-BK; Wed, 09 Feb 2022 06:00:41 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg1u-00GId7-Mn
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 06:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644386438; x=1675922438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqWY9/rbKVCqvD3Eg6vHChDIW5QC7U0HRyQcATZeaPw=;
 b=LbfI6M3D4QbFcpyqsD5S2VFEIH2tdLWK/6qENkreBuigmzzFIM5qVe7W
 iAvgN6SkZS8Y7VeczwZ0myztp+7e83TdSoY2Pwq7kd+TGSr9ANgO1i9vy
 aQABEH4ZKJFBeBD92UnbhsK5nuyanT0LcBYJPoD3KNNlwM9+J28GIrzue k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 22:00:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:00:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:36 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:35 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 6/6] ath11k: Add hw-restart option to simulate_fw_crash
Date: Wed, 9 Feb 2022 01:00:12 -0500
Message-ID: <20220209060012.32478-7-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209060012.32478-1-quic_wgong@quicinc.com>
References: <20220209060012.32478-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_220038_794250_B626FF3D 
X-CRM114-Status: UNSURE (   7.90  )
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
