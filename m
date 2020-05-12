Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQ8D-0005iH-26
 for ath11k@lists.infradead.org; Tue, 12 May 2020 08:19:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 4/4] ath11k: Register mhi controller device for qca6390
References: <20200508085850.23363-1-govinds@codeaurora.org>
 <20200508085850.23363-5-govinds@codeaurora.org>
 <87d07a4acz.fsf@kamboji.qca.qualcomm.com>
 <20200512071323.GI4928@Mani-XPS-13-9360>
Date: Tue, 12 May 2020 11:19:04 +0300
In-Reply-To: <20200512071323.GI4928@Mani-XPS-13-9360> (Manivannan Sadhasivam's
 message of "Tue, 12 May 2020 12:43:23 +0530")
Message-ID: <871rnp4lc7.fsf@kamboji.qca.qualcomm.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> Hi Kalle,
>
> On Mon, May 11, 2020 at 09:03:56PM +0300, Kalle Valo wrote:
>> 
>> Govind Singh <govinds@codeaurora.org> writes:
>> 
>> >  config ATH11K_PCI
>> >  	tristate "Qualcomm Technologies 802.11ax chipset PCI support"
>> > -	depends on ATH11K && PCI
>> > +	depends on ATH11K && PCI && MHI_BUS
>> >  	---help---
>> >  	  This module adds support for PCIE bus
>> 
>> Currently ATH11K_PCI is not visible if MHI_BUS is disabled, which I'm
>> worried will confuse the users. I wonder if we should use 'select
>> MHI_BUS' instead? That way ATH11K_PCI would be visible even if MHI_BUS
>> is disabled.
>> 
>
> Right, this sounds good to me.

Good, I added that in the pending branch.

>> And what about QRTR_MHI? Mani, any suggestions?
>> 
>
> Are you asking for Kconfig dependency? If yes, then you need to select it here
> also as you can't do much without it.

Ok, I added QRTR_MHI to Kconfig as well I also had to add "select MHI"
as othwerwise I would get this warning:

WARNING: unmet direct dependencies detected for QRTR_MHI
  Depends on [n]: NET [=y] && QRTR [=n] && MHI_BUS [=m]
  Selected by [m]:
  - ATH11K_PCI [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH11K [=m] && PCI [=y]

So now Kconfig looks like:

config ATH11K_PCI
	tristate "Qualcomm Technologies 802.11ax chipset PCI support (work in-progress)"
	depends on ATH11K && PCI
	select MHI_BUS
	select QRTR
	select QRTR_MHI
	---help---
	  This module adds support for PCIE bus

Govind&Mani, please check my changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5ebf69d1db8b027671b642e3ba0bec3d7c73acb7

> Btw, I'm not CCed for the patch so I haven't looked at it.

This patchset is in my pending branch, link above.

> But we have made few changes to the MHI stack which will impact the
> controller drivers.

Oh, that will create problems. What kind of changes are needed in
ath11k?

> So I'd suggest you to rebase MHI controller patch on top of mhi-next
> [1]. The proposed changes in MHI will hopefully land in 5.8.

I cannot rebase on top mhi-next as my patches go through net-next. One
option I can think of is that I'll pull (not rebase!) mhi-next to my
tree, but I would need to check with David Miller first and I'm not sure
if it's worth the trouble. I think easiest is that we find minimal
possible changes needed to accommodate the new MHI interface and then
inform Linus and Stephen when do the merges.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-next

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
