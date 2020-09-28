Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMwRM-00016D-Ur
 for ath11k@lists.infradead.org; Mon, 28 Sep 2020 16:56:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
References: <20200928184230.2d973291@canb.auug.org.au>
 <20200928091035.GA11515@linux> <87eemmfdn3.fsf@codeaurora.org>
 <20200928094704.GB11515@linux>
Date: Mon, 28 Sep 2020 19:45:37 +0300
In-Reply-To: <20200928094704.GB11515@linux> (Manivannan Sadhasivam's message
 of "Mon, 28 Sep 2020 15:17:04 +0530")
Message-ID: <87a6x9g89a.fsf@codeaurora.org>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Loic Poulain <loic.poulain@linaro.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Govind Singh <govinds@codeaurora.org>, ath11k@lists.infradead.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Mon, Sep 28, 2020 at 12:34:40PM +0300, Kalle Valo wrote:
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> 
>> > On Mon, Sep 28, 2020 at 06:42:30PM +1000, Stephen Rothwell wrote:
>> >> Hi all,
>> >> 
>> >> After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
>> >> failed like this:
>> >> 
>> >> drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct
>> >> mhi_channel_config' has no member named 'auto_start'
>> >>    27 |   .auto_start = false,
>> >>       |    ^~~~~~~~~~
>> >> drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct
>> >> mhi_channel_config' has no member named 'auto_start'
>> >>    42 |   .auto_start = false,
>> >>       |    ^~~~~~~~~~
>> >> drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct
>> >> mhi_channel_config' has no member named 'auto_start'
>> >>    57 |   .auto_start = true,
>> >>       |    ^~~~~~~~~~
>> >> drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct
>> >> mhi_channel_config' has no member named 'auto_start'
>> >>    72 |   .auto_start = true,
>> >>       |    ^~~~~~~~~~
>> >> 
>> >> Caused by commit
>> >> 
>> >>   ed39d7816885 ("bus: mhi: Remove auto-start option")
>> >> 
>> >> interacting with commit
>> >> 
>> >>   1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
>> >> 
>> >> from the net-next tree.
>> >> 
>> >> I applied the following merge fix patch, but maybe more is required.
>> >> Even if so, this could be fixed now in the net-next tree.
>> >> 
>> >> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> >> Date: Mon, 28 Sep 2020 18:39:41 +1000
>> >> Subject: [PATCH] fix up for "ath11k: register MHI controller device for QCA6390"
>> >> 
>> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> >
>> > Sorry, I forgot to submit a patch against net-next for fixing this while merging
>> > the MHI change.
>> 
>> Try to notify the ath11k list (CCed) whenever changing MHI API so that
>> we (ath11k folks) can be prepared for any major changes.
>> 
>
> Okay sure, will do!

Thanks. It's important that ath11k is taken into account while making
changes to MHI, otherwise there can easily be regressions.

I was looking at commit ed39d7816885 ("bus: mhi: Remove auto-start
option") and noticed this in the commit log:

    This is really up to the MHI device(channel) driver to manage the state
    of its channels.

So does this mean we have to make changes in ath11k to accomodate this?
I haven't tested linux-next yet.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
