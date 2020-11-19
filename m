Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfiIo-0008KC-9r
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 11:40:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 4/6] ath11k: make relay callbacks const
References: <20201118165320.26829-1-jani.nikula@intel.com>
 <20201118165320.26829-4-jani.nikula@intel.com>
 <871rgppu9s.fsf@intel.com>
Date: Thu, 19 Nov 2020 13:40:30 +0200
In-Reply-To: <871rgppu9s.fsf@intel.com> (Jani Nikula's message of "Thu, 19 Nov
 2020 11:31:43 +0200")
Message-ID: <87wnyhtw0h.fsf@codeaurora.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

Jani Nikula <jani.nikula@intel.com> writes:

> On Wed, 18 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
>> Now that relay_open() accepts const callbacks, make relay callbacks
>> const.
>>
>> Cc: Kalle Valo <kvalo@codeaurora.org>
>> Cc: ath11k@lists.infradead.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Kalle, thanks for the acks on the other two ath patches - can I have
> your ack on this one too please?

Oops, missed that:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
