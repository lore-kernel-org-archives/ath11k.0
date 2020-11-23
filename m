Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGE5-0000yN-2t
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:06:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/9] relay: cleanup and const callbacks, take 2
References: <cover.1606153547.git.jani.nikula@intel.com>
Date: Mon, 23 Nov 2020 20:06:00 +0200
In-Reply-To: <cover.1606153547.git.jani.nikula@intel.com> (Jani Nikula's
 message of "Mon, 23 Nov 2020 19:59:20 +0200")
Message-ID: <87mtz8q77b.fsf@codeaurora.org>
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-block@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org

Jani Nikula <jani.nikula@intel.com> writes:

> This is v2 of [1], with a number of cleanups added first based on
> Christoph's feedback, making the actual constness patch much smaller and
> cleaner.
>
> I don't know who actually maintains relay, it's not in MAINTAINERS -
> Cc'd Andrew just in case.
>
> I'd think it would be simplest to queue patches 5-9 via whichever tree
> the relay patches get merged. They're all one-liners so neglible
> conflict potential.
>
> BR,
> Jani.
>
>
> [1] http://lore.kernel.org/r/20201118165320.26829-1-jani.nikula@intel.com
>
>
> Cc: linux-block@vger.kernel.org
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: ath11k@lists.infradead.org
> Cc: ath10k@lists.infradead.org
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
>
>
> Jani Nikula (9):
>   relay: remove unused buf_mapped and buf_unmapped callbacks
>   relay: require non-NULL callbacks in relay_open()
>   relay: make create_buf_file and remove_buf_file callbacks mandatory
>   relay: allow the use of const callback structs
>   drm/i915: make relay callbacks const
>   ath10k: make relay callbacks const
>   ath11k: make relay callbacks const
>   ath9k: make relay callbacks const
>   blktrace: make relay callbacks const

For ath9k, ath10k & ath11k:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
