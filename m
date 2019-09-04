Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5X0p-0002iY-I2
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 15:16:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/4] ath11k: add HE support
References: <20190904091211.26868-1-john@phrozen.org>
 <20190904091211.26868-2-john@phrozen.org>
Date: Wed, 04 Sep 2019 18:15:54 +0300
In-Reply-To: <20190904091211.26868-2-john@phrozen.org> (John Crispin's message
 of "Wed, 4 Sep 2019 11:12:08 +0200")
Message-ID: <87v9u8nlcl.fsf@kamboji.qca.qualcomm.com>
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This added few new warnings below which I fixed in the pending branch,
please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=c2cc53787bf54a6fb8d45f375bad18719b1ffd4f

drivers/net/wireless/ath/ath11k/mac.c:1195:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1195:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1195:83:    got restricted __le16 const [usertype] rx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1197:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1197:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1197:83:    got restricted __le16 const [usertype] tx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1201:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1201:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1201:73:    got restricted __le16 const [usertype] rx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1203:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1203:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1203:73:    got restricted __le16 const [usertype] tx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1209:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1209:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1209:72:    got restricted __le16 const [usertype] rx_mcs_80
drivers/net/wireless/ath/ath11k/mac.c:1211:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1211:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1211:72:    got restricted __le16 const [usertype] tx_mcs_80
drivers/net/wireless/ath/ath11k/mac.c:3352: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/mac.c:3360: Alignment should match open parenthesis


-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
