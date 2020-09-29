Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN8yF-00055R-5s
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 06:18:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
References: <20200928184230.2d973291@canb.auug.org.au>
 <20200928091035.GA11515@linux> <87eemmfdn3.fsf@codeaurora.org>
 <20200928094704.GB11515@linux> <87a6x9g89a.fsf@codeaurora.org>
 <20200928170403.GA2222@Mani-XPS-13-9360>
Date: Tue, 29 Sep 2020 09:18:30 +0300
In-Reply-To: <20200928170403.GA2222@Mani-XPS-13-9360> (Manivannan Sadhasivam's
 message of "Mon, 28 Sep 2020 22:34:04 +0530")
Message-ID: <875z7xf6mh.fsf@codeaurora.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Loic Poulain <loic.poulain@linaro.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath11k@lists.infradead.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Govind Singh <govinds@codeaurora.org>, David Miller <davem@davemloft.net>

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

>> I was looking at commit ed39d7816885 ("bus: mhi: Remove auto-start
>> option") and noticed this in the commit log:
>> 
>>     This is really up to the MHI device(channel) driver to manage the state
>>     of its channels.
>> 
>> So does this mean we have to make changes in ath11k to accomodate this?
>
> Nope. The change is needed in the MHI client driver like qrtr which is already
> taken care: https://lkml.org/lkml/2020/9/28/30

Ok, that's good.

> Will make sure to include ath11k list for any future API changes.

Thanks!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
