Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3C7C433DB
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 18:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D90614A7
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 18:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D90614A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8dsWteQnbr3LO3wrFZdNB1r1njxrk7IIIQxHhAQDSgY=; b=RKLeBfSADEq0mGV4z/foAyoXe
	qK0+dRIDx3IFVinUD3JBxJO6OIHp+VwZ+w1fzXqljbQGB3Il9f3YHkdA8QV/wE6tFfb4JR/ja4ydt
	FMykwN67tHe0MGka7EKrgEmKIO6WudEIE3eX9I51P3gQFLquP902i7ZZMyTR5DeMoItNmIQtJ62HC
	OTX8UyrhVbJgZBR8ItzGUolN/mEO0U9PoD57mXIuzMCgvIofhJhWng/1rYrtYBc+EOSc4BMvfzaPL
	ss9qiGRkGTRiDMAXeHtd6khyoKRLEvxJZV8ecwQmPx7icMgkezuPaMENWgJkS/nReSccgORECkvkE
	QMYPHo37A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGnj5-00018o-Q1; Mon, 01 Mar 2021 18:57:03 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGnj3-00018Q-LY
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 18:57:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614625022; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BWk43ZFWyb8uTChKPh44k6+sSYpbD1HwdQ8/aJZG5+A=;
 b=plpM0Vu163AGXlVoKIteAN6f6tdHLVa66c1shmljGL10Y0q0Gy3vA3WwHmCqO+EoGGAtMSr5
 W7o54fGnsSKPGeJNYDx8pBCHjnb5D+sHt2lwoI8PqSqlZdTHWOWhbztJG16J0w3MzLUbyDmH
 jyAfnn1HPuz5jA4zYQ84AlJAAiU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 603d38fa12935cdcee0e9b38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 18:56:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06B0BC43461; Mon,  1 Mar 2021 18:56:58 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D148C433ED;
 Mon,  1 Mar 2021 18:56:57 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 10:56:57 -0800
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <87o8g291d1.fsf@codeaurora.org>
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
 <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
 <20210226145245.GB70936@thinkpad> <87k0qrceih.fsf@tynnyri.adurom.net>
 <10e511e8dfa8d393ec4c4765668fe229@codeaurora.org>
 <87o8g291d1.fsf@codeaurora.org>
Message-ID: <e1ee69381ff328712fa010a3de44f70a@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_135702_346599_5AA33551 
X-CRM114-Status: GOOD (  26.24  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: bbhatt@codeaurora.org
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 hemantk@codeaurora.org, sricharan@codeaurora.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 2021-03-01 10:26 AM, Kalle Valo wrote:
> Bhaumik Bhatt <bbhatt@codeaurora.org> writes:
> 
>> On 2021-03-01 03:14 AM, Kalle Valo wrote:
>>> + ath11k list
>>> 
>>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>>> 
>>>> On Fri, Feb 26, 2021 at 04:12:49PM +0530, Gokul Sriram Palanisamy
>>>> wrote:
>>>>> On platforms with two or more identical mhi
>>>>> devices, qmi service will run with identical
>>>>> qrtr-node-id. Because of this identical ID,
>>>>> host qrtr-lookup cannot register more than one
>>>>> qmi service with identical node ID. Ultimately,
>>>>> only one qmi service will be avilable for the
>>>>> underlying drivers to communicate with.
>>>>> 
>>>>> On QCN9000, it implements a unique qrtr-node-id
>>>>> and qmi instance ID using a unique instance ID
>>>>> written to a debug register from host driver
>>>>> soon after SBL is loaded.
>>>>> 
>>>>> This change generates a unique instance ID from
>>>>> PCIe domain number and bus number, writes to the
>>>>> given debug register just after SBL is loaded so
>>>>> that it is available for FW when the QMI service
>>>>> is spawned.
>>>>> 
>>>>> sample:
>>>>> root@OpenWrt:/# qrtr-lookup
>>>>>   Service Version Instance Node  Port
>>>>>        15       1        0    8     1 Test service
>>>>>        69       1        8    8     2 ATH10k WLAN firmware service
>>>>>        15       1        0   24     1 Test service
>>>>>        69       1       24   24     2 ATH10k WLAN firmware service
>>>>> 
>>>>> Here 8 and 24 on column 3 (QMI Instance ID)
>>>>> and 4 (QRTR Node ID) are the node IDs that
>>>>> is unique per mhi device.
>>>>> 
>>>>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>>>>> ---
>>>>>  drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>> 
>>>>> diff --git a/drivers/bus/mhi/core/boot.c
>>>>> b/drivers/bus/mhi/core/boot.c
>>>>> index c2546bf..5e5dad5 100644
>>>>> --- a/drivers/bus/mhi/core/boot.c
>>>>> +++ b/drivers/bus/mhi/core/boot.c
>>>>> @@ -16,8 +16,12 @@
>>>>>  #include <linux/random.h>
>>>>>  #include <linux/slab.h>
>>>>>  #include <linux/wait.h>
>>>>> +#include <linux/pci.h>
>>>>>  #include "internal.h"
>>>>> 
>>>>> +#define QRTR_INSTANCE_MASK	0x000000FF
>>>>> +#define QRTR_INSTANCE_SHIFT	0
>>>>> +
>>>>>  /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>>>>>  void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>>>>>  		      struct image_info *img_info)
>>>>> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller
>>>>> *mhi_cntrl)
>>>>>  	const struct firmware *firmware = NULL;
>>>>>  	struct image_info *image_info;
>>>>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>>> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>>>> +	struct pci_bus *bus = pci_dev->bus;
>>>>> +	uint32_t instance;
>>>>>  	const char *fw_name;
>>>>>  	void *buf;
>>>>>  	dma_addr_t dma_addr;
>>>>> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct
>>>>> mhi_controller *mhi_cntrl)
>>>>>  		return;
>>>>>  	}
>>>>> 
>>>>> +	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 
>>>>> 0xF);
>>>>> +	instance &= QRTR_INSTANCE_MASK;
>>>>> +
>>>>> +	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
>>>>> +			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
>>>>> +			    QRTR_INSTANCE_SHIFT, instance);
>>>> 
>>>> You cannot not do this in MHI stack. Why can't you do this in the
>>>> MHI controller
>>>> specific to QCN9000? And btw, is QCN9000 supported in mainline?
>>> 
>>> I'm not sure what QCN9000 means but I'm guessing it's QCN9074. We 
>>> have
>>> initial QCN9074 support in ath11k but there are some issues still so
>>> it's not enabled by default (yet):
>>> 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=4e80946197a83a6115e308334618449b77696d6a
>>> 
>>> And I suspect we have this same qrtr issue with any ath11k PCI 
>>> device,
>>> including QCA6390, so this is not a QCN9074 specific problem.
>>> 
>>> BTW Gokul, please always CC the ath11k list when submitting patches
>>> which are related to ath11k.
>> 
>> QRTR sits on top of MHI so shouldn't this be handled outside of MHI
>> after MHI is operational? We cannot allow PCI code in MHI core driver
>> but this can be handled pre or post MHI power-up in whatever way you
>> desire that does not have to directly involve MHI.
> 
> Sure, makes sense. I was just replying to Mani's question about status
> of QCN9000 upstream support.
> 
> So should we handle this within ath11k, is that the right approach? I
> also suspect that for QCN9074 and QCA6390 we have to do this a bit
> differently, so it would be easier to handle the differences between
> devices (and firmware versions) inside ath11k.

Yes, I feel it would be better handled within ath11k. AFAIK, device 
(QCA/QCN)
populates the BHI ERRDBG registers when it wants to communicate a 
certain
problem/status to the host and it should not be used the other way 
round,
where host writes a configuration cookie for the device to boot-up in a
particular way. It feels hacky as of now unless an actual configuration
register is used.

As per BHI specification, these registers are permitted to be read-only 
for
the host and Read/Write for device only. I also don't see any BHI
configuration or general purpose registers that can be used to notify 
this
cookie. If one is found, we can talk about how to use them and can 
introduce
MHI patches for those.

I suggest exploring alternatives to this. I think Hemant and are in 
agreement
on this.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
