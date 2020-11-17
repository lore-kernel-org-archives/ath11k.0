Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kex7M-0007Be-8h
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 09:17:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
References: <20201117151225.6a50abf8@canb.auug.org.au>
 <20201117042359.GB7787@work> <20201117042841.GC7787@work>
Date: Tue, 17 Nov 2020 11:15:55 +0200
In-Reply-To: <20201117042841.GC7787@work> (Manivannan Sadhasivam's message of
 "Tue, 17 Nov 2020 09:58:41 +0530")
Message-ID: <87blfwz6lw.fsf@codeaurora.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Loic Poulain <loic.poulain@linaro.org>, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, ath11k@lists.infradead.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Tue, Nov 17, 2020 at 09:53:59AM +0530, Manivannan Sadhasivam wrote:
>> +ath11k list, kalle
>> 
>
> Oops... adding now
>
>> On Tue, Nov 17, 2020 at 03:12:25PM +1100, Stephen Rothwell wrote:
>> > Hi all,
>> > 
>> > After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
>> > failed like this:
>> > 
>> > drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct
>> > mhi_channel_config' has no member named 'auto_start'
>> >    27 |   .auto_start = false,
>> >       |    ^~~~~~~~~~
>> > drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct
>> > mhi_channel_config' has no member named 'auto_start'
>> >    42 |   .auto_start = false,
>> >       |    ^~~~~~~~~~
>> > drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct
>> > mhi_channel_config' has no member named 'auto_start'
>> >    57 |   .auto_start = true,
>> >       |    ^~~~~~~~~~
>> > drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct
>> > mhi_channel_config' has no member named 'auto_start'
>> >    72 |   .auto_start = true,
>> >       |    ^~~~~~~~~~
>> > 
>> > Caused by commit
>> > 
>> >   0cc1f3a385b2 ("bus: mhi: Remove auto-start option")
>> > 
>> 
>> The fixing patch [1] should've landed in ath-next. Kalle can you please
>> apply the patch on top of immutable branch?
>> 
>> Stephen, feel free to pick it up in the meantime.

I think this fix should be included in commit 0cc1f3a385b2 ("bus: mhi:
Remove auto-start option"), otherwise the build will always fail. I can
then pull this commmit from the MHI immutable branch to my ath.git tree
and from there it will go to wireless-drivers-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
