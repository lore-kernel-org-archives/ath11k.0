Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BDFC5321E
	for <ath11k@archiver.kernel.org>; Mon, 26 Aug 2024 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5XnTu9WHctTVDM9Hsq5utV513c/jZ+IWuBCLoKB+CE=; b=Wu0GPr8kx3Y0S8SSS7mnwgGlBO
	/uuINxmMUyyeNc3tiEO/4/ss2tQWNArDdxG0x6R69CO3dkmGIYzinoIcMp2OfrqSD+vq8iOcXPhgv
	eDqg3d5RtSjHtdrXMubcmuCrhQ4+sqc/1hmO0fdDuV7BEQF7J/116JyqVYFb3OgENdFW3EGiy8zhL
	psS373sjU0An9iy1T+9VmzlC3669ahvaA2xW9k/ut9SPtkWrKhTYBNoTduudg6kyhZo/3sEaFLyBT
	4O+WeXhrDWmKACqAePtkL5CFRDe/QnsTZS9WwdEBazW30IKmyhGtF3XDRFh1J8geMgCm29gG6DkvR
	I5YFrNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOs0-00000005TZQ-2WeL;
	Mon, 26 Aug 2024 01:50:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOrv-00000005TXL-1Tf0
	for ath11k@lists.infradead.org;
	Mon, 26 Aug 2024 01:50:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PNKPTK028932;
	Mon, 26 Aug 2024 01:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5XnTu9WHctTVDM9Hsq5utV513c/jZ+IWuBCLoKB+CE=; b=T/+5yZxBOPUqQDN7
	bSr5FJ70vqn2mgE3xsFdwUOtwUpyAVcf4wVGKftIDtZEuzqRVNx/bIDX3r/wOuYj
	vCcvAZDeuFsoHeFEna5KpGUMp94pYXnny6TiCTnjFA2zHGhX9EKik3lFUx160AA3
	8qorXbOXZ6ZTbKJdGDjTVa9aMeV48aZYuT+yYczE/2IimWOR0TPeH1SqHk5KjHHo
	elNcOvSAiiOZMrwQfstLUSwKB4764pXoQzyI5Pt8XyCJInBTlqrsSXpn/DHSMkH3
	SRNHsiYYdKd45DqLPsMTO+3jbzn8NFFqQlY+yoJKR0YSBJC30gL+cQuNt6GJ0Ecf
	i6qfFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417976t645-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q1o4PR018690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:04 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 Aug
 2024 18:50:02 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 1/3] wifi: ath11k: refactor ath11k_dp_peer_cleanup()
Date: Mon, 26 Aug 2024 09:49:40 +0800
Message-ID: <20240826014942.87783-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826014942.87783-1-quic_bqiang@quicinc.com>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8wBh7Z_CCgyluAcsUFxjjUNUTSam2v9j
X-Proofpoint-GUID: 8wBh7Z_CCgyluAcsUFxjjUNUTSam2v9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_20,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_185007_536766_087B1CD0 
X-CRM114-Status: GOOD (  13.36  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently ath11k_dp_peer_cleanup() acquires ab->base_lock inside itself. This is
working because it is only called in below context where that lock is not held:

	ath11k_mac_op_sta_state() --> ath11k_mac_station_remove()

In a upcoming patch that fixes memory leak in reset scenario, we need to do the
same job as ath11k_dp_peer_cleanup(). However ab->base_lock is already held there
so we can not directly call it.

So the decision is to move lock/unlock outside of ath11k_dp_peer_cleanup() such
that we won't get deadlock in a context where the lock is already held. In order
to make sure it is called with lock held, add LOCKDEP assertion there.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp.c  | 5 ++---
 drivers/net/wireless/ath/ath11k/mac.c | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index fbf666d0ecf1..58f57dd8858f 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -26,19 +26,18 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 
 	/* TODO: Any other peer specific DP cleanup */
 
-	spin_lock_bh(&ab->base_lock);
+	lockdep_assert_held(&ab->base_lock);
+
 	peer = ath11k_peer_find(ab, vdev_id, addr);
 	if (!peer) {
 		ath11k_warn(ab, "failed to lookup peer %pM on vdev %d\n",
 			    addr, vdev_id);
-		spin_unlock_bh(&ab->base_lock);
 		return;
 	}
 
 	ath11k_peer_rx_tid_cleanup(ar, peer);
 	peer->dp_setup_done = false;
 	crypto_free_shash(peer->tfm_mmic);
-	spin_unlock_bh(&ab->base_lock);
 }
 
 int ath11k_dp_peer_setup(struct ath11k *ar, int vdev_id, const u8 *addr)
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f8068d2e848c..f1dff26bc237 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9531,7 +9531,9 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 		}
 	}
 
+	spin_lock_bh(&ab->base_lock);
 	ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
+	spin_unlock_bh(&ab->base_lock);
 
 	ret = ath11k_peer_delete(ar, arvif->vdev_id, sta->addr);
 	if (ret)
-- 
2.25.1


