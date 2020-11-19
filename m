Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Thu, 19 Nov 2020 08:11:20 +0000
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] relay: allow the use of const callback structs
Message-ID: <20201119081120.GA6149@infradead.org>
References: <20201118165320.26829-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118165320.26829-1-jani.nikula@intel.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-block@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

> +/*
> + * rchan_callback wrappers. Call the callbacks if available, otherwise fall back
> + * to default behaviour.
> + */

This adds an overly long line.  That being said this behavior is pretty
normal for kernel APIs, so I'm not even sure we need it at all.

> +
> +/*
> + * subbuf_start() callback.
> + */

and this one is for sure completley useless.  Same for all the other
similar ones.


But taking one step back:  All instances implement create_buf_file
and remove_buf_file, which makes sense as that is the prime aim
of these methods.  So there is no point in making those optional.
subbuf_start_callback is overriden by two instances, so making that
optional totally makes sense.  buf_mapped and buf_unmapped are
never overriden, so they should be removed entirely.

More importantly there is no case that passes a NULL rchan_callbacks,
which makes complete sense as it wouldn't even create a file.  So
remove that case as well and just replace it with a sanity check in
relay_open().

Please also add a patch to mark all rchan_callbacks instances const
while you're at it.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
