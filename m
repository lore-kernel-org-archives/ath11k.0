Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB13C04A95
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYUlqrSyDKO1WPn8/1FRd57dMLP+n3KFJyJPoN006Mo=; b=X/aXLqT9zuVrCv
	fttY7a6x9Fu1Gi3jpjw3R3swH2U2gseU2rETKUi1CCrxh2mydlnKRUK2EnTrHsz9nVvXK6sARgnIG
	MOQwuuiq/KRmJ1nq4UdHP6d43h6HvTe6CrZTTopH6+u3VnjHvxOzrWxT7Rh6HRDhsvaYFGhr7nyxz
	2dowW9OztynxcWDj/4Z9F5Xxs3iWDbLT8senRTS/ddUmd7FtiN9zcaJWm/oL+u+Wn5GU156LHet7h
	jx34atNb7TTKVmdGdnPQvXHOqdkuLI6b979evImbsV7ERKa+A2gPmqyYekm5D0gFWjViUUZcRd4gv
	CRASFd5afaD5dixyLuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeZ-008Hwb-0V;
	Fri, 10 Nov 2023 10:22:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeV-008Ht4-31
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 10:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 92946B81A6A
	for <ath11k@lists.infradead.org>; Fri, 10 Nov 2023 10:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340EAC433C7;
	Fri, 10 Nov 2023 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611734;
	bh=s8f7ejt6/6A/AIKa6sJs8NlXnpAnYLCNcVR7yofQBJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWxDiZoqvEUMJIGCjpia9hNLEYYeM7aF+jdw4GLLMl+osG9gI4Q3jz2oHIOJmS/XF
	 Xp7enBMvYSeCIHF+uy2nU4QLzycIpA34EJbHV/uPiortko0WsVU64uIza624ZIa7En
	 hbcFcvtUbZW17dpg8CAbMytZXk4u/df7Kfr1iyFwSwCtWNSIvOEfp3DzK5EMdyLSvc
	 lgz1dSxLCKVDx5NzZ9xIgpG4ExjmdZgY7SYyNo7wSNij3/TK9pYpYONp0iDxZMrlvV
	 9bVbceVp6N6ok+5Rj6jv0/6sIi29ZYZxGY1/G7k5s+48qILF9sLa4YiesA3VvIJ3Yd
	 Xp5eRN7uKQheg==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 7/8] wifi: ath11k: thermal: don't try to register multiple times
Date: Fri, 10 Nov 2023 12:22:01 +0200
Message-Id: <20231110102202.3168243-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022216_117937_7CE8BAA4 
X-CRM114-Status: GOOD (  10.71  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Every time the firmware boots we call ath11k_core_qmi_firmware_ready() which
ends up calling ath11k_thermal_register(). So we try to register thermal
devices multiple times. And when we power off the firmware during
suspend/hibernation (implemented in the next patch) we get a warning in resume:

hwmon hwmon4: PM: parent phy0 should not be sleeping

Workaround this similarly like ath11k_mac_register() does by testing
ATH11K_FLAG_REGISTERED.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/thermal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index c9b012f97ba5..80abf472fb87 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -162,6 +162,9 @@ int ath11k_thermal_register(struct ath11k_base *ab)
 	struct ath11k_pdev *pdev;
 	int i, ret;
 
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
