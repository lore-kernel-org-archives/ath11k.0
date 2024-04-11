Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6631CD1292
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqJnbKVTkzG+zwVIa3D2U6T2jnCygw6KV5zYONdQefg=; b=AiNBYf16ynp2r+mNyuy9gzzc6B
	UVmEXk1adqPNdVPL5AdzXFOlAh4wi9Wbp4L19Gdc1LY8YVe3QDKaeC2ngNQjKqGQTtBePl3RHUzkn
	sme9B/1ewj0rItXGwHzr0cOx3rNPsuVK+3YB5+3YJFIfsn3/Zji98uANiuim816DG/3PXdShf2Hx0
	KAmzQn5yQrE9WbYmMI5wyzRy3iT5436Ho5+ktuV898s5vgX/q+C4yZzpZXp1X/KDJNW5PvBtOC+PO
	ot5UNQm/2K1wFmApZTbIdKjpzRvBhP0V5dW3Pm8b+RTwPXhbswIcMy58fkfk8ANWF9Slybg4Iuggf
	Xxn6+RKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupAd-0000000Awfy-1H8n;
	Thu, 11 Apr 2024 07:48:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupAZ-0000000Aweb-1gA5
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 07:48:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B6GV9v016204;
	Thu, 11 Apr 2024 07:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=QqJnbKV
	TkzG+zwVIa3D2U6T2jnCygw6KV5zYONdQefg=; b=NSJ1o8FxcMjoZNQXif/I+8o
	mIpkF1ygJfori3xt797oO2XIZO8GdBXs/wC6AWLxjxJUT9lUgdqWu3BecCiU6g54
	2nWx/ncOMeq5UVucXeIxCtmyIheJqM4llwN9K/LoqJI2KmYdI794FUBO9wpxWt4a
	T40G36mCeV6BjRtt5W173aTfObJmEGswIP/rHfUA+OeveKX0enJKSBJdOjGFgVhe
	kQLvNq0kMGjAPB/QYudcz20f6G6fGRb1XIQ7p0/N4NNSiL7YDmcFlE6hiNmpcnh/
	5TGERSGCY7aQE1j/GDot90DGvmPNpOf80wvCX5Y13P5uzY4iSjUb0wV89bexbjQ=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe9js8pj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 07:48:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43B7mNMh028401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 07:48:23 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 00:48:22 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH RFT] wifi: ath11k: add log to debug CE ring post buf failure
Date: Thu, 11 Apr 2024 15:48:12 +0800
Message-ID: <20240411074812.86700-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kLonlOTKtN2Zk0EOHNM3H7eYnLak8pMg
X-Proofpoint-GUID: kLonlOTKtN2Zk0EOHNM3H7eYnLak8pMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004827_605496_B00E530D 
X-CRM114-Status: GOOD (  19.14  )
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

There is a report from community that ath11k fails to enqueue
rx bufs some times. Although running tests for nearly 10 days
I failed to reproduce this issue. Considering that the reporter
seems not that hard to hit this issue I'd like to submit this
patch to public so that the reporter could merge it and get us
more logs.

This patch does not contain any functional changes but only
logs added.

Link: https://lore.kernel.org/ath11k/e458216d-b389-4abd-a9b2-90525ea10a8d@gmail.com/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c  |  6 +++
 drivers/net/wireless/ath/ath11k/hal.c | 73 +++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..f9405cad73b0 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -290,12 +290,14 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 	ath11k_hal_srng_access_begin(ab, srng);
 
 	if (unlikely(ath11k_hal_srng_src_num_free(ab, srng, false) < 1)) {
+		ath11k_warn(ab, "srng is full\n");
 		ret = -ENOSPC;
 		goto exit;
 	}
 
 	desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
 	if (!desc) {
+		ath11k_warn(ab, "srng get next entry failed\n");
 		ret = -ENOSPC;
 		goto exit;
 	}
@@ -307,6 +309,7 @@ static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 	ring->write_index = write_index;
 
 	pipe->rx_buf_needed--;
+	ath11k_info(ab, "%s: pipe %u rx_buf_needed %u\n", __func__, pipe->pipe_num,  pipe->rx_buf_needed);
 
 	ret = 0;
 exit:
@@ -389,12 +392,14 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 
 	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
 	if (!desc) {
+		ath11k_warn(ab, "dst get next entry failed\n");
 		ret = -EIO;
 		goto err;
 	}
 
 	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
 	if (*nbytes == 0) {
+		ath11k_warn(ab, "dst status get length failed\n");
 		ret = -EIO;
 		goto err;
 	}
@@ -406,6 +411,7 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 	pipe->dest_ring->sw_index = sw_index;
 
 	pipe->rx_buf_needed++;
+	ath11k_info(ab, "%s: pipe %u rx_buf_needed %u\n", __func__, pipe->pipe_num,  pipe->rx_buf_needed);
 err:
 	ath11k_hal_srng_access_end(ab, srng);
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index f3d04568c221..ad5492c8d1aa 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -9,6 +9,10 @@
 #include "hal_desc.h"
 #include "hif.h"
 
+
+#define DUMP_SRNG_ID_MIN HAL_SRNG_RING_ID_CE0_SRC
+#define DUMP_SRNG_ID_MAX HAL_SRNG_RING_ID_CE11_DST_STATUS
+
 static const struct hal_srng_config hw_srng_config_template[] = {
 	/* TODO: max_rings can populated by querying HW capabilities */
 	{ /* REO_DST */
@@ -663,8 +667,13 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 
 	lockdep_assert_held(&srng->lock);
 
-	if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
+	if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp) {
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+			ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u is empty, cached hp %u, tp %u\n", __func__, srng->ring_id,
+										srng->u.dst_ring.cached_hp,
+										srng->u.dst_ring.tp);
 		return NULL;
+	}
 
 	desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
 
@@ -674,6 +683,10 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 	if (srng->u.dst_ring.tp == srng->ring_size)
 		srng->u.dst_ring.tp = 0;
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+		ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u, cached hp %u, tp %u\n", __func__, srng->ring_id,
+										srng->u.dst_ring.cached_hp,
+										srng->u.dst_ring.tp);
 	/* Try to prefetch the next descriptor in the ring */
 	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
 		ath11k_hal_srng_prefetch_desc(ab, srng);
@@ -697,6 +710,9 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 		hp = srng->u.dst_ring.cached_hp;
 	}
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u, hp %u, tp %u\n", __func__, srng->ring_id, hp, tp);
+
 	if (hp >= tp)
 		return (hp - tp) / srng->entry_size;
 	else
@@ -720,6 +736,9 @@ int ath11k_hal_srng_src_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 		tp = srng->u.src_ring.cached_tp;
 	}
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, hp %u, tp %u\n", __func__, srng->ring_id, hp, tp);
+
 	if (tp > hp)
 		return ((tp - hp) / srng->entry_size) - 1;
 	else
@@ -742,8 +761,11 @@ u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
 	 */
 	next_hp = (srng->u.src_ring.hp + srng->entry_size) % srng->ring_size;
 
-	if (next_hp == srng->u.src_ring.cached_tp)
+	if (next_hp == srng->u.src_ring.cached_tp) {
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                        ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, hal ring is full, next_hp %u\n", __func__, srng->ring_id, next_hp);
 		return NULL;
+	}
 
 	desc = srng->ring_base_vaddr + srng->u.src_ring.hp;
 	srng->u.src_ring.hp = next_hp;
@@ -756,6 +778,9 @@ u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
 	 */
 	srng->u.src_ring.reap_hp = next_hp;
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, hp %u, reap_hp %u\n", __func__, srng->ring_id, srng->u.src_ring.hp, srng->u.src_ring.reap_hp);
+
 	return desc;
 }
 
@@ -770,12 +795,18 @@ u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *ab,
 	next_reap_hp = (srng->u.src_ring.reap_hp + srng->entry_size) %
 		       srng->ring_size;
 
-	if (next_reap_hp == srng->u.src_ring.cached_tp)
+	if (next_reap_hp == srng->u.src_ring.cached_tp) {
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+			ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u is empty, cached_tp %u\n", __func__, srng->ring_id, srng->u.src_ring.cached_tp);
 		return NULL;
+	}
 
 	desc = srng->ring_base_vaddr + next_reap_hp;
 	srng->u.src_ring.reap_hp = next_reap_hp;
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+		ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, reap_hp %u\n", __func__, srng->ring_id, srng->u.src_ring.reap_hp);
+
 	return desc;
 }
 
@@ -786,13 +817,23 @@ u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *ab,
 
 	lockdep_assert_held(&srng->lock);
 
-	if (srng->u.src_ring.hp == srng->u.src_ring.reap_hp)
+	if (srng->u.src_ring.hp == srng->u.src_ring.reap_hp) {
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+			ath11k_warn(ab, "SRNG-DEBUG: %s: SRC srng id %u is full, hp %u, reap_hp %u\n", __func__, srng->ring_id, srng->u.src_ring.hp, srng->u.src_ring.reap_hp);
+
 		return NULL;
+	}
 
 	desc = srng->ring_base_vaddr + srng->u.src_ring.hp;
 	srng->u.src_ring.hp = (srng->u.src_ring.hp + srng->entry_size) %
 			      srng->ring_size;
 
+	if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+		ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, hp %u, entry_size %u, ring_size %u\n", __func__, srng->ring_id,
+				srng->u.src_ring.hp,
+				srng->entry_size,
+				srng->ring_size);
+
 	return desc;
 }
 
@@ -814,8 +855,12 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+			ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, cached_tp %u\n", __func__, srng->ring_id, srng->u.src_ring.cached_tp);
 	} else {
 		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
+		if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+			ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u, cached_hp %u\n", __func__, srng->ring_id, srng->u.dst_ring.cached_hp);
 
 		/* Try to prefetch the next descriptor in the ring */
 		if (srng->flags & HAL_SRNG_FLAGS_CACHED)
@@ -839,9 +884,19 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
 			srng->u.src_ring.last_tp =
 				*(volatile u32 *)srng->u.src_ring.tp_addr;
 			*srng->u.src_ring.hp_addr = srng->u.src_ring.hp;
+			if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+				ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, last_tp %u, hp %u, hw hp %u\n", __func__, srng->ring_id,
+						srng->u.src_ring.last_tp,
+						srng->u.src_ring.hp,
+						*srng->u.src_ring.hp_addr);
 		} else {
 			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
 			*srng->u.dst_ring.tp_addr = srng->u.dst_ring.tp;
+			if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+				ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u, last_hp %u, tp %u, hw tp %u\n", __func__, srng->ring_id,
+						srng->u.dst_ring.last_hp,
+						srng->u.dst_ring.tp,
+						*srng->u.dst_ring.tp_addr);
 		}
 	} else {
 		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
@@ -851,12 +906,22 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
 					   (unsigned long)srng->u.src_ring.hp_addr -
 					   (unsigned long)ab->mem,
 					   srng->u.src_ring.hp);
+			if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                                ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: SRC srng id %u, last_tp %u, hp %u, hw hp %u\n", __func__, srng->ring_id,
+						srng->u.src_ring.last_tp,
+						srng->u.src_ring.hp,
+						ath11k_hif_read32(ab, (unsigned long)srng->u.src_ring.hp_addr - (unsigned long)ab->mem));
 		} else {
 			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
 			ath11k_hif_write32(ab,
 					   (unsigned long)srng->u.dst_ring.tp_addr -
 					   (unsigned long)ab->mem,
 					   srng->u.dst_ring.tp);
+			if (DUMP_SRNG_ID_MIN <= srng->ring_id && srng->ring_id <= DUMP_SRNG_ID_MAX)
+                                ath11k_dbg(ab, ATH11K_DBG_HAL, "SRNG-DEBUG: %s: DST srng id %u, last_hp %u, tp %u, hw tp %u\n", __func__, srng->ring_id,
+						srng->u.dst_ring.last_hp,
+						srng->u.dst_ring.tp,
+						ath11k_hif_read32(ab, (unsigned long)srng->u.dst_ring.tp_addr - (unsigned long)ab->mem));
 		}
 	}
 

base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.25.1


