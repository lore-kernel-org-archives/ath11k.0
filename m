Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadHh-0007J9-Kk
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 11:18:34 +0000
MIME-Version: 1.0
Date: Thu, 05 Nov 2020 19:17:29 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CA+ASDXNaLvtJyY9_ds9RVL9VTkiYzChsGJS1czhVt-RKitCk5g@mail.gmail.com>
References: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
 <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
 <f3be456c4c748f21836279eb4dc16e5e@codeaurora.org>
 <CA+ASDXNaLvtJyY9_ds9RVL9VTkiYzChsGJS1czhVt-RKitCk5g@mail.gmail.com>
Message-ID: <aeac9d9e65e6f39c4cc41c3e76b35894@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Abhishek Kumar <kuabhs@google.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, ath10k <ath10k@lists.infradead.org>, Doug Anderson <dianders@chromium.org>

On 2020-11-05 01:44, Brian Norris wrote:
> + ath10k
> 
> [ I realize I replied to the "wrong" RFC v1; I fell trap to Kalle's 
> note:
> 
> "When you submit a new version mark it as "v2". Otherwise people don't
> know what's the latest version." ]
> 
> On Tue, Nov 3, 2020 at 11:32 PM Carl Huang <cjhuang@codeaurora.org> 
> wrote:
>> On 2020-11-04 10:00, Brian Norris wrote:
>> > What are the ABI guarantees around a given driver/chip's 'sar_capa'?
>> > Do we guarantee that if the driver supports N ranges of certain bands,
>> > that it will always continue to support those bands?
> ...
>> For a given chip(at least a QCOM chip), we don't see that the
>> range will grow or change.
> 
> That's good to know. But that's not quite the same as an ABI guarantee.
> 
>> In addition, with current index-power SET method, it's hard for driver
>> to know what the index mean given your example. Does the index mean
>> [5,5 + x] or [5, 5 + x/2] ?  So it's required for user-space to 
>> specify
>> all the ranges.
> 
> Well, we'd have to change the API (which is why I'm asking now) if we
> wanted the kernel to handle this gracefully. We'd have to retain the
> index (which, it sounds like you might be dropping if things go as
> Johannes suggested), so user space can continue to request the old
> range even if the driver also splits up a new range.
> 
> More explicitly, something like this:
> 
> Linux version A:
> ath10k supports:
> 0: 2G band
> 1: 5G band
> 
> Linux version B:
> ath10k supports:
> 0: 2G band
> 1: 5G band
> 2: 1st half of 5G band
> 3: 2nd half of 5G band
> 
> Indexes 2 and 3 would be overlapping with 1 of course, but it does
> mean that the following SET request will work on both A and B:
> 
> SET
> index 0 -> power X
> index 1 -> power Y
> 
> Notably, that also requires nl80211 allow specifying only a subset of
> bands in a SET request.
> 
> But spelling that out, the proposal sounds more complicated than it's
> worth -- it's probably better to let user space handle the complexity.
> So that goes back to making ABI requirements clear, so we don't have
> kernel/user mixups/regressions down the line.
> 
>> The number of ranges is quite small, so the SET itself is not a
>> problem to specify all.
> 
> Sure, but it does mean that if I (user space) don't trust that driver
> support remains constant, I have to do some negotiation. I would
> already do some verification via the get/dump API of course, but
> negotiation is pretty complex if there is unbounded flexibility. It
> would be nice to spell out what sort of negotiation is reasonable as
> part of the ABI. For example, it might be reasonable to say that bands
> should never be combined; only ever added or split.
> 
> BTW, considering the possibility of "added" bands, how about this
> example: if ath10k were to add 6GHz support (and SAR to go with it),
> user space would have to learn to specify limits for it too, due to
> the "all or nothing" limitation? It'd be good to be up front about
> this, similar to the previous paragraph.
> 
Like what I've replied in another email. Let's remove "all or nothing"
limitation. If certain ranges are not SET, then these ranges just don't
have SAR power limitation.

Just FYI, ath10k will never support 6GHz, it's ath11k to support it.


>> Brian, are you fine that we go with this proposal? I'll send
>> V2 based on the comments from Johannes and Abhishek.
> 
> I think I'm fine with it; my main concerns around ambiguities, so
> maybe it just needs more explicit mentions in the docs (commit
> messages and/or comments). I'd be happy to see v2 and go from there.
> 
> Brian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
