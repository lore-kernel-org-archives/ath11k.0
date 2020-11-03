Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZxEl-0005vi-Ix
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 14:24:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org>
Date: Tue, 03 Nov 2020 16:23:58 +0200
Message-ID: <87ft5qsem9.fsf@codeaurora.org>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:
>
>> After doing some testing I was able to get it running under some
>> specific conditions. I took the v5.9 tag of the main kernel tree and
>> merged in the ath11k-qca6390-bringup-202009250825 tag from the ath
>> tree. I had to fix some trivial conflicts, but the resulting kernel
>> together with the firmware (amss.bin, m3.bin and board-2.bin) gave me
>> a working driver that I was able to use to connect to my AP in both
>> 2,4 and 5GHz.
>>
>> I then tried to copy over the ath11k driver source resulting from that
>> merge on top of the 5.10-rc2 tag. After fixing some API breakage
>> (IEEE80211_TX_CTRL_HW_80211_ENCAP and ieee80211_set_hw_80211_encap) to
>> make it compile I booted into the resulting kernel, but ath11k driver
>> was giving me the same firmware errors I had initially on 5.10-rc2. So
>> it looks like there might be some change in 5.10 that broke the logic.
>
> Interesting, and worrisome. I have not yet tested v5.10-rc releases,
> I'll do that ASAP and try to reproduce your issue. If I see the same
> problem then it should be possible to bisect the issue pretty easily.

For me v5.10-rc2 (no extra patches) was working fine. A bisection would
be a good next step. What I suggest that is that you first test these
three commits from Linus' tree in this order:

fd5ad4d1e980 wcn36xx: Advertise beacon filtering support in bmps
3650b228f83a Linux 5.10-rc1
3cea11cd5e3b Linux 5.10-rc2

Commit fd5ad4d1e980 is based on v5.9-rc6 so try that first. In these
three commits ath11k is practically identical, the only change is a
small bugfix in commit 8431350eee2e ("ath11k: Fix memory leak on error
path").

If commit fd5ad4d1e980 works for you then use that as "good" commit for
git-bisect. And use 3650b228f83a or 3cea11cd5e3b as the "bad" commit,
depending on which one was broken first. Hopefully the bisect would give
us more clues what's happening.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
