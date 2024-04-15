Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BC1C4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ub4eBCk8TBPNCwE8W3RDmCm3hBSXAehuhbWgGV6jTnI=; b=EpJQxFJi9vNsVMcff1WSJcohL+
	gNjSAL46YoAUL03fNFqs1WIWArNLUZDKv//522PcUBx31/HgUyJyJo6+K6J6r5P8KlX6SNBIUvjPF
	KVOKG1MXlhjGzTPSDz+NdtBpvL8mHIZjv++GBx5u9J1gFB0uAXwi/PVLxL4LcY/b6lYQsHB8eTknl
	rVlrSGWhSMfsiAcQ/jyHJoQwth7jQv4oppUtcXZdw8XX9vsAFbc/2x0bsRw/9S0CQ8dLPMDDS9Rf+
	WCfnOtcFrN+78EuZi3Teja1CVy2cCs168WfYXI/GObxDWpbRJYJTFBITxALuLg79TfqI+rts90p49
	pdCT/gSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKRt-000000081qP-2OVR;
	Mon, 15 Apr 2024 11:24:33 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKRp-000000081pl-0zdc
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 11:24:31 +0000
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id wKRerx2nqPlGBwKReriKR4; Mon, 15 Apr 2024 13:24:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713180261;
	bh=ub4eBCk8TBPNCwE8W3RDmCm3hBSXAehuhbWgGV6jTnI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kSRxP7JX6jTcA8/uJSqnnk9ne7reFCXZZm1Mfa5+Xnymb251WK/qMJ6mCXM9NBsn4
	 h8pZelhfJFAdPZwqeY+ljhvdmwxFyoBVtL09gzURZKmnIzfKrqvKydE+qI6ljA2DW1
	 hkberrIoc28ydprnSygtlOyFW8Zk86A3eiWvOiya7U78rTsujl2rJAIRFnCNR9kaPF
	 4BEe5wSLNgcZi2boq5I+tRauo96eqol87XDwHFJA/nAO1lN1L/k7lNPTpdDlAYMufm
	 rH6evc+nXnSneuk+sHFlFzAG1DZMkIqPc+VA0E+JJr8vw/d+ATIiCQGJ9Ed8NZyPZZ
	 tFRYenYaUgZ0g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Apr 2024 13:24:21 +0200
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
Subject: [PATCH] wifi: ath11k: Fix error handling in ath11k_wmi_p2p_noa_event()
Date: Mon, 15 Apr 2024 13:23:46 +0200
Message-ID: <6ee80f65f736db1646f6f201f60816cf35b6f3fe.1713180046.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_042429_728217_1DD051DE 
X-CRM114-Status: GOOD (  11.21  )
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
return and goto. in such a case, 'ret' should be assigned an error code and
the 'td' should be freed to avoid a memory leak.

While at it, return 'ret' instead of 0 in case of error.
This is actually harmless, because the only caller does not handle the
return value.

Fixes: 2408379f15a1 ("wifi: ath11k: implement handling of P2P NoA event")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c74aa3f95658..589a1b5ec517 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8657,7 +8657,7 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	const struct wmi_p2p_noa_event *ev;
 	const struct ath11k_wmi_p2p_noa_info *noa;
 	struct ath11k *ar;
-	int ret, vdev_id;
+	int ret = 0, vdev_id;
 	u8 noa_descriptors;
 
 	tb = ath11k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
@@ -8682,7 +8682,7 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS) {
 		ath11k_warn(ab, "invalid descriptor num %d in P2P NoA event\n",
 			    noa_descriptors);
-		return -EINVAL;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -8705,7 +8705,7 @@ static int ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	rcu_read_unlock();
 out:
 	kfree(tb);
-	return 0;
+	return ret;
 }
 
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
-- 
2.44.0


