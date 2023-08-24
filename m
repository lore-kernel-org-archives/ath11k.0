Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AA6C7113B
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpYS6iZtVYtONDTtPVNDP4Xa9O/YjNSsl1dL2a3i+f4=; b=ZRMTWZ0bg8sFQu
	GnZnIksiLd5okJ8tHdZD9bL961uYfTb//Zx7Gy8ZsRMl709P9aWMH5vNGllfjjMlEHYAPw5SLMAXj
	BajVbvPlZFGVRk2gRio9pvbAVP7ZoKsgWIlZno0WVwroG9RTGQ9ovBXyjRcjc+YCvdquZt1pjoiNW
	ADmZ65yg7nPW95klrPMXIiyCjQKS0uDqZ3SZvJypcKa/5eMd1wL1pCnXCMt0IECvccU+aY4k9PGZY
	VwewSKUKbqM+f2LgaLKZ4P2zjxYwGZbf7WbzXxOpDMMMMLK/BFaxAIpX3ItEWQeHIqoj/z4f0R+RS
	e7lw8jQ0Nu2rdNH0roNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Bg-002TZU-17;
	Thu, 24 Aug 2023 07:55:28 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Bd-002TXs-0h
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 07:55:26 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id BA0BC603D4;
	Thu, 24 Aug 2023 10:54:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nsFdET9WwmI0-OEH6mo4p;
	Thu, 24 Aug 2023 10:54:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692863690;
	bh=AfYkJSCKHAqWsERHvZQ7Utd958ZltNw48aNsHiisNYc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=Ooo38xcoZdB3Mh4BLrUOEzSsX8KUNXSRldh68JQ9Gi/bJO6N6MJGaniWKgRMqRY/H
	 wjmCmgsZSkzWgqbc19J5Qx6m/qghgLHgbRBkTEwf6GVEJUMX90NtDMSpEjzaMO4Q1Y
	 VkILn07txt1ma8b/Uw3Qq/wKNswrYyLSeDAX5V00=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/5] wifi: ath11k: remove unused members of 'struct ath11k_base'
Date: Thu, 24 Aug 2023 10:50:45 +0300
Message-ID: <20230824075121.121144-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005525_421252_54A26E52 
X-CRM114-Status: UNSURE (   8.25  )
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

Remove set but otherwise unused 'wlan_init_status' and
'wmi_ready' members of 'struct ath11k_base', adjust
'ath11k_wmi_tlv_rdy_parse()' accordingly.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/core.h | 2 --
 drivers/net/wireless/ath/ath11k/wmi.c  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b04447762483..650972f9d146 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -901,8 +901,6 @@ struct ath11k_base {
 	struct list_head peers;
 	wait_queue_head_t peer_mapping_wq;
 	u8 mac_addr[ETH_ALEN];
-	bool wmi_ready;
-	u32 wlan_init_status;
 	int irq_num[ATH11K_IRQ_NUM_MAX];
 	struct ath11k_ext_irq_grp ext_irq_grp[ATH11K_EXT_IRQ_GRP_NUM_MAX];
 	struct ath11k_targ_cap target_caps;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 23ad6825e5be..a5cf97368a14 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7222,14 +7222,12 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 		memset(&fixed_param, 0, sizeof(fixed_param));
 		memcpy(&fixed_param, (struct wmi_ready_event *)ptr,
 		       min_t(u16, sizeof(fixed_param), len));
-		ab->wlan_init_status = fixed_param.ready_event_min.status;
 		rdy_parse->num_extra_mac_addr =
 			fixed_param.ready_event_min.num_extra_mac_addr;
 
 		ether_addr_copy(ab->mac_addr,
 				fixed_param.ready_event_min.mac_addr.addr);
 		ab->pktlog_defs_checksum = fixed_param.pktlog_defs_checksum;
-		ab->wmi_ready = true;
 		break;
 	case WMI_TAG_ARRAY_FIXED_STRUCT:
 		addr_list = (struct wmi_mac_addr *)ptr;
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
