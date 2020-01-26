Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivg5F-0005Vi-Vx
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 11:28:07 +0000
MIME-Version: 1.0
Subject: Re: [RESEND] ath11k: add tx hw 802.11 encapusaltion offloading support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200122142930.19239-1-john@phrozen.org>
References: <20200122142930.19239-1-john@phrozen.org>
Message-Id: <20200126112804.AF3A2C433A2@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 11:28:04 +0000 (UTC)
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> This patch adds support for ethernet rxtx mode to the driver. The feature
> is enabled via a new module parameter. If enabled to driver will enable
> the feature on a per vif basis if all other requirements were met.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Depends on:

50ff477a8639 mac80211: add 802.11 encapsulation offloading support

Currently in mac80211-next.

drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_mgmt_tx_wmi':
drivers/net/wireless/ath/ath11k/mac.c:3653:30: error: 'IEEE80211_TX_CTRL_HW_80211_ENCAP' undeclared (first use in this function); did you mean 'IEEE80211_TX_CTRL_RATE_INJECT'?
  if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                              IEEE80211_TX_CTRL_RATE_INJECT
drivers/net/wireless/ath/ath11k/mac.c:3653:30: note: each undeclared identifier is reported only once for each function it appears in
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_tx':
drivers/net/wireless/ath/ath11k/mac.c:3766:28: error: 'IEEE80211_TX_CTRL_HW_80211_ENCAP' undeclared (first use in this function); did you mean 'IEEE80211_TX_CTRL_RATE_INJECT'?
  if (info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) {
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            IEEE80211_TX_CTRL_RATE_INJECT
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_add_interface':
drivers/net/wireless/ath/ath11k/mac.c:4145:6: error: implicit declaration of function 'ieee80211_set_hw_80211_encap'; did you mean 'ieee80211_get_he_sta_cap'? [-Werror=implicit-function-declaration]
  if (ieee80211_set_hw_80211_encap(vif, ath11k_ethernet_mode && hw_encap))
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ieee80211_get_he_sta_cap
cc1: some warnings being treated as errors
make[5]: *** [drivers/net/wireless/ath/ath11k/mac.o] Error 1
make[5]: *** Waiting for unfinished jobs....
drivers/net/wireless/ath/ath11k/dp_tx.c: In function 'ath11k_dp_tx_get_encap_type':
drivers/net/wireless/ath/ath11k/dp_tx.c:20:31: error: 'IEEE80211_TX_CTRL_HW_80211_ENCAP' undeclared (first use in this function); did you mean 'IEEE80211_TX_CTRL_RATE_INJECT'?
  if (tx_info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                               IEEE80211_TX_CTRL_RATE_INJECT
drivers/net/wireless/ath/ath11k/dp_tx.c:20:31: note: each undeclared identifier is reported only once for each function it appears in
drivers/net/wireless/ath/ath11k/dp_tx.c: In function 'ath11k_dp_tx':
drivers/net/wireless/ath/ath11k/dp_tx.c:97:30: error: 'IEEE80211_TX_CTRL_HW_80211_ENCAP' undeclared (first use in this function); did you mean 'IEEE80211_TX_CTRL_RATE_INJECT'?
  if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                              IEEE80211_TX_CTRL_RATE_INJECT
make[5]: *** [drivers/net/wireless/ath/ath11k/dp_tx.o] Error 1
make[4]: *** [drivers/net/wireless/ath/ath11k] Error 2
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

Patch set to Awaiting Upstream.

-- 
https://patchwork.kernel.org/patch/11345841/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
