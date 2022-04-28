Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C8C433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Apr 2022 02:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EBbx9TKAGaIvs3Bj8YxowwG6val12LK6SCI8G7eRqHU=; b=brQ0ZeEfhtHB1e
	h4hrGZapF5+WwTyIv6O/kN9/+OeB7vTO2jq/SfBDapNawSkeY7gijEAWcE+HgLEc/5sI4ST2CbxZ2
	vHhWM4bh2vu5PEux8iMoyWNIg9GEci5RjyYzVVSZ94WCy2xTY0PeLr2ik6RgKOsyEzLNUeapX0OMS
	wP/qbeCRTs0hSHmQgmI+lKEoz2qCVLeKgJC7wKpMLfNcKVR+V2D8h5w2lHpGuXZF+QDMWlbUm2Sox
	xxHwPag58m8wSO2gYBJPcnCu5yP7iyCCgBRGvzhnDnVN/yiaxupJGCDXY6WrYIhd/f6PTTz5YuomM
	v3DXvNB+UwBSRRciDxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njtyO-004PhD-RR; Thu, 28 Apr 2022 02:33:40 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njtyM-004Pgn-BN
 for ath11k@lists.infradead.org; Thu, 28 Apr 2022 02:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651113218; x=1682649218;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CLYNYNqMRNLAa9ekYqI5LWGrZYM8agx/nL847tzuF4Q=;
 b=TzBR1dUq2JOgRZobfdllxlPq+bpIum3iMva215VJVAtqYSspdjXr2dKl
 qxR8gVmEG/TMhiq1yuIQEdyJSLyIj1Gn4vwHPdScr168Usjg/ilxErsk0
 eVbtWAs8fJEvgg6RBqPFqY8qNPZS9X3T7R+BB2+4CihN2+4ZjBxa2t6lK Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 19:33:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 19:33:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 19:33:37 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 19:33:35 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: change management tx queue to avoid connection timed
 out
Date: Wed, 27 Apr 2022 22:33:20 -0400
Message-ID: <20220428023320.4007-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_193338_460332_0144FABF 
X-CRM114-Status: GOOD (  10.10  )
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

In the phase of wlan load, it has hw scan and 11d scan which sent to
firmware by ath11k, then hw scan and 11d scan will use about 14 seconds,
and meanwhile ath11k_reg_update_chan_list() is running in workqueue of
ath11k_base, and wait for 11d scan/hw scan finished. When the hw scan
finished, mac80211 will start to connect and send management packet,
at this moment, ath11k_reg_update_chan_list() is still waiting for 11d
scan finished, so wmi_mgmt_tx_work of ath11k will not run and thus the
tx management packet also not send out and lead authentication timed
out.

log:
INFO kernel: [  187.885322] wlan0: authenticate with 72:6c:57:43:9f:90
INFO kernel: [  187.937266] wlan0: send auth to 72:6c:57:43:9f:90 (try 1/3)
INFO kernel: [  188.626944] wlan0: send auth to 72:6c:57:43:9f:90 (try 2/3)
INFO kernel: [  189.650999] wlan0: send auth to 72:6c:57:43:9f:90 (try 3/3)
INFO kernel: [  190.651917] wlan0: authentication with 72:6c:57:43:9f:90 timed out

Change wmi_mgmt_tx_work to another queue workqueue_aux of ath11k_base,
then connection success.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index da994d89d69d..1957e1713548 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5600,7 +5600,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 
 	skb_queue_tail(q, skb);
 	atomic_inc(&ar->num_pending_mgmt_tx);
-	queue_work(ar->ab->workqueue, &ar->wmi_mgmt_tx_work);
+	queue_work(ar->ab->workqueue_aux, &ar->wmi_mgmt_tx_work);
 
 	return 0;
 }

base-commit: 3637b73b8e805d011202e2bf10947f2d206695d4
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
