Return-Path: <SRS0=jp2b=P5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F77FC433F5
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 16:06:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234446121F
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 16:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 234446121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9QM81+zJ6H7ZyqMk6OVejiuflT75gBkodSLFxlNl5xM=; b=VFtnbSeUiOlZaX
	3x7zYPK0U/aAHLVSoN9JQE35nChKXY7BP9xcJJ4V4WZB1LNPYmZkNt7kHHzJqa5uM0txRcU0QzKaa
	2E76bTo16rMdPqbST906zWwXccJU0IrzYTuUi+arFWcsBQajHxD5Jct75dqFUoP+QurbdyediPGMZ
	Y9+2HXgHwWfMkKgHHqIBl8Z6/bskxxiUfD19FJhxk3HyBbPIpKz/TNgSLNGfTIM4KqTh/7i7L6RgQ
	bdfyKb/MMVbO9GXX40b9Lpo9rTUZPwh78rqUhCWBVfav7GLBw54kuexelzn6pwznvGEXOcWXCAi9X
	HYqBqLQpIQq/8l8Yup6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkq7Y-005nzP-Kj; Wed, 10 Nov 2021 16:06:44 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkq7W-005nyy-IC
 for ath11k@lists.infradead.org; Wed, 10 Nov 2021 16:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636560402; x=1668096402;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=21kKblIO2WAqKNg27VAfdkgJ1VawQwyxjqN2LA2derY=;
 b=mLArDu+/2tHTSxIPfVXZm8H+k4TeGn0eMhtMu0QojDEjMA6Mq3440Dv/
 qO9IvcLbO6jMfBTOVHTnIF4TGSRB6jrySNQ85vr27PGnJvl7eQHFmsvmc
 RBgpFo0vzayI4zmvx1UT5Dpte8nQmDA9G6mWdoH2bDMH/su22CtNc3D/B A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Nov 2021 08:06:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 08:06:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 08:06:41 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 08:06:40 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: [PATCH] ath11k: avoid unnecessary BH disable lock in STA kickout event
Date: Wed, 10 Nov 2021 21:36:28 +0530
Message-ID: <1636560388-24955-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_080642_648843_D3053AA6 
X-CRM114-Status: UNSURE (   9.52  )
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

In STA kickout event processing, the peer object is protected
under spin lock BH. Release this lock after picking up the vdev_id
from the peer object instead after ieee80211_report_low_ack().
This will minimize the lock hold period which will improve
performance since base_lock is used across the data path.
This was found in code review.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4..60de539 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6398,6 +6398,7 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff
 	struct ieee80211_sta *sta;
 	struct ath11k_peer *peer;
 	struct ath11k *ar;
+	u32 vdev_id;
 
 	if (ath11k_pull_peer_sta_kickout_ev(ab, skb, &arg) != 0) {
 		ath11k_warn(ab, "failed to extract peer sta kickout event");
@@ -6413,10 +6414,15 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff
 	if (!peer) {
 		ath11k_warn(ab, "peer not found %pM\n",
 			    arg.mac_addr);
+		spin_unlock_bh(&ab->base_lock);
 		goto exit;
 	}
 
-	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer->vdev_id);
+	vdev_id = peer->vdev_id;
+
+	spin_unlock_bh(&ab->base_lock);
+
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in peer sta kickout ev %d",
 			    peer->vdev_id);
@@ -6437,7 +6443,6 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, struct sk_buff
 	ieee80211_report_low_ack(sta, 10);
 
 exit:
-	spin_unlock_bh(&ab->base_lock);
 	rcu_read_unlock();
 }
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
