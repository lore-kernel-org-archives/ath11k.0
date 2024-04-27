Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFC3C4345F
	for <ath11k@archiver.kernel.org>; Sat, 27 Apr 2024 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETLBd4CWXBkhhvEp/bEzV9txTJRfxLVIV0bmHDx0eK8=; b=40bIZdSWfzRnYnCW2ZpqwBa+uQ
	+2BFAh49dION1IU3m5TaaLaGzIm84NAB8t3tuvepPCHLw5q4zeFWykuDeBd18bId9q3hTGfMftXjB
	2YgZPUa8IAwwC+zsht766VtdoSw5xoQMRT2gcSFv5dybezwcbcvUj6KTkYrYzGx3lOlutHKuV3MVJ
	79I1ruc1W+8/IDjCQ51BfOOxvqytIYFPy+29f3nJq9snQHtNNgnF9qsDfiGjQrCFw0xZLHOWmFBHM
	CvD+hJ6l0JNye+eTc6MQd7ZyYc5RAXMHQEqZXlVd4SHAPpLJAKMXk/wdf7lrIBPdVPv2wfrPOBoZT
	AKfvjbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0e7H-0000000FCxt-3PD2;
	Sat, 27 Apr 2024 09:13:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0e7F-0000000FCx7-1l03
	for ath11k@lists.infradead.org;
	Sat, 27 Apr 2024 09:13:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43R94otE011407;
	Sat, 27 Apr 2024 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=ETLBd4C
	WXBkhhvEp/bEzV9txTJRfxLVIV0bmHDx0eK8=; b=dBIl0/0B0jCyBUVXxClCoTx
	PCv87S+CJ/NlNo4BODtGSJwkv9qwiIN+E5E1bpRXVbE4lTzVOAmb2yHWwpHcJX4F
	9ILbLQCpXuJ9c1VQ2LJya0gX14ZleojzihOPVa+DZ0l8Ttks5Qpie2hs25IsHRrx
	tB3kFdVV+29np9c9imp6VRv6KckrBr2CvD+1AICdbz1l6DGwp229NaUjpLNXl8sD
	bFMX36pJC553Wj2T6ikgfXZog9tRE25AFGGmIhI4RV9LyPWvJNEMyWmXkj+qKhGg
	0LNpbjkpH6qlq6/p4ERACHyV9J1jWUFQc7sNS65F9iQIADn1/VaigAA1zKwqAYw=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrt4kr8rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 09:13:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43R9CxI5022564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 09:12:59 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 27 Apr 2024 02:12:57 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        "Tamizh
 Chelvam Raja" <quic_tamizhr@quicinc.com>
Subject: [PATCHv3] wifi: ath11k: skip status ring entry processing
Date: Sat, 27 Apr 2024 14:42:48 +0530
Message-ID: <20240427091248.2013946-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EnhiDjEL6fyHCgr-otR7VvtmprW7bctO
X-Proofpoint-ORIG-GUID: EnhiDjEL6fyHCgr-otR7VvtmprW7bctO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-27_06,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=820
 clxscore=1011 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404270066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_021305_711711_A6EEED36 
X-CRM114-Status: GOOD (  19.65  )
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

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
we don't process the status ring until STATUS_BUFFER_DONE set
for that status ring entry.

During LMAC reset it may happen that hardware will not write
STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
status ring.

To fix the issue, when HP(Head Pointer) + 1 entry is peeked and if DMA
is not done and if HP + 2 entry's DMA done is set,
replenish HP + 1 entry and start processing in next interrupt.
If HP + 2 entry's DMA done is not set, poll onto HP + 1 entry DMA
done to be set.

Also, during monitor attach HP points to the end of the ring and
TP(Tail Pointer) points to the start of the ring.
Using ath11k_hal_srng_src_peek() may result in processing invalid buffer
for the very first interrupt. Since, HW starts writing buffer from TP.

To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
calling ath11k_hal_srng_src_peek().

Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202303281719.CvnPkOiK-lkp@intel.com/
Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
v3:
  * Rebased on top of ToT
v2:
  * Fixed compilation warning Reported-by: kernel test robot <lkp@intel.com>

 drivers/net/wireless/ath/ath11k/dp_rx.c | 88 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal.c   | 14 ++++
 drivers/net/wireless/ath/ath11k/hal.h   |  2 +
 3 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index afd481f5858f..79b7f4996f5d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2990,11 +2990,52 @@ ath11k_dp_rx_mon_update_status_buf_state(struct ath11k_mon_data *pmon,
 	}
 }
 
+static enum dp_mon_status_buf_state
+ath11k_dp_rx_mon_handle_status_buf_done(struct ath11k_base *ab, struct hal_srng *srng,
+					struct dp_rxdma_ring *rx_ring)
+{
+	struct ath11k_skb_rxcb *rxcb;
+	struct hal_tlv_hdr *tlv;
+	struct sk_buff *skb;
+	void *status_desc;
+	dma_addr_t paddr;
+	u32 cookie;
+	int buf_id;
+	u8 rbm;
+
+	status_desc = ath11k_hal_srng_src_next_peek(ab, srng);
+	if (!status_desc)
+		return DP_MON_STATUS_NO_DMA;
+
+	ath11k_hal_rx_buf_addr_info_get(status_desc, &paddr, &cookie, &rbm);
+
+	buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
+
+	spin_lock_bh(&rx_ring->idr_lock);
+	skb = idr_find(&rx_ring->bufs_idr, buf_id);
+	spin_unlock_bh(&rx_ring->idr_lock);
+
+	if (!skb)
+		return DP_MON_STATUS_NO_DMA;
+
+	rxcb = ATH11K_SKB_RXCB(skb);
+	dma_sync_single_for_cpu(ab->dev, rxcb->paddr,
+				skb->len + skb_tailroom(skb),
+				DMA_FROM_DEVICE);
+
+	tlv = (struct hal_tlv_hdr *)skb->data;
+	if (FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl) != HAL_RX_STATUS_BUFFER_DONE)
+		return DP_MON_STATUS_NO_DMA;
+
+	return DP_MON_STATUS_REPLINISH;
+}
+
 static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 					     int *budget, struct sk_buff_head *skb_list)
 {
 	struct ath11k *ar;
 	const struct ath11k_hw_hal_params *hal_params;
+	enum dp_mon_status_buf_state reap_status;
 	struct ath11k_pdev_dp *dp;
 	struct dp_rxdma_ring *rx_ring;
 	struct ath11k_mon_data *pmon;
@@ -3022,8 +3063,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 	ath11k_hal_srng_access_begin(ab, srng);
 	while (*budget) {
 		*budget -= 1;
-		rx_mon_status_desc =
-			ath11k_hal_srng_src_peek(ab, srng);
+		rx_mon_status_desc = ath11k_hal_srng_src_peek(ab, srng);
 		if (!rx_mon_status_desc) {
 			pmon->buf_state = DP_MON_STATUS_REPLINISH;
 			break;
@@ -3057,15 +3097,43 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
 					    FIELD_GET(HAL_TLV_HDR_TAG,
 						      tlv->tl), buf_id);
-				/* If done status is missing, hold onto status
-				 * ring until status is done for this status
-				 * ring buffer.
-				 * Keep HP in mon_status_ring unchanged,
-				 * and break from here.
-				 * Check status for same buffer for next time
+				/* RxDMA status done bit might not be set even
+				 * though tp is moved by HW.
 				 */
-				pmon->buf_state = DP_MON_STATUS_NO_DMA;
-				break;
+
+				/* If done status is missing:
+				 * 1. As per MAC team's suggestion,
+				 *    when HP + 1 entry is peeked and if DMA
+				 *    is not done and if HP + 2 entry's DMA done
+				 *    is set. skip HP + 1 entry and
+				 *    start processing in next interrupt.
+				 * 2. If HP + 2 entry's DMA done is not set,
+				 *    poll onto HP + 1 entry DMA done to be set.
+				 *    Check status for same buffer for next time
+				 *    dp_rx_mon_status_srng_process
+				 */
+
+				reap_status = ath11k_dp_rx_mon_handle_status_buf_done(ab, srng,
+										      rx_ring);
+				if (reap_status == DP_MON_STATUS_NO_DMA) {
+					continue;
+				} else if (reap_status == DP_MON_STATUS_REPLINISH) {
+					ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
+						    FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl),
+						    buf_id);
+
+					spin_lock_bh(&rx_ring->idr_lock);
+					idr_remove(&rx_ring->bufs_idr, buf_id);
+					spin_unlock_bh(&rx_ring->idr_lock);
+
+					dma_unmap_single(ab->dev, rxcb->paddr,
+							 skb->len + skb_tailroom(skb),
+							 DMA_FROM_DEVICE);
+
+					dev_kfree_skb_any(skb);
+					pmon->buf_state = DP_MON_STATUS_REPLINISH;
+					goto move_next;
+				}
 			}
 
 			spin_lock_bh(&rx_ring->idr_lock);
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index f3d04568c221..dbba45c22dc6 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -796,6 +796,20 @@ u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *ab,
 	return desc;
 }
 
+u32 *ath11k_hal_srng_src_next_peek(struct ath11k_base *ab, struct hal_srng *srng)
+{
+	u32 next_hp;
+
+	lockdep_assert_held(&srng->lock);
+
+	next_hp = (srng->u.src_ring.hp + srng->entry_size) % srng->ring_size;
+
+	if (next_hp != srng->u.src_ring.cached_tp)
+		return srng->ring_base_vaddr + next_hp;
+
+	return NULL;
+}
+
 u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index e453c137385e..dc8bbe073017 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -947,6 +947,8 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
 int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
 u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);
+u32 *ath11k_hal_srng_src_next_peek(struct ath11k_base *ab,
+				   struct hal_srng *srng);
 u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *ab,
 					 struct hal_srng *srng);
 u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *ab,

base-commit: bf99bc7423e18aa3475ef00a7a6fb773c31ce6df
-- 
2.34.1


