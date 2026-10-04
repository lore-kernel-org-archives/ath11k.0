Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89F0CA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekKSSnB+ThUgyYskybv8jZBAtlopgihREQhdckc39dE=; b=ovOWzLRFyxi/QSKDx2l3RxEf8z
	n/jRmVR74avEqbBgoBhJSE+CwluBWt0cSZ1azO6jHDApRYIVgbSxYzdf7NAwZGWedyZWP9bGmADbX
	Ad0f5a6RwC7SXCqTYkURAZwn+SRHB3eJiz/M9pfpBXUs+p/fUcKV19ypQtBGvnw6jzmiRzqUGaE21
	IL8GMHaS74fxsA5ltqTUBVffnHxUsjGgB8XXYHCISItxUmD50eWH+++qfIpd+f9uBJTU7Ai3W7+HR
	oGj/n160OSGnOp3WVbOyL3eka0HDsHkeJ79w04rRO4+7eL0Ny6PyhLx77wnw6pTu5Zxs2RJhJL/Dj
	/XGrtSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKMv-0000000Ek0x-0auI;
	Sun, 04 Oct 2026 11:27:02 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKMs-0000000Ek0C-2y9W
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:27:00 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id D6DF01BAC7;
	Sun, 04 Oct 2026 14:26:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=ekKSSnB+ThUgyYskybv8
	jZBAtlopgihREQhdckc39dE=; b=U2XIL5sBuonaE6FT9Mg7HHy2h9Ox8eU32WMA
	ZGIgqOk7njHWS1lT0k9agDyBGZ3m5Sj+cc8gclkIEMI18yyMMPznac8DWOa5fTLz
	gMeCj5aEsUb3H5+JCVzmUHyUAGCNAScTmJpsAPJ7hSHXyV6wcZrAvpqLNvO5xqNt
	3oxSKfnwuC+sy0Wr+F6jNbU7Y8YE667e/wr60FCQ0KEWVy97AyGyFSTRKb160XZq
	XPiSDyKacRIDxT6s8yrdNQ3bkm7Kybh850MjwCgW/XsibJX8Q3RCgkpw/7KKaTW7
	Id1ExdpHOjmrIkGlCTws7NK4QBuVComD+xS8UmmpjZ9rbE+z3w==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 26ADC1BAC6;
	Sun, 04 Oct 2026 14:26:56 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:26:55 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH ath-next 2/2] wifi: ath11k: keep the BSS color while it is disabled
Date: Sun, 4 Oct 2026 14:24:40 +0300
Message-ID: <c180e6f0f96e4d27d96130aaef7d7d363b67e549.1791111136.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791111135.3.git.me@andrei-z.com>
References: <cover.1791111135.3.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042658_928665_98F7341E 
X-CRM114-Status: GOOD (  12.02  )
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

While the BSS Color Disabled subfield is 1, an HE STA shall keep
advertising its nonzero BSS color in the TXVECTOR of the HE PPDUs it
transmits (IEEE Std 802.11-2024, 26.11.4). hostapd disables the color
while it counts down to a color change, and ath11k then set the vdev's
BSS color parameter to "disabled" with color 0.

Keep the color in the parameter and add the disabled flag to it.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 183796ce1c..58d222a888 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3812,12 +3812,14 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 				ath11k_warn(ar->ab, "failed to set bss color collision on vdev %i: %d\n",
 					    arvif->vdev_id,  ret);
 
+			/* A disabled color stays in the PPDUs the AP transmits
+			 * (IEEE Std 802.11-2024, 26.11.4)
+			 */
 			param_id = WMI_VDEV_PARAM_BSS_COLOR;
-			if (info->he_bss_color.enabled)
-				param_value = info->he_bss_color.color <<
-						IEEE80211_HE_OPERATION_BSS_COLOR_OFFSET;
-			else
-				param_value = IEEE80211_HE_OPERATION_BSS_COLOR_DISABLED;
+			param_value = info->he_bss_color.color <<
+					IEEE80211_HE_OPERATION_BSS_COLOR_OFFSET;
+			if (!info->he_bss_color.enabled)
+				param_value |= IEEE80211_HE_OPERATION_BSS_COLOR_DISABLED;
 
 			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 							    param_id,
-- 
2.47.3



