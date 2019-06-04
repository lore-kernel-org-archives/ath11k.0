Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY500-0006AR-MD
 for ath11k@lists.infradead.org; Tue, 04 Jun 2019 08:40:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V7 8/8] ath11k: add HE support
References: <20190603190157.25165-1-john@phrozen.org>
 <20190603190157.25165-9-john@phrozen.org>
Date: Tue, 04 Jun 2019 11:40:47 +0300
In-Reply-To: <20190603190157.25165-9-john@phrozen.org> (John Crispin's message
 of "Mon, 3 Jun 2019 21:01:57 +0200")
Message-ID: <874l55wxo0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> Add basic HE support to the driver. The sband_iftype data is generated from
> the capabilities read from the FW.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Due to reason unknown to me this had a conflict in mac.c, and annoyingly
3-way merge didn't work either. Here's the rejected hunk:

diff a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c	(rejected hunks)
@@ -1470,7 +1565,14 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
 
 	switch (band) {
 	case NL80211_BAND_2GHZ:
-		if (sta->vht_cap.vht_supported &&
+		if (sta->he_cap.has_he) {
+			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+				phymode = MODE_11AX_HE80_2G;
+			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+				phymode = MODE_11AX_HE40_2G;
+			else
+				phymode = MODE_11AX_HE20_2G;
+		} else if (sta->vht_cap.vht_supported &&
 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
 			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
 				phymode = MODE_11AC_VHT40_2G;


I fixed it manually in the pending branch. Please check and let me know
if it's ok:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=17aca2d9a969788a7f1e3e0c72b5485bf6a432a4

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
