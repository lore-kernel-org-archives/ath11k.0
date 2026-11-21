Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E98606A6AA
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UVVBdEH8;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bBY7ndsx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=; b=UVVBdEH8SmIT8B
	2l7XCUu6+IbRpnQ5TOqhSJ+vWy1SgT1j218TYWZIQaaTwmSbjIHkvlPLBiUABehEW+yV8XXLAVZKM
	HjBnlA52If5zXARwzqZTLVzQ8CQMCx2fl55FXmn570Rht09EbkTQEh6FR6NgUyDWgT6UlqnnppZM6
	nMooPsRU1O1aVCEiBHZmamrATmtl9g3CaW/7RvmKFS++0LBdouVinme+mBeSyYHWV6oEJAzH3jDCz
	c6FjnYUVn+S3hVdrbwo2joJrKabBAUWsHygukjihct4rg8zrX/c/MmX1kbBY9TWLuSRy2lzBZb1l4
	oEr8QBmGgOtedjIhmtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBJ-00000000Ryq-0OIl;
	Sat, 21 Nov 2026 23:07:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBF-00000000Rxd-2Gwp
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c50e26763a4so388133766b.1
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302455; x=1795907255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=bBY7ndsxXv8fn6Ikilzkz9nnYkOtIsDENFCIoEZzwo0+NHS0LHqH3JepmjClx380mB
         orRrN3V/F9vgq5MOxHcn9aQ7cqnqS98pE+NXpWtCmEEgw3lJJEWEbiiQhYEzCpjF1fPw
         kzsi6c6C36xkY2Ouji/TadYm4I3xMwNs7THyl8XwOdArS1JQXqlOjlxabMLZxgbpNsy/
         oKquG32qGXdfE+j6P39+9kQetgc3CcE8aYvLfnSATARG4c4LSm1iiBL+OWkqOr1FfU+o
         XJCPiaD3ldJj0FsAmEnUiL/gQ2+UqKe2NkJiNz3eQsKW38cusDLYDffqx76QJnqhCKq0
         hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302455; x=1795907255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=PKzdXR4DkjsJgvzBHylsMoakyAmighZipfc3712Sx8l9/bYGqebgxcktPNv0R5ADdm
         cWvwOYDTTiAKhwXbrsTiOfDXu/mEMN6a5Q0NWIminYNgkoUskndsEDVd/upLkGsDX7Lv
         JcTnPI1UisJhiXdxKShD7y0yvs3d3PSk6ehQBSvg/fXTlrnGAsJkfnOJgB3GZQENCt1S
         3ebNT5aYP0YGRYwqW3DuGdyb+w6jvRWjVZtmzAqZyI+Qm7Oq0AtAEMKMgCqk4BjjEVdl
         Bm9j0Cl1WkzAqZl0241ir6vOLdO9OSD0n9YkcaDCJdIFBDn4N/qQK62LBPhRBUQ7rBCj
         rAXQ==
X-Gm-Message-State: APuU4Z9Pm1O3tErMM64E+TrhK4oqUsFqvGRnySuubtMI15szVe5zn1G/
	6ZHn/6GbfaRxlinnhcZBhP7gguD7UJicl0FCV0rKnJgw5Gd6ld0a9+7xxhjpeVZG6w==
X-Gm-Gg: AZFdTZchzw2lfr3XFQlw74a/4CbjGGdPulRe2Ly0+H5/fghCddVaI7PM5M5gBwrTkgv
	pJ461zYH4mIaBHGQjtcHehOO/cK3pPVYZI+TDMzKwlluUAPQb8+4HFJ2tXleRfha5G/EczXcHDa
	+2E/4IOgA0F2Drl5miL3RyFj7pcZZ5S/d4Kp8vaBbotVWcF446mIjV4QGGabWv5ijIpc1SXnOgf
	X5KtBzHyfVREZly7Shat/G9PQlzBSmWUWV27B8x9Af0f+PIlyeW/3NwY/1b+xhynG3Dt1OHQZHp
	mXvBRlKNwWFyYSycOOV/o3QykDIK6XSwjikalWtbOkKfF8CRmAe8Zl288BQilEJjVf0LCAOPGpC
	2pkueNpiCnD1Rpi3ZYIerTtdlIL49Ygg/QlRaDbPQglQg5PVeXdwhh3I+q0Cmv6HfJFQT701igf
	6MAKwqdvcL3sfgZuvDEyKsrX1qMJ6a3GcOMstsnIx1fhvOzbFGidOzrLVNlmcXm8vK10lAAHtCS
	Sd4Ut1/KsqWwmV3sOJ77/heYXC+SIDP0VpofmGqdwKSCD6fn7PMUtSFUb3akF3Agoe4TW9feiwr
	Z5bl7l+H6CaoXepCbYNxBZB8f2vdnHHmgnWy3VSmcWBY3vNNYeORLTs4J2EYxhwAMULIyPNRUkh
	RWEJdN5GoQ8DLjK8EkretDCzUPwlzDsvJtgp63mygJ3Bc6ZmaQz8/ODEIXZfRFHDM8i6cXVEwWF
	ZkgYjUHtB1OuVGx1DqLEjgaU8jXoPlBvN3BnFVDyvA/U9HchNJyKX/NSmAuD/vfd66izrqce/tJ
	niMeW95JlZZgNPlZCPB2kRG+Iuap/GnhgNQZowXM3AarXL3w0RJGzgN6ImPyaxmUaZ9WNKmXiMm
	DMvssBZV0vrHHc/5BsMS2CjeUVffKcjTdtapAVKjRNhVLA1bQI4Z/AbBhjOni/kCgkb1Rbiy5Ik
	=
X-Received: by 2002:a17:907:d406:b0:c41:8e21:4d5a with SMTP id a640c23a62f3a-c513a47e37fmr603561966b.5.1795302455657;
        Sat, 21 Nov 2026 15:07:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 01/13] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Sun, 22 Nov 2026 00:07:19 +0100
Message-ID: <20261121230731.1206043-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150737_610015_F76941F9 
X-CRM114-Status: GOOD (  12.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Firmware crash recovery reinitialises tx_ce_desc_wq in
ath11k_connect_pdev_htc_service(), reached through ath11k_core_start()
and ath11k_wmi_connect(), while a WMI command on a device without credit
flow can still sleep on it in ath11k_wmi_cmd_send(). finish_wait() then
unlinks the waiter from the reset list head:

  list_del corruption. prev->next should be ffffffc084293648, but was
  ffffff80075109a8. (prev=ffffff80075109a8)
  WARNING: CPU: 2 PID: 1782 at lib/list_debug.c:62
  __list_del_entry_valid_or_report+0x134/0x174
  CPU: 2 UID: 101 PID: 1782 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x134/0x174 (P)
   finish_wait+0x68/0xb8
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf6c [ath11k]
   drv_link_info_changed+0x128/0x180 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1bc/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x328 [cfg80211]

Initialise the queues once in ath11k_core_alloc().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Tested-by: Florian Maurer <fmaurer@disroot.org> # IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146 (backport to 6.18)
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: no change.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..8e4dab61a300 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2743,6 +2743,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2769,6 +2770,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
 	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
+
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df481cb..5f2412982229 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9102,7 +9102,6 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
-- 
2.53.0


