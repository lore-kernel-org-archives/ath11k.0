Return-Path: <SRS0=uMcA=P6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062EDC433F5
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 15:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E4461252
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 15:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7E4461252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNfyKjxHkT5ouFbjHLQWqUv10y9O1VU3x4E+3h43jp8=; b=PhYn+enhsxPtQX
	W3gpzEE4WULJ5S54X0T93m8kCVgENLSdAI5Gl1m90DdoC+7DBuOEv43I0fA7+XtrlgAeh3+2HonIC
	qzgObf0pyzXAX4WlfGX4u8yZgEGo287+KKXM1tXDTBDUiqtGpcMwMdShglsk8+2wE279jKNRfmqoE
	O3CPb+q7dqMZq4JiESypMsizQcZW9FjF17bh57vTpX93F1BrHYLAnX1mvVRH7dLeY2lUGw5kRpg8x
	Tj9UtU6t43yoivgCAMB3Jd2jBssBveWH9kHtQqStDShrJ/7smo3mQkLy2F2+VIXgX7tvlVtujx3j5
	PxzoLq/Wx0lUaAE7TkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlBsC-008FOq-Mt; Thu, 11 Nov 2021 15:20:20 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlBsA-008FOJ-Rn
 for ath11k@lists.infradead.org; Thu, 11 Nov 2021 15:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636644018; x=1668180018;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3WhpqACNKff6MmXV5dNtvRocnnTl8mlXto095kLFgik=;
 b=XLxfXJx1Dvz+6VzPV1oPGj5R8Q+53Z7A+TwoxngrNDLjnUbsHxTqPjGL
 yVYdLDic+0MMntOL1diurMgsme9WJgQmHfM1zzTgt0Z8yYH3GXLHe9tpk
 oHcRLsHrMj6QtCMFVaHZxXWdiz7oZPmRJlRNHhiYiK8/dgUYNa7uH2h6i s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Nov 2021 07:20:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 07:20:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Thu, 11 Nov 2021 07:20:16 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 07:20:14 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH] ath11k: fix target assert during channel switch
Date: Thu, 11 Nov 2021 20:50:02 +0530
Message-ID: <1636644002-25446-1-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_072018_971800_4253668F 
X-CRM114-Status: GOOD (  13.84  )
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

Currently the updated bandwidth for the peer will be configured
to the firmware after channel switch from the sta_rc_update_wk.
If the updated bandwidth is greater than the configured peer phymode
during the peer assoc may result target assert.

For example, initially AP is in HE40 mode and the peer phymode is
configured as MODE_11AX_HE40 during peer assoc. Now user change the
channel width to HE80 then, the peer bandwidth will be updated as
HE80 to the firmware.

This will trigger target assert due to peer bandwidth is greater than
the peer phymode.

Fix this issue by sending peer assoc command before setting the updated
peer bw to fw.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
Depends-on: "ath11k: Clear auth flag only for actual association in security mode"

 drivers/net/wireless/ath/ath11k/mac.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index eba8cee..2e2a8ad 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3826,11 +3826,27 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 			   ath11k_mac_max_he_nss(he_mcs_mask)));
 
 	if (changed & IEEE80211_RC_BW_CHANGED) {
-		err = ath11k_wmi_set_peer_param(ar, sta->addr, arvif->vdev_id,
-						WMI_PEER_CHWIDTH, bw);
-		if (err)
-			ath11k_warn(ar->ab, "failed to update STA %pM peer bw %d: %d\n",
-				    sta->addr, bw, err);
+		/* Send peer assoc command before set peer bandwidth param to
+		 * avoid the mismatch between the peer phymode and the peer
+		 * bandwidth.
+		 */
+		ath11k_peer_assoc_prepare(ar, arvif->vif, sta, &peer_arg, true);
+
+		peer_arg.is_assoc = false;
+		err = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
+		if (err) {
+			ath11k_warn(ar->ab, "failed to send peer assoc for STA %pM vdev %i: %d\n",
+				    sta->addr, arvif->vdev_id, err);
+		} else if (wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ)) {
+			err = ath11k_wmi_set_peer_param(ar, sta->addr, arvif->vdev_id,
+							WMI_PEER_CHWIDTH, bw);
+			if (err)
+				ath11k_warn(ar->ab, "failed to update STA %pM peer bw %d: %d\n",
+					    sta->addr, bw, err);
+		} else {
+			ath11k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
+				    sta->addr, arvif->vdev_id);
+		}
 	}
 
 	if (changed & IEEE80211_RC_NSS_CHANGED) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
