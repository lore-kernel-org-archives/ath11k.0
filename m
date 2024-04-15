Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9949DC4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6eSL9AbemWWH5HHmLNd9+N8gZj7u/Hg1vi/mWHhr7o=; b=0giyzJZOFjg5T28In8eNgYxVF9
	YxqDmyTSXNonI3z4QlNkaY9t9DxUQtrE8KGKDL0DaDFCS+eUmtsjdE26UsUbvrHl+EqK2a8o9Z4Au
	SCujRNrKQY8ugTc7g1OOqoD1VS9pF1K6YjJ1quMtFpKd+6qkkqV/ntenDHXMgJBS67jlDKE3pTQVa
	5jWI8HWA59UvJqIk1O/+vIfNcVzsfzSZAW/2X62P3Njhr0WOu0W+iCAiomji8VnohzAu5K1yhrkNx
	yzVdo7hVg+h+cZjVTVy2OKe9r5U6wQKP5nWDonNacKTJK76av0aJaRRopb8z2SocntNIO5eFlodv7
	J5LCPxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSup-00000009pGC-3PdO;
	Mon, 15 Apr 2024 20:26:59 +0000
Received: from smtp-68.smtpout.orange.fr ([80.12.242.68] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSug-00000009pEe-3R6U
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 20:26:53 +0000
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id wSuarbPSmGdLLwSuar5one; Mon, 15 Apr 2024 22:26:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713212805;
	bh=D6eSL9AbemWWH5HHmLNd9+N8gZj7u/Hg1vi/mWHhr7o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=k1mUfXcylQ5lbkfSJPUOF7WwKpk0Ekoys2XugPd1Ac7PjqNQCngJGGJFf2yi0v70+
	 jR8KC7DcQg6BmOXgaAt8PL4HAyc5RWyA8/2teKMq6CHrviozSk3VuPZRQzSYmNwIEZ
	 5rY/JJhivs+Snq20TYUw0qRCxXpLJhgEZkcU4x7wt26+VrMQEM9EP4T8I4B8fl+BSm
	 f2UZ0zis6wAhaJmIdjfj83qDxvq5GgrJSg37A5GGSwwWBVBCoEMccVfM99Cc1gKn8A
	 HDzEOcEJU+BTAPX3GQzS6ByPYU56f6uz6Th8aic2MfE7vwohGwHB9Qmfxa8FNwp9IN
	 u2n1ZGiwTO5fQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Apr 2024 22:26:45 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH v2] wifi: ath11k: Fix error handling in ath11k_wmi_p2p_noa_event()
Date: Mon, 15 Apr 2024 22:26:41 +0200
Message-ID: <07f1fc75b2d5b4173ae1b7bb1da5be7f6fc608c8.1713212781.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_132651_290660_5B8CAE0A 
X-CRM114-Status: GOOD (  11.17  )
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

if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS), there is a mix of
return and goto. In such a case, 'td' should be freed to avoid a memory
leak.

While at it, change ath11k_wmi_p2p_noa_event() to return void.
'0' was returned in all cases, even in case of error and the only caller
does not handle the return value.
This is also more consistent with most of functions called from
ath11k_wmi_tlv_op_rx().

Fixes: 2408379f15a1 ("wifi: ath11k: implement handling of P2P NoA event")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in V2
   - Change ath11k_wmi_p2p_noa_event() to return void.   [Jeff Johnson]
   - Update commit message accordingly

V1: https://lore.kernel.org/all/6ee80f65f736db1646f6f201f60816cf35b6f3fe.1713180046.git.christophe.jaillet@wanadoo.fr/
---
 drivers/net/wireless/ath/ath11k/wmi.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c74aa3f95658..e9ae305a8a61 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8650,30 +8650,27 @@ static void ath11k_wmi_gtk_offload_status_event(struct ath11k_base *ab,
 	kfree(tb);
 }
 
-static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
-				    struct sk_buff *skb)
+static void ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
+				     struct sk_buff *skb)
 {
 	const void **tb;
 	const struct wmi_p2p_noa_event *ev;
 	const struct ath11k_wmi_p2p_noa_info *noa;
 	struct ath11k *ar;
-	int ret, vdev_id;
+	int vdev_id;
 	u8 noa_descriptors;
 
 	tb = ath11k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
 	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return ret;
+		ath11k_warn(ab, "failed to parse tlv: %ld\n", PTR_ERR(tb));
+		return;
 	}
 
 	ev = tb[WMI_TAG_P2P_NOA_EVENT];
 	noa = tb[WMI_TAG_P2P_NOA_INFO];
 
-	if (!ev || !noa) {
-		ret = -EPROTO;
+	if (!ev || !noa)
 		goto out;
-	}
 
 	vdev_id = ev->vdev_id;
 	noa_descriptors = u32_get_bits(noa->noa_attr,
@@ -8682,7 +8679,6 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS) {
 		ath11k_warn(ab, "invalid descriptor num %d in P2P NoA event\n",
 			    noa_descriptors);
-		return -EINVAL;
 		goto out;
 	}
 
@@ -8695,7 +8691,6 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id %d in P2P NoA event\n",
 			    vdev_id);
-		ret = -EINVAL;
 		goto unlock;
 	}
 
@@ -8705,7 +8700,6 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	rcu_read_unlock();
 out:
 	kfree(tb);
-	return 0;
 }
 
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
-- 
2.44.0


