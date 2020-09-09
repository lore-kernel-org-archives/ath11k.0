Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFyp7-0001LU-3g
 for ath11k@lists.infradead.org; Wed, 09 Sep 2020 12:03:37 +0000
Subject: Re: [PATCH 1/2] mac80211: Add new AMPDU factor macro for HE peer caps
References: <1588611900-21185-1-git-send-email-tamizhr@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <4b83cffc-2c38-2485-2af9-48ccc3b0c078@nbd.name>
Date: Wed, 9 Sep 2020 14:03:30 +0200
MIME-Version: 1.0
In-Reply-To: <1588611900-21185-1-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>, ath11k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org

On 2020-05-04 19:04, Tamizh Chelvam wrote:
> Add IEEE80211_HE_VHT_MAX_AMPDU_FACTOR and IEEE80211_HE_HT_MAX_AMPDU_FACTOR
> as per spec to use for peer max ampdu factor.
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> ---
>  include/linux/ieee80211.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
> index a561db4..69e214c 100644
> --- a/include/linux/ieee80211.h
> +++ b/include/linux/ieee80211.h
> @@ -1821,6 +1821,8 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
>  #define IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED			0x40
>  #define IEEE80211_HE_MAC_CAP3_RX_CTRL_FRAME_TO_MULTIBSS		0x80
>  
> +#define IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_SHIFT		3
Can we please stop adding these redundant _MASK and _SHIFT combinations
in places where having just the mask is enough when used with FIELD_GET?

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
