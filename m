Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4CY-0007i4-9o
 for ath11k@lists.infradead.org; Wed, 11 Mar 2020 16:27:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: handle RX fragments
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581671652-8115-2-git-send-email-mpubbise@codeaurora.org>
References: <1581671652-8115-2-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20200311162720.48EF0C43636@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:27:20 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> IPQ8074 HW has support to verify the PN of the received frames.
> For all frames except for fragmented ones, HW checks the PN and
> delivers them to the driver. For fragmented frames, driver is
> required to do a little more; it has to reassemble the fragments
> and then reinject them to the HW for verifying the PN. Currently,
> to keep the logic simple, PN verifcation is disabled in HW and is
> handled in mac80211 for all the frames (fragmented and unfragmented).
> 
> On the contrary, offloading PN Validation to the HW brings important
> benefits. It reduces CPU cycles spent on the host CPU for verifying
> the same; helps in enabling features which improve performance like
> mac80211 fast RX path, enabling multiple REO rings for parallel RX
> processing, 802.11 decapsulation offloading. All these features are
> dependent on PN offload which in turn is dependent on handling of
> the received fragments in the driver.
> 
> When TKIP security is used, additional handling is required while
> processing the fragments; since MIC is computed on an MSDU in TKIP,
> only the last fragment has the MIC info. In this case, driver has to
> compute the MIC after reassembly and compare it against the MIC
> present in the frame. For this, MICHAEL_MIC kernel crypto library
> APIs are used and the dependencies are appropriately set.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

kbuild test robot found new warnings:

New smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:3078
ath11k_dp_rx_h_defrag_reo_reinject() warn: unsigned 'buf_id' is never
less than zero.

sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse: sparse: incorrect type in return expression (different base types) @@    expected unsigned short @@    got resunsigned short @@
   drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse:    expected unsigned short
   drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse:    got restricted __le16
   drivers/net/wireless/ath/ath11k/dp_rx.c:2784:6: sparse: sparse: symbol 'ath11k_dp_rx_frag_timer' was not declared. Should it be static?

2 patches set to Changes Requested.

11381973 [1/2] ath11k: handle RX fragments
11381967 [2/2] ath11k: enable PN offload

-- 
https://patchwork.kernel.org/patch/11381973/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
