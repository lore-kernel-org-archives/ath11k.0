Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Thu, 19 Nov 2020 08:11:47 +0000
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] relay: allow the use of const callback structs
Message-ID: <20201119081147.GA8577@infradead.org>
References: <20201118165320.26829-1-jani.nikula@intel.com>
 <20201119081120.GA6149@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119081120.GA6149@infradead.org>
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

On Thu, Nov 19, 2020 at 08:11:20AM +0000, Christoph Hellwig wrote:
> Please also add a patch to mark all rchan_callbacks instances const
> while you're at it.

Oops, I just noticed you actually sent that one.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
