Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/6] relay: allow the use of const callback structs
In-Reply-To: <20201119081120.GA6149@infradead.org>
References: <20201118165320.26829-1-jani.nikula@intel.com>
 <20201119081120.GA6149@infradead.org>
Date: Mon, 23 Nov 2020 20:01:17 +0200
Message-ID: <87pn44lzpu.fsf@intel.com>
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
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-block@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, 19 Nov 2020, Christoph Hellwig <hch@infradead.org> wrote:
> But taking one step back:  All instances implement create_buf_file
> and remove_buf_file, which makes sense as that is the prime aim
> of these methods.  So there is no point in making those optional.
> subbuf_start_callback is overriden by two instances, so making that
> optional totally makes sense.  buf_mapped and buf_unmapped are
> never overriden, so they should be removed entirely.
>
> More importantly there is no case that passes a NULL rchan_callbacks,
> which makes complete sense as it wouldn't even create a file.  So
> remove that case as well and just replace it with a sanity check in
> relay_open().

Many thanks for the feedback; sent v2 [1].

BR,
Jani.


[1] http://lore.kernel.org/r/cover.1606153547.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
