Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2063C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Jun 2022 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wSopVZBh/uj8D/Swelr4rZ3dgvabol3tWSe3SW8XcI=; b=nDsfxz5ZgSDyZr
	kEhxqAXPSjnEtoAHv+lCASoJD08hI/aB5mMn9W/Hc5SUGUJP1hB9CEUQRw6X0PjJY0RDytWNaACaK
	JAqYxlRPPvNMkwNYCEg2/PdKrbF/rkxXeXLQYM+xT1DNnyXJmUXomkk4V9FgqcimsEGlQeuJxdocC
	2dYNT9LOnxXR+cieFHpvCetl2Iqrpwkd7AhEZr3ebAiRne2YqISCl5QKNf5zuqobJHTcFaRuudNzd
	5Yp9aEPC32s2qjJZZo8uzat7McX8uX12g5fmovXVUImFruck3gFJlQfbwbZosDrIO5RAfSyvmxr6Y
	jFFpvSSMAWtuhszEwSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1tTe-003hii-I8; Thu, 16 Jun 2022 17:40:18 +0000
Received: from 17.mo582.mail-out.ovh.net ([46.105.36.150])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1tTa-003hfh-Rs
	for ath11k@lists.infradead.org; Thu, 16 Jun 2022 17:40:17 +0000
Received: from player734.ha.ovh.net (unknown [10.110.208.43])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 02D3123A4D
	for <ath11k@lists.infradead.org>; Thu, 16 Jun 2022 17:40:05 +0000 (UTC)
Received: from galgus.net (86-127-225-235.digimobil.es [86.127.225.235])
	(Authenticated sender: jesus.manzano@galgus.net)
	by player734.ha.ovh.net (Postfix) with ESMTPSA id 3AC442B7CFCEC;
	Thu, 16 Jun 2022 17:40:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-102R00463922318-e613-40ed-a497-33fc058fb38a,
                    F4FD44FD571365DA550CAEAA7E09DDA2F3552634) smtp.auth=jesus.manzano@galgus.net
X-OVh-ClientIp: 86.127.225.235
From: Jesus Fernandez Manzano <jesus.manzano@galgus.net>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jesus.manzano@galgus.net
Subject: [PATCH] ath11k: fix number of VHT beamformee spatial streams
Date: Thu, 16 Jun 2022 19:39:47 +0200
Message-Id: <20220616173947.21901-1-jesus.manzano@galgus.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7706503387378414065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfgvshhushcuhfgvrhhnrghnuggviicuofgrnhiirghnohcuoehjvghsuhhsrdhmrghniigrnhhosehgrghlghhushdrnhgvtheqnecuggftrfgrthhtvghrnhepgffhvefhieehveeludekudeuveegfedtuedukeffudeufeeuieetvdduhfdtjedunecukfhppedtrddtrddtrddtpdekiedruddvjedrvddvhedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjvghsuhhsrdhmrghniigrnhhosehgrghlghhushdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrthhhuddukheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekvd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_104015_248476_6778C87D 
X-CRM114-Status: GOOD (  16.26  )
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

The number of spatial streams used when acting as a beamformee in VHT
mode are reported by the firmware as 7 (8 sts - 1) both in IPQ6018 and
IPQ8074 which respectively have 2 and 4 sts each. So the firmware should
report 1 (2 - 1) and 3 (4 - 1).

Fix this by checking that the number of VHT beamformee sts reported by
the firmware is not greater than the number of receiving antennas - 1.
The fix is based on the same approach used in this same function for
sanitizing the number of sounding dimensions reported by the firmware.

Without this change, acting as a beamformee in VHT mode is not working
properly.

Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jesus Fernandez Manzano <jesus.manzano@galgus.net>
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 42d2e8cf8125..7109ca4f166d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4950,6 +4950,8 @@ static int ath11k_mac_set_txbf_conf(struct ath11k_vif *arvif)
 	if (vht_cap & (IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE)) {
 		nsts = vht_cap & IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK;
 		nsts >>= IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+		if (nsts > (ar->num_rx_chains - 1))
+			nsts = ar->num_rx_chains - 1;
 		value |= SM(nsts, WMI_TXBF_STS_CAP_OFFSET);
 	}
 
@@ -4990,7 +4992,7 @@ static int ath11k_mac_set_txbf_conf(struct ath11k_vif *arvif)
 static void ath11k_set_vht_txbf_cap(struct ath11k *ar, u32 *vht_cap)
 {
 	bool subfer, subfee;
-	int sound_dim = 0;
+	int sound_dim = 0, nsts = 0;
 
 	subfer = !!(*vht_cap & (IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE));
 	subfee = !!(*vht_cap & (IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE));
@@ -5000,6 +5002,11 @@ static void ath11k_set_vht_txbf_cap(struct ath11k *ar, u32 *vht_cap)
 		subfer = false;
 	}
 
+	if (ar->num_rx_chains < 2) {
+		*vht_cap &= ~(IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE);
+		subfee = false;
+	}
+
 	/* If SU Beaformer is not set, then disable MU Beamformer Capability */
 	if (!subfer)
 		*vht_cap &= ~(IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE);
@@ -5012,7 +5019,9 @@ static void ath11k_set_vht_txbf_cap(struct ath11k *ar, u32 *vht_cap)
 	sound_dim >>= IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_SHIFT;
 	*vht_cap &= ~IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK;
 
-	/* TODO: Need to check invalid STS and Sound_dim values set by FW? */
+	nsts = (*vht_cap & IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK);
+	nsts >>= IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	*vht_cap &= ~IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK;
 
 	/* Enable Sounding Dimension Field only if SU BF is enabled */
 	if (subfer) {
@@ -5024,9 +5033,15 @@ static void ath11k_set_vht_txbf_cap(struct ath11k *ar, u32 *vht_cap)
 		*vht_cap |= sound_dim;
 	}
 
-	/* Use the STS advertised by FW unless SU Beamformee is not supported*/
-	if (!subfee)
-		*vht_cap &= ~(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK);
+	/* Enable Beamformee STS Field only if SU BF is enabled */
+	if (subfee) {
+		if (nsts > (ar->num_rx_chains - 1))
+			nsts = ar->num_rx_chains - 1;
+
+		nsts <<= IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+		nsts &=  IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK;
+		*vht_cap |= nsts;
+	}
 }
 
 static struct ieee80211_sta_vht_cap
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
