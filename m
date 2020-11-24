Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Tue, 24 Nov 2020 09:42:09 +0000
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 4/9] relay: allow the use of const callback structs
Message-ID: <20201124094209.GD31963@infradead.org>
References: <cover.1606153547.git.jani.nikula@intel.com>
 <cc3ff292e4eb4fdc56bee3d690c7b8e39209cd37.1606153547.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc3ff292e4eb4fdc56bee3d690c7b8e39209cd37.1606153547.git.jani.nikula@intel.com>
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

> +/* subbuf_start callback wrapper */
> +static int cb_subbuf_start(struct rchan_buf *buf, void *subbuf,
> +			   void *prev_subbuf, size_t prev_padding)

I don't think the comment adds any information over just looking at the
function and the two callers.  I'd also name it relay_subbuf_start
instead of the cb_ prefix not used anywhere else in the file.


>  {
> +	if (buf->chan->cb->subbuf_start)
> +		return buf->chan->cb->subbuf_start(buf, subbuf,
> +						   prev_subbuf, prev_padding);
> +
>  	if (relay_buf_full(buf))
>  		return 0;

This could also be simplified a bit more to:

	if (!buf->chan->cb->subbuf_start)
		return !relay_buf_full(buf);
	return buf->chan->cb->subbuf_start(buf, subbuf, prev_subbuf,
					   prev_padding);

Otherwise this looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
