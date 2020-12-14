Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kor4l-0001dK-IL
 for ath11k@lists.infradead.org; Mon, 14 Dec 2020 16:51:56 +0000
Received: by mail-ed1-x542.google.com with SMTP id cm17so17880374edb.4
 for <ath11k@lists.infradead.org>; Mon, 14 Dec 2020 08:51:52 -0800 (PST)
MIME-Version: 1.0
References: <87blew3e4q.fsf@codeaurora.org>
In-Reply-To: <87blew3e4q.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Mon, 14 Dec 2020 17:51:41 +0100
Message-ID: <CAHUdJJXFyNxbf7nBGxw+dsMswcVoxwbQ73U=9=3o+zM7p7kpHg@mail.gmail.com>
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

On Mon, Dec 14, 2020 at 10:56 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> (Bcc: people reporting qca6390 problems)
>
> Hi,
>
> there are updates in ath11k-qca6390-bringup branch[1] and the new tag
> is:
>
> ath11k-qca6390-bringup-202012140938
>
> The changes are:
>
> * rebase to v5.10 released last night
>
> * remove unneeded patch "HACK: ath11k: add delays to suspend and resume handlers"
>
> * add wink's workaround for MHI M2 issues: "HACK: mhi: disable M2 state"
>
> * add workaround for 32M firmare memory problem: "HACK: Revert
>   "mm/page_alloc: place pages to tail in __free_pages_core()""
>
> * add patch: "ath11k: start vdev if a bss peer is already created"
>
> All feedback very welcome, both positive and negative. You can send
> them privately to me or to the public ath11k list.
>
> Especially I would like to hear how Dell XPS 13 9310 laptops are
> behaving. I'm hoping that ath11k would be usable using this branch,
> without any extra patches or memmap hacks. If I get positive feedback
> my plan is to send "dummy instructions" for a wider audience how to
> use QCA6390 on Dell laptops with Linux.
>
> In the reports try to include at least:
>
> * name of the bringup branch tag you used
>
> * if there are other changes in the kernel, patches, reverts etc
>
> * do you use the memmap kernel parameter
>
> * make and model of the laptop/computer (eg. Dell XPS 13 9310)
>
> * how much testing you did
>
> All feedback is very valuable and gives us guidance on what we need to
> focus on.
>
> Kalle
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Hi Kalle,

  Thanks for the latest tag!  I've built and booted it successfully a
number of times.  The wifi connection has remained stable and seems to
be behaving nominally.  I'll update here as I get some more testing
in.

tag: ath11k-qca6390-bringup-202012140938 , no other changes
hw: dell xps 9310 (13")

  ps - I did notice a crash from the btqca driver I didn't see before,
but I'm not sure that's new.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
