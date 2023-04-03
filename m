Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81517C761A6
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCWDt2V4/c8qECVPdp+Uiu3AvLQCS7MlQk2iqQN0LGU=; b=HhMHzK5PgwfdfT
	kF3B/WFWOu0YFOljb2oJvYGNjHIf/U0FsZqX0+F+9iZcnkBkT5Wr5hkbw6cK/6RErSRoQ8nhFu8E7
	4hG2GM1DcPIjMP2l/0HS2uk17wGYOLMgDTSnwnf7LbWgnYGq6l9hHsk7ow9vDp6bPUbF+d836dfK+
	4C06Zq2I9SRvBnejnJrihqLviuljXC313r2GqRF2xaPhELWTpXdbLsdcTl2BKEi4lViaQqOpNxR+2
	kMYD3pLETRDxAoAzZw2d/Zsvqzvf/APTg7peA8c/2K6mcq/Gdqg3dzbtYrbT18qUZtdKB6T7vZx/X
	mL8ktaXuQ06DNFgA/19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr3-00GBq6-0D;
	Mon, 03 Apr 2023 18:24:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr0-00GBoj-1Z
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 18:24:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333EUOmv031934;
	Mon, 3 Apr 2023 18:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=ckZrq16xKW3fx0AS0GjNzN1sRUHB0juy48gpxnS61S8=;
 b=WdP/B5NPkA+jaFzw7TMLIF/nLmO7z4V/SUfHRQ0pF87/idjBvnMJXmiSwz5zcLUkvuLv
 1o6o1t4ZtAgsmkz4Qc9ODDMpUI3I/lZ5h60OOKVyjI+OHg9lssrDNWR2D2c13HJiEyNR
 urlsD4WSArXpLZcRKRWp7wXWDNen6cRtEmJfC0XZnE8KbPfjtRuAojEefk6/Syamwj5f
 040IuiaSZxaQilIcscA47AoKP/7moo4yYgAEbsoHEBKdZpvW6NoNXIpyacZzdy44SlY4
 0uGWE1ETet7yUihwmjKKa6fdOJM7xuz6HkL8g0+QLqgZVuujnbMbRL9zqx8EKWEtBTIJ UA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pquxthadd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 18:24:30 +0000
Received: from pps.filterd (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 333IJBds026653;
	Mon, 3 Apr 2023 18:24:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3pr09uajnb-1;
	Mon, 03 Apr 2023 18:24:29 +0000
Received: from NASANPPMTA04.qualcomm.com (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333INHIo000475;
	Mon, 3 Apr 2023 18:24:29 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 333IORl6002480;
	Mon, 03 Apr 2023 18:24:29 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id D6CB8B003D5; Mon,  3 Apr 2023 23:54:27 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Subject: [PATCH 3/3] wifi: ath11k: add peer mac information in failure cases
Date: Mon,  3 Apr 2023 23:54:20 +0530
Message-Id: <20230403182420.23375-4-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230403182420.23375-1-quic_hprem@quicinc.com>
References: <20230403182420.23375-1-quic_hprem@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JVzxAmyq8IcIy9lLSJoTz-31UXH1y3xE
X-Proofpoint-ORIG-GUID: JVzxAmyq8IcIy9lLSJoTz-31UXH1y3xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=801 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_112430_529133_173398CD 
X-CRM114-Status: GOOD (  14.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

During reo command failure, the peer mac detail for which the reo
command was not successful is unknown. Hence, to improve the
debuggability, add the peer mac information in the failure cases
which would be useful during multi client cases.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e2320109dac0..25b1d5646b28 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1009,7 +1009,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 
 	peer = ath11k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
-		ath11k_warn(ab, "failed to find the peer to set up rx tid\n");
+		ath11k_warn(ab, "failed to find the peer %pM to set up rx tid\n",
+			    peer_mac);
 		spin_unlock_bh(&ab->base_lock);
 		return -ENOENT;
 	}
@@ -1022,7 +1023,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 						    ba_win_sz, ssn, true);
 		spin_unlock_bh(&ab->base_lock);
 		if (ret) {
-			ath11k_warn(ab, "failed to update reo for rx tid %d\n", tid);
+			ath11k_warn(ab, "failed to update reo for peer %pM rx tid %d\n",
+				    peer_mac, tid);
 			return ret;
 		}
 
@@ -1030,8 +1032,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 							     peer_mac, paddr,
 							     tid, 1, ba_win_sz);
 		if (ret)
-			ath11k_warn(ab, "failed to send wmi command to update rx reorder queue, tid :%d (%d)\n",
-				    tid, ret);
+			ath11k_warn(ab, "failed to send wmi rx reorder queue, peer %pM tid :%d (%d)\n",
+				    peer_mac, tid, ret);
 		return ret;
 	}
 
@@ -1064,6 +1066,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	ret = dma_mapping_error(ab->dev, paddr);
 	if (ret) {
 		spin_unlock_bh(&ab->base_lock);
+		ath11k_warn(ab, "failed to dma map for peer %pM rx tid :%d setup\n",
+			    peer_mac, tid);
 		goto err_mem_free;
 	}
 
@@ -1077,8 +1081,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac,
 						     paddr, tid, 1, ba_win_sz);
 	if (ret) {
-		ath11k_warn(ar->ab, "failed to setup rx reorder queue, tid :%d (%d)\n",
-			    tid, ret);
+		ath11k_warn(ar->ab, "failed to setup rx reorder queue, peer %pM tid :%d (%d)\n",
+			    peer_mac, tid, ret);
 		ath11k_dp_rx_tid_mem_free(ab, peer_mac, vdev_id, tid);
 	}
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
