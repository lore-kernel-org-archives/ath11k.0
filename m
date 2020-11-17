Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kesbr-0001Rs-EG
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 04:28:52 +0000
Received: by mail-pf1-x444.google.com with SMTP id y7so16267174pfq.11
 for <ath11k@lists.infradead.org>; Mon, 16 Nov 2020 20:28:49 -0800 (PST)
Date: Tue, 17 Nov 2020 09:58:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201117042841.GC7787@work>
References: <20201117151225.6a50abf8@canb.auug.org.au>
 <20201117042359.GB7787@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117042359.GB7787@work>
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
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Loic Poulain <loic.poulain@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvalo@codeaurora.org, ath11k@lists.infradead.org

On Tue, Nov 17, 2020 at 09:53:59AM +0530, Manivannan Sadhasivam wrote:
> +ath11k list, kalle
> 

Oops... adding now

> On Tue, Nov 17, 2020 at 03:12:25PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
> >    27 |   .auto_start = false,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
> >    42 |   .auto_start = false,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
> >    57 |   .auto_start = true,
> >       |    ^~~~~~~~~~
> > drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
> >    72 |   .auto_start = true,
> >       |    ^~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   0cc1f3a385b2 ("bus: mhi: Remove auto-start option")
> > 
> 
> The fixing patch [1] should've landed in ath-next. Kalle can you please
> apply the patch on top of immutable branch?
> 
> Stephen, feel free to pick it up in the meantime.
> 
> Thanks,
> Mani
> 
> [1] https://lore.kernel.org/netdev/1601369799-22328-1-git-send-email-kvalo@codeaurora.org/
> 
> 
> > I have used the mhi tree from next-20201116 for today.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
