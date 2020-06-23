Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnqs6-0005sJ-82
 for ath11k@lists.infradead.org; Tue, 23 Jun 2020 21:54:27 +0000
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 14:53:53 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 3/3] ath11k: add support for BSS coloring
In-Reply-To: <20200617150021.4183253-3-john@phrozen.org>
References: <20200617150021.4183253-1-john@phrozen.org>
 <20200617150021.4183253-3-john@phrozen.org>
Message-ID: <9597d58917d651655e51ba313b69d0c4@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-17 08:00, John Crispin wrote:
> Whenever the MAC detects a color collision or any of its associated 
> station
> detects one the FW will send out an event. Add the code to parse and 
> handle
> this event. and pass the data up to mac80211.
> 
> The FW does not provide an offload future such as the one used for CSA. 
> The
> CCA process is hence triggered via the beacon offload tx completion 
> events
> sent out by the FW.
> 
[...]
> +static void
> +ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct
> sk_buff *skb)
> +{
> +	const void **tb;
> +	const struct wmi_obss_color_collision_event *ev;
> +	struct ath11k_vif *arvif;
> +	int ret;
> +
> +	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
> +	if (IS_ERR(tb)) {
> +		ret = PTR_ERR(tb);
> +		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
> +		return;
> +	}
> +
> +	ev = tb[WMI_TAG_OBSS_COLOR_COLLISION_EVT];
> +	if (!ev) {
> +		ath11k_warn(ab, "failed to fetch obss color collision ev");
> +		goto exit;
> +	}
> +
> +	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
> +	switch (ev->evt_type) {
> +	case WMI_BSS_COLOR_COLLISION_DETECTION:
> +		break;
> +	case WMI_BSS_COLOR_COLLISION_DISABLE:
> +	case WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY:
> +	case WMI_BSS_COLOR_FREE_SLOT_AVAILABLE:
> +		return;
> 
tb should be freed here.

-Rajkumar

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
