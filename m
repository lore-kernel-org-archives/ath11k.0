Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AOG-0003oy-Bk
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 20:06:01 +0000
Message-ID: <8c791df54a831f32fddd634e71e5e91342532535.camel@sipsolutions.net>
Subject: Re: [PATCH 04/49] ath11k: add ahb.c
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 20 Aug 2019 22:05:55 +0200
In-Reply-To: <1566316095-27507-5-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_175156_108502_D7159DB2)
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-5-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_175156_108502_D7159DB2)
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:
> 
> +static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
> +	{
> +		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
> +		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
> +		__cpu_to_le32(3),
> +	},

this might be nicer as C99 initializers as well? It's a struct of some
sort, after all.

> +	{ /* must be last */
> +		__cpu_to_le32(0),
> +		__cpu_to_le32(0),
> +		__cpu_to_le32(0),
> +	},

You don't need endian conversion for 0, even sparse will not complain,
but I'd argue it should anyway be something like

	{ /* terminator entry */ }

since that's why it's there I guess?

> +#define ATH11K_TX_RING_MASK_3 0x0

You have a LOT of masks here that are 0, that seems odd?

> +/* enum ext_irq_num - irq nubers that can be used by external modules

typo ("numbers")

> +inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
> +{
> +	return ioread32(ab->mem + offset);
> +}
> +
> +inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
> +{
> +	iowrite32(value, ab->mem + offset);
> +}

Just "inline" doesn't seem to make that much sense? If it's only used
here then I guess it should be static, otherwise not inline? Or maybe
you want it to be inlined *in this file* but available out-of-line
otherwise? I'm not sure that actually is guaranteed to work right in C?

> +		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
> +		val |= BIT(ce_id);
> +		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);

You could perhaps benefit from ath11k_ahb_setbit32() or something like
that, this repeats a few times?

> +	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
> +		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
> +		val &= ~BIT(ce_id);
> +		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);

and clearbit32() maybe. Dunno, I saw only 3 instances of each here I
guess, but still, feels repetitive.

> +int ath11k_ahb_start(struct ath11k_base *ab)
> +{
> +	ath11k_ahb_ce_irqs_enable(ab);
> +	ath11k_ce_rx_post_buf(ab);
> +
> +	/* Bring up other components as appropriate */

Hmm. What would be appropriate? It's not really doing anything else?

> +void ath11k_ahb_stop(struct ath11k_base *ab)
> +{
> +	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
> +		ath11k_ahb_ce_irqs_disable(ab);
> +	ath11k_ahb_sync_ce_irqs(ab);
> +	ath11k_ahb_kill_tasklets(ab);
> +	del_timer_sync(&ab->rx_replenish_retry);
> +	ath11k_ce_cleanup_pipes(ab);
> +	/* Shutdown other components as appropriate */

likewise, it's not doing anything else?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
