Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D9C433F5
	for <ath11k@archiver.kernel.org>; Mon, 28 Feb 2022 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gipgb/GSqpsaMLq7cMbe6BoLHJNJyc8OFTCeqY0hpEI=; b=Jr5IHU5eOw+o70
	ZeRKn7E6BT3cw+Zo17yyDp4WNGXyiSJ7rhn7Gw5PYwMnA4IX17EX+fz2uBhsfUu6t4XkhtVhTMaJI
	i8BVX4EzhJGWTtun4NoQSAgC/6b3Vog74BzsFpb+3+lh30z4mEEK5M7KZ5YJk8NFLwKdUb2/8OXXn
	wqzgwEE4/OZy8t16RdM3/6X8yzXemFjTB1mqv4HwaLB2OgzXLn5fhr5moY5tNIlZKhkhC+35BGC5Z
	CJLVjiZAeINHLBG/G5KQTEQ5FI9cstW1leAcoh3H96tlyhmi5/t/4/EuEfxsaBIZCs5Za/GasyQ8E
	F4CmO3YRZ3OcZz4JO8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZni-00AvJi-0j; Mon, 28 Feb 2022 06:46:30 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZnf-00AvIa-39
 for ath11k@lists.infradead.org; Mon, 28 Feb 2022 06:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646030787; x=1677566787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqWY9/rbKVCqvD3Eg6vHChDIW5QC7U0HRyQcATZeaPw=;
 b=dqAwMHKprzdvqXBYX7lZPC1LdXa7TAJf4+JnWhowhb/AyT+98ofvDG7n
 tcBrxmHfEZxPhFkFOVTAnYvE3Q2d8+h49tZ03dHTOTbkTD0OuSxeHeFeu
 X/Ofuza60bo/wSGM+SYEqk9gTtOnB1JQmd8MdvJEn9WZ9Rw+wqh4kKPax 4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Feb 2022 22:46:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 22:46:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 27 Feb 2022 22:46:25 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 27 Feb 2022 22:46:24 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v8 3/4] ath11k: Add hw-restart option to simulate_fw_crash
Date: Mon, 28 Feb 2022 01:46:05 -0500
Message-ID: <20220228064606.8981-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228064606.8981-1-quic_wgong@quicinc.com>
References: <20220228064606.8981-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_224627_215430_15C680BD 
X-CRM114-Status: UNSURE (   8.13  )
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
