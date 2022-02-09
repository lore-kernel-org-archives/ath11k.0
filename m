Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C17C433EF
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 06:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAunKkLBUL5OUPW7sMrEFU9AzMHdF+9bOU8CLJr/tv8=; b=Tvv7mxncak28JK
	qzaXQvf+4lHt4hrNhEYrli38vJs+uDSrl0WyvNWZPBOb5LTPqzStW6ywhCdP3xUC0+bdWl4/YN2yD
	K4lQbzdmvq7+Vdrqr5Bq06hUZF6z8mHG95hIndskAbYsercr675mLTc3SlbumGWOBHO+rK71+3TxG
	iQpqMjtF4OFtlr76WWXdZlTUgJA0UkQO83hpjJHM66zfdWlBuG5/ljKRDlfAxcDnesEQYx7+vyjkT
	JZcTLbIY+YMLbRz2IlUhcO9arF4GPZlhKMdw8z5bLR9nxBUif0XrkJPaqW+3NlXLOpC7msv83ChoO
	c7g3B7TesB2plxkgvUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg1q-00GIeP-Kc; Wed, 09 Feb 2022 06:00:34 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg1n-00GId7-Ee
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 06:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644386431; x=1675922431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wRqVYEvtASr/2CPMz1yrWa7eoT32u3NSuYCsqJXfjXU=;
 b=NCw319wfs4cIInhRdb2c9DQL3AdBZA/xVjOKFJ2LjteTnrMa1lVh9Y+C
 +DX1EdXH67SInGXFHRTOMp9xNxC3tKhaQN0kGl5sF9p13qE5tUCAQO4HG
 lNyXyBx1Akn+y5VbM7dg9yzihvCdg2JUMGAV3EyeyXUhHKIUZt44ZNoXJ 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 22:00:30 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:00:30 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:29 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:28 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 1/6] ath11k: add ath11k_qmi_free_resource() for recovery
Date: Wed, 9 Feb 2022 01:00:07 -0500
Message-ID: <20220209060012.32478-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209060012.32478-1-quic_wgong@quicinc.com>
References: <20220209060012.32478-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_220031_525557_2C9429B3 
X-CRM114-Status: UNSURE (   7.30  )
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

ath11k_qmi_free_target_mem_chunk() and ath11k_qmi_m3_free() is static
in qmi.c, they are needed for recovery, export them in a new function.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 5 +++++
 drivers/net/wireless/ath/ath11k/qmi.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d0701e8eca9c..1144e828cf5c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3025,3 +3025,8 @@ void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_qmi_deinit_service);
 
+void ath11k_qmi_free_resource(struct ath11k_base *ab)
+{
+	ath11k_qmi_free_target_mem_chunk(ab);
+	ath11k_qmi_m3_free(ab);
+}
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index ba2eff4d59cb..61678de56ac7 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -492,5 +492,6 @@ void ath11k_qmi_event_work(struct work_struct *work);
 void ath11k_qmi_msg_recv_work(struct work_struct *work);
 void ath11k_qmi_deinit_service(struct ath11k_base *ab);
 int ath11k_qmi_init_service(struct ath11k_base *ab);
+void ath11k_qmi_free_resource(struct ath11k_base *ab);
 
 #endif
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
