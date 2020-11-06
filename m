Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayiP-0006W2-CX
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 10:11:30 +0000
MIME-Version: 1.0
Date: Fri, 06 Nov 2020 18:11:27 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CA+ASDXNESXqeW32Put_hDMF+16+KTqbd++iWk6DNTfsrEd+UbQ@mail.gmail.com>
References: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
 <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
 <f3be456c4c748f21836279eb4dc16e5e@codeaurora.org>
 <CA+ASDXNaLvtJyY9_ds9RVL9VTkiYzChsGJS1czhVt-RKitCk5g@mail.gmail.com>
 <877dr0nqtv.fsf@codeaurora.org>
 <728196c17b4e70e18c99798a9945d1e6@codeaurora.org>
 <CA+ASDXNESXqeW32Put_hDMF+16+KTqbd++iWk6DNTfsrEd+UbQ@mail.gmail.com>
Message-ID: <bad7a78cf3ca4048b275457cc970faa2@codeaurora.org>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Abhishek Kumar <kuabhs@google.com>

On 2020-11-06 02:25, Brian Norris wrote:
> On Thu, Nov 5, 2020 at 3:10 AM Carl Huang <cjhuang@codeaurora.org> 
> wrote:
>> On 2020-11-05 16:35, Kalle Valo wrote:
>> > Brian Norris <briannorris@chromium.org> writes:
>> >> On Tue, Nov 3, 2020 at 11:32 PM Carl Huang <cjhuang@codeaurora.org>
>> >> wrote:
>> >>> On 2020-11-04 10:00, Brian Norris wrote:
>> >>> > What are the ABI guarantees around a given driver/chip's 'sar_capa'?
>> >>> > Do we guarantee that if the driver supports N ranges of certain bands,
>> >>> > that it will always continue to support those bands?
> 
> To be clear: the answer here is "no." So we have to map out what the
> user/kernel interaction looks like when they change.
> 
>> >> ...
>> >>> For a given chip(at least a QCOM chip), we don't see that the
>> >>> range will grow or change.
>> >>
>> >> That's good to know. But that's not quite the same as an ABI
>> >> guarantee.
>> >
>> > I'm not sure if I understood Brian's question correctly, but I have
>> > concerns on the assumption that frequency ranges never change. For
>> > example, in ath10k we have a patch[1] under discussion which adds more
>> > channels and in ath11k we added 6 GHz band after initial ath11k support
>> > landed. And I would not be surprised if in some boards/platforms a
>> > certain band is disabled due to cotting costs (no antenna etc).
> 
> Right, I certainly was not taking the "never change bands" claim from
> Carl at face value ;) This is exactly why I was asking.
> 
>> > My
>> > preference is to have a robust interface which would be designed to
>> > handle these kind of changes.
> 
> Sure.
> 
>> > [1] [PATCH] ath10k: enable advertising support for channels 32, 68 and
>> > 98
>> 
>> So the trick here is even if more channels are supported, it doesn't
>> mean
>> that it can support different SAR setting on these new channels. In 
>> this
>> case,
>> it likely falls into 5G range. It's safe for driver to extend the 5G
>> range and
>> doesn't break userspace. (68 and 98 are already in the 5G range, so
>> driver just
>> extends the start edge freq to 32 here.).
> 
> You can't just wave your hands and say it "doesn't break userspace" --
> you have to think about how user space can use this API.
> 
> Specifically, consider that user space is not going to memorize
> indeces, as those are per-driver implementation details; it's going to
> memorize frequency bands. It wants to cross reference those with the
> results of the GET/DUMP API before it translates those into indeces
> for SET. As you're describing it, user space will have to have some
> kind of "fuzziness" to its logic -- today, it thinks the 5G band is
> [X,Y], but tomorrow it might expand to [X-N, Y+M]. So user space
> should just ensure that it configures any band that intersects with
> [X,Y], even though it didn't know about [X-N,X] or [Y,Y+M]? That logic
> covers splits too, I suppose.
> 
> There's still the question of ranges that user space has no knowledge
> of (i.e., no intersection with any known [X,Y]). I think there's two
> approaches that are roughly equivalent:
> 1) require SET operations to specify all bands, and designate a NULL
> or MAX value that user space should use for unknown/unconfigured bands
> [or, user space uses some kind of "extension" from the nearest known
> band, just to be safe?]
> 2) allow SET operations to specify a subset of supported bands [gray
> area: what happens with the unconfigured band(s)? left as-is? use
> max?]
> 
> We're approximately in #1 right now. If we're explicit about how
> that's supposed to work, then I think we can stay with that. Although
> it sounds like Carl is moving toward #2 (allow subsets).
> 
>> But for flexibility, given 6 GHz as example here, let's keep the
>> explicit
>> index for SET command. For sar_capa advertisement, the explicit index 
>> is
>> dropped as Johannes suggested. New ranges can only be appended to
>> existing
>> ones. Like Brian said, only add or split is allowed.
> 
>> The complexity to
>> handle
>> splitted range Vs whole range is left to WLAN driver itself.
> 
> Hmm? I thought we're keeping the driver simple. I'm OK with that (and
> moving a little more complexity into user space) as long as we're
> clear about it.
> 

I've sent  [PATCH 0/3] add common API to configure SAR, please let's 
start
from there again.


> Brian
> 
>> Userspace can SET any ranges which are advertised by WLAN driver. It's
>> not required to set all ranges and userspace can skip any ranges.
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
