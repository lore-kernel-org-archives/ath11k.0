Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYu8G-0006oP-RC
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 15:16:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V7 0/8] ath11k: add HE support
References: <20190603190157.25165-1-john@phrozen.org>
Date: Thu, 06 Jun 2019 18:16:45 +0300
In-Reply-To: <20190603190157.25165-1-john@phrozen.org> (John Crispin's message
 of "Mon, 3 Jun 2019 21:01:49 +0200")
Message-ID: <87h892vj4y.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> This series adds initial support for HE mode to the ath11k driver.
>
> Changes in V2:
> * generate sband_iftype data from FW provided capabilities
> * properly handle rx_status for HE frames
> * fix regression in basic VHT phymode
> * various minor cleanups
>
> Changes in V3
> * make the he_cap generating code future-proof
> * move phymode lookup to an array
>
> Changes in V4
> * remove dependency in local patch
>
> Changes in V5
> * populate he_oper field when preparing peer assoc
> * populate ppet field when preparing peer assoc
> * fix 80p80 phymode when preparing peer assoc
> * address review comments
>
> Changes in V6
> * use bss_conf for storing the he_oper field
> * add rate reporting
>
> Changes in V7
> * fix Beamforming and Sounding Dimension fields in PHY CAP
> * use fixed size for phymode array
> * add ppet cap generation code
>
> John Crispin (8):
>   mac80211: propagate HE operation info into bss_conf
>   ath11k: fix some whitespace errors
>   ath11k: move phymode selection from function to array lookup
>   ath11k: add HE handling to the debug code
>   ath11k: extend reading of FW capabilities
>   ath11k: add defines for max MCS rates per phymode
>   ath11k: handle rx status for HE frames
>   ath11k: add HE support

Thanks, applied manually:

1848c5fd914f NOTUPSTREAM: mac80211: propagate HE operation info into bss_conf
9e73898c16e8 ath11k: fix some whitespace errors
d13a73716991 ath11k: move phymode selection from function to array lookup
b8a9b5b1c88d ath11k: add HE handling to the debug code
de0fe6e2e4da ath11k: extend reading of FW capabilities
748b3fb13a55 ath11k: add defines for max MCS rates per phymode
31396b6bdbb8 ath11k: handle rx status for HE frames
17aca2d9a969 ath11k: add HE support

This introduced new sparse warnings, please fix those in a followup
patch:

drivers/net/wireless/ath/ath11k/mac.c:1334:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1334:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1334:83:    got restricted __le16 const [usertype] rx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1336:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1336:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1336:83:    got restricted __le16 const [usertype] tx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1340:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1340:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1340:73:    got restricted __le16 const [usertype] rx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1342:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1342:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1342:73:    got restricted __le16 const [usertype] tx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1348:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1348:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1348:72:    got restricted __le16 const [usertype] rx_mcs_80
drivers/net/wireless/ath/ath11k/mac.c:1350:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1350:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1350:72:    got restricted __le16 const [usertype] tx_mcs_80

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
