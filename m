Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaOYx-0001C4-2a
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 19:35:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id u2so4824204pls.10
 for <ath11k@lists.infradead.org>; Wed, 04 Nov 2020 11:35:17 -0800 (PST)
MIME-Version: 1.0
References: <CAKuwtP2UbFTxj7bqXFNckJrYaocp=83Uctmxvwme9CcvcU6fkg@mail.gmail.com>
 <87ft5pqduv.fsf@codeaurora.org>
In-Reply-To: <87ft5pqduv.fsf@codeaurora.org>
From: Kenny Johansson <wirehell@gmail.com>
Date: Wed, 4 Nov 2020 20:35:04 +0100
Message-ID: <CAKuwtP1SJ-XsMzFMij=KaWTS-E17075C77zOyOD+nqXaK9Y+ww@mail.gmail.com>
Subject: Re: QCA6390 failure on unsuspend
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

I tried to apply the patch manually, but the function ath11k_config_ps
seems to be missing from the patch.
Google didn't find me any repos containing this, so assuming diff was
against something unpublished.
I'll wait for an updated patch.

On Wed, Nov 4, 2020 at 5:36 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Kenny Johansson <wirehell@gmail.com> writes:
>
> > I've tried out the QCA6390 support as described in
> > https://lore.kernel.org/linux-wireless/87r1r4nukq.fsf@codeaurora.org/#t
> >
> > I was able to get connectivity and experienced no issues while using
> > it for a couple of hours
> > , but after a suspend it stopped working.
>
> Can you try this patch:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20201030095832.7447-1-cjhuang@codeaurora.org/
>
> And please let me know if it helped or not.
>
> But while writing this I noticed it doesn't apply to v5.10-rc1 directly,
> but the conflict seems to be quite simple to solve. I have asked Carl to
> rebase the patch.
>
> Also updated the instructions how to test latest ath11k:
>
> http://lists.infradead.org/pipermail/ath11k/2020-November/000537.html
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
