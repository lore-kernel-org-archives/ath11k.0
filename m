Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34702C04A6A
	for <ath11k@archiver.kernel.org>; Fri, 11 Aug 2023 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U9nUO/Ap/glqAL41s9wx5rLOVnIuRn7dpGAN9H/MRG0=; b=49wyZKzHBJx59X
	PlUclfJR12UCf+JRvSG4e8g/+tUMYKAZD5m18oDjlnl5bS7z9lYa/npipa9104QeL31GbsbrmKOvh
	Kr7ZQSDXDelnJCQtWYZTx112VwbktDqt0jBh2z1NamCMtdz5W7GLDUUhcxGmFd1YX6o36HTtyzGn/
	fUzdN8V3JTTs2A7J9toV5pZO0+ndQDPOWLh9xzJE10Wapnz29UpCazcKEwb3aamR6/frPwKunGDIt
	duj8pMLV6McOU+cur0q77ZLvfc3z7bYrMk8hgij69Vf6x0VvD0H6qtRasNW+OSpBwrEkJ/hstuitt
	M0Q/NFmf7ZgxKD/GBMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPdC-00AJSr-06;
	Fri, 11 Aug 2023 10:44:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPd9-00AJPl-0Q
	for ath11k@lists.infradead.org;
	Fri, 11 Aug 2023 10:44:33 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMgP02yHdzrSXT;
	Fri, 11 Aug 2023 18:43:00 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 18:44:14 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
	<quic_srirrama@quicinc.com>, <yuehaibing@huawei.com>,
	<quic_mpubbise@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Remove unused declarations
Date: Fri, 11 Aug 2023 18:44:13 +0800
Message-ID: <20230811104413.33668-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_034431_375519_97B41201 
X-CRM114-Status: UNSURE (   6.46  )
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

Commit 2c3960c2253d ("ath11k: setup ce tasklet for control path")
declared but never implemented ath11k_ce_map_service_to_pipe().
Commit e3396b8bddd2 ("ath11k: ce: support different CE configurations")
declared but never implemented ath11k_ce_attr_attach().
Commit d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
declared but never implemented ath11k_qmi_event_work()/ath11k_qmi_msg_recv_work().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath11k/ce.h  | 3 ---
 drivers/net/wireless/ath/ath11k/qmi.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 1fc6360e7f01..c0f6a0ba86df 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -203,9 +203,6 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab);
 void ath11k_ce_free_pipes(struct ath11k_base *ab);
 int ath11k_ce_get_attr_flags(struct ath11k_base *ab, int ce_id);
 void ath11k_ce_poll_send_completed(struct ath11k_base *ab, u8 pipe_id);
-int ath11k_ce_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,
-				  u8 *ul_pipe, u8 *dl_pipe);
-int ath11k_ce_attr_attach(struct ath11k_base *ab);
 void ath11k_ce_get_shadow_config(struct ath11k_base *ab,
 				 u32 **shadow_cfg, u32 *shadow_cfg_len);
 void ath11k_ce_stop_shadow_timers(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index b0407abf90cd..d477e2be814b 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -514,8 +514,6 @@ struct qmi_wlanfw_wlan_ini_resp_msg_v01 {
 int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 			      u32 mode);
 void ath11k_qmi_firmware_stop(struct ath11k_base *ab);
-void ath11k_qmi_event_work(struct work_struct *work);
-void ath11k_qmi_msg_recv_work(struct work_struct *work);
 void ath11k_qmi_deinit_service(struct ath11k_base *ab);
 int ath11k_qmi_init_service(struct ath11k_base *ab);
 void ath11k_qmi_free_resource(struct ath11k_base *ab);
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
