Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07617CDB485
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b/8SwejChr4po0eg97VsMP/MCXeVqpvdVJxD3G2ZeI=; b=e2WeYNKgze3lhD
	5GKV/2wLnOJ/29lQtFttLCxcKlFDkHQXU0ayB293lBZnuMmphKMWfKxnhdCnThuOudzNLyxIwiVvw
	noAablWruNdfVCLluuhy2lqN4ip7pt9lnUNvhdNv7kldNwJ7t1uwx5yY87x2zYG92wwVd62tgUZoE
	kUepaQRDofvRwH2mVK1/rplp/xZYIyaS5fXRbB+04PXeQ9xBXRTlWVibU9NL8RfG4qrpetmaTebkq
	4NQiSiA7ICS2rECMCEl4gNxWMhERcuLhRVQJ7ilzWSKTE7On/CNvH7XKZv4VynWIotwcvFvSQX1Gh
	fHz4zgVinXyiW5h6fbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUk-00H3sr-13;
	Thu, 19 Oct 2023 10:43:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUh-00H3q8-1Q
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 10:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C8BC60202;
	Thu, 19 Oct 2023 10:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884ACC433C8;
	Thu, 19 Oct 2023 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697712189;
	bh=bGk+4LmRzRI6lwAbSKEMT39TnxGgAAFFjrhmhW3xrro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAecKhu+hG817Li21uY8l32nbJ1oD/JPcV29vaPD/plORVB9Upv0fIAlo5jn2ghRQ
	 7kRtp2FseT4nHnjRjftXJm7f/g3TH1pXZB2pqVhk7H59Kp9oIXcMvUtuehqU9oZ/hQ
	 IDXrzH0gwEIQT+LzQ17XqBJR2RmwI0JHm9plclmyIOXg4aQzV/Lkp3VRGSBPLbGKV7
	 +7jfs0qsHX8Sx1C2Pt7wv9Ed9df2Pbx4APa9MKgNCrz690jGv1I+8QNcQCiNmJg3Dv
	 L6mwxvRs0FTPH3+QYJ/NbA8/jL1ix/cVw/+BjGL3MFG0CLE1nrKI52ziXmgmz0LMJ8
	 KRAMhHg6HwkMQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtQUi-0003am-2F;
	Thu, 19 Oct 2023 12:43:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath11k: fix temperature event locking
Date: Thu, 19 Oct 2023 12:42:10 +0200
Message-ID: <20231019104211.13769-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019104211.13769-1-johan+linaro@kernel.org>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_034311_542339_2577A48D 
X-CRM114-Status: UNSURE (   8.34  )
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

The ath11k active pdevs are protected by RCU but the temperature event
handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
read-side critical section as reported by RCU lockdep:

	=============================
	WARNING: suspicious RCU usage
	6.6.0-rc6 #7 Not tainted
	-----------------------------
	drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!

	other info that might help us debug this:

	rcu_scheduler_active = 2, debug_locks = 1
	no locks held by swapper/0/0.
	...
	Call trace:
	...
	 lockdep_rcu_suspicious+0x16c/0x22c
	 ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
	 ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
	 ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
Cc: stable@vger.kernel.org      # 5.7
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 23ad6825e5be..980ff588325d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8383,6 +8383,8 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event pdev temperature ev temp %d pdev_id %d\n",
 		   ev->temp, ev->pdev_id);
 
+	rcu_read_lock();
+
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
@@ -8392,6 +8394,8 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 
 	ath11k_thermal_event_temperature(ar, ev->temp);
 
+	rcu_read_unlock();
+
 	kfree(tb);
 }
 
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
