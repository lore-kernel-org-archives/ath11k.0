Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3ED12D79
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fb9xSrcUwXm5GaYavX8s9M756oY8Tq+2xHCr4k5NO4k=; b=uLDH66Y2HYcsRqt7DEmFyO7D6F
	OxzpX4Wi4KI85aSpSXS3osOAbb3vVgO5/5PHOzngj34OVolEXDLq7EkOKSef7voRlO1h5G87vKZiT
	TecsdKjJtbG39cvVYtRAQ2rX0VUagUp6M5qZV6e80uBhBaSlpXeLz43RAiAJxvjbsTj1Zm35vemdm
	4K9D8GiyDc/Wngn7w4pSZJ9lzp0ej2l0K3WRz588Y7PocYBlA1h4LdxufJ3B6CMavZh6how5nF0nS
	nNnwASHa/Ry/dSDjlWRaWEcwzN1RkIWbTTSGD2J/PHn4gotxnOCzi+jPeMgxuk1E3OxokIOCgNlkb
	EJZpNN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTm-0000000GYtQ-0Adw;
	Mon, 11 Nov 2024 07:04:54 +0000
Received: from forward100a.mail.yandex.net ([178.154.239.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAORA-0000000GYS7-1hDf
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 07:02:15 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:26bf:0:640:efa0:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 37B0F471EC;
	Mon, 11 Nov 2024 10:02:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 22g22h1xFKo0-qN6QcCb0;
	Mon, 11 Nov 2024 10:02:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1731308523; bh=fb9xSrcUwXm5GaYavX8s9M756oY8Tq+2xHCr4k5NO4k=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=sW+ztbsgSdXpw1rB/foQbUUFFBqzMA15B2puelvr4dIARa7o3NBl/l/f95/7A2QVi
	 fQ24iKQq5kIYFM7BgHnBuQKmifnUF+sK7qQ1IKbomlMeVIL/Dad5XBAH5J/ApewCC/
	 k3GY58fyYlfo7o1q0dN49mtag4qrGZoXq8knKs6k=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 2/4] wifi: ath11k: cleanup struct ath11k_reg_tpc_power_info
Date: Mon, 11 Nov 2024 10:01:50 +0300
Message-ID: <20241111070152.85140-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru>
References: <20241111070152.85140-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230213_006497_1DFF4466 
X-CRM114-Status: UNSURE (   7.28  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Remove unused 'ap_constraint_power' field of 'struct
ath11k_reg_tpc_power_info' and adjust related comment.
Compile tested only.

Fixes: 6f4e235be655 ("wifi: ath11k: add parse of transmit power envelope element")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: join the series
---
 drivers/net/wireless/ath/ath11k/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 5ab1fdd21144..b1440a70a886 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -340,7 +340,6 @@ struct ath11k_chan_power_info {
  * @ap_power_type: type of power (SP/LPI/VLP)
  * @num_pwr_levels: number of power levels
  * @reg_max: Array of maximum TX power (dBm) per PSD value
- * @ap_constraint_power: AP constraint power (dBm)
  * @tpe: TPE values processed from TPE IE
  * @chan_power_info: power info to send to firmware
  */
@@ -350,7 +349,6 @@ struct ath11k_reg_tpc_power_info {
 	enum wmi_reg_6ghz_ap_type ap_power_type;
 	u8 num_pwr_levels;
 	u8 reg_max[ATH11K_NUM_PWR_LEVELS];
-	u8 ap_constraint_power;
 	s8 tpe[ATH11K_NUM_PWR_LEVELS];
 	struct ath11k_chan_power_info chan_power_info[ATH11K_NUM_PWR_LEVELS];
 };
-- 
2.47.0


