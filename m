Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYcp-0004EV-55
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 18:44:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v10 1/2] bus: mhi: Add mhi_queue_is_full function
References: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org>
 <20201105165708.31d24782@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201106051353.GA3473@work>
 <20201106080445.00588690@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <B9A7A95E-BD2F-49C0-A28C-56A8E6D903AC@linaro.org>
 <20201106083918.5ea0674b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Date: Tue, 10 Nov 2020 20:44:06 +0200
In-Reply-To: <20201106083918.5ea0674b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 (Jakub Kicinski's message of "Fri, 6 Nov 2020 08:39:18 -0800")
Message-ID: <87a6vp59xl.fsf@tynnyri.adurom.net>
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: willemdebruijn.kernel@gmail.com, Loic Poulain <loic.poulain@linaro.org>, jhugo@codeaurora.org, netdev@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, bbhatt@codeaurora.org, ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org, davem@davemloft.net

+ ath11k list

Jakub Kicinski <kuba@kernel.org> writes:

> On Fri, 06 Nov 2020 21:58:12 +0530 Manivannan Sadhasivam wrote:
>>>> Since you've applied now, what would you propose?  
>>>
>>> Do you need mhi_queue_is_full() in other branches, or are you just
>>> concerned about the conflicts?
>> 
>> Yes, I need this patch in mhi-next.
>> 
>>> I'm assuming the concern is just about the mhi/core patch, or would 
>>> you need to refactor something in the net driver as well?  
>> 
>> Just the mhi_queue_is_full() patch. 
>
> Okay, I think you can just apply that patch to your tree again and git
> should figure out it's a duplicate. Not optimal, because the change will
> have two hashes, but the function is trivial, shouldn't be an issue
> even if conflict happens.
>
> Will you need it in wireless (ath11k), or only in other trees?
>
> If it ends up in the wireless tree Dave or I will do the resolution when
> we pull from Kalle so it won't even appear to Linus (but then it should
> go into wireless through an immutable branch).

I think in the next few releases we need close coordination between mhi
and ath11k, both are in active development and there can be changes
which break ath11k functionality. Let's see how this goes.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
