Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE98C61DB3
	for <ath11k@archiver.kernel.org>; Fri, 13 Jan 2023 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fb+6g7bGHul5QlsL4ps10kVq9VYdFTcov1xSOCbqZ/c=; b=D0p9dB1tqU2o0c
	zyHZDtYm1w+lTfPHLmHsTPxIimDMvGiLfGwp+SFFZ8fStEZsR65ZFoiAT9MC2IhRssLGhtx7AcF2Q
	bLBHJOqC6TIthhyfhFi87k5mvVhBuqQmVsF5yFjqbvkNp5tJ3z47BcvtxhPPswlWfqh3JcU7lcXbq
	UE9cnMPFpQD1ddYnJ0PKQVECpaA4x3S2TGJsV5Yp0a03NmQMj7pr8FChF0ihnhfhKMGOrhIAT+jzL
	/MqJB5j5Gu2eEEPMQThe06ILAT/DL0TkMzByldE0LFNGf8q7vzoJQfRETaG5I0LRgR0DWEpgLc+Bh
	4BWZaaJYkVuqJYP6dCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJGI-002ZIS-Gx; Fri, 13 Jan 2023 12:34:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJGG-002ZHh-CP
	for ath11k@lists.infradead.org; Fri, 13 Jan 2023 12:34:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC8E761AE4;
	Fri, 13 Jan 2023 12:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F53DC433EF;
	Fri, 13 Jan 2023 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673613259;
	bh=XP7ELr/LV2NXiee4p7xuSDJGbblVNPXN0TlgLpZgcIE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Bn0w/TnJdLBor9PQDumi9Q23SdCu6qt+3gH3kLnq72WrlX4vmxEGjLKpxRp57/PkK
	 y5icRNwk0UW/cOAh7FTETakjRTshPjttLpPVGNb533fEHkcfXTOt0g29OxiUNEK17p
	 6Cr4/xO1Wzz/UkYoPhprsGEFKUReT8Zr1MjD/D8CMGO+3PXvctZNJvrW33uyLs5h83
	 u6wLRgwOiqeW/n9Q3qMuiihbpXBUOmOw9t+NkEFBA9h0UVYM9Ll69+FjkNLbO+gPfQ
	 ZzFWDFUhoyJ6kkeL1P9sxB8DS8ojUYpRamIG4+JOyjkZx+4yB/k2eSYA8vNfp7hn30
	 o6VShmEMZAF6A==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: ath11k@lists.infradead.org,  mhi@lists.linux.dev,  linux-wireless@vger.kernel.org,  robert.marko@sartura.hr
Subject: Re: [PATCH RFC] ath11k: Add multiple QCN9074 devices support
References: <20230111170033.32454-1-kvalo@kernel.org>
	<20230112103824.GD4782@thinkpad>
Date: Fri, 13 Jan 2023 14:34:15 +0200
In-Reply-To: <20230112103824.GD4782@thinkpad> (Manivannan Sadhasivam's message
	of "Thu, 12 Jan 2023 16:08:24 +0530")
Message-ID: <87edryd35k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_043420_480538_98617950 
X-CRM114-Status: GOOD (  17.10  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Wed, Jan 11, 2023 at 07:00:33PM +0200, Kalle Valo wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>> 
>> On platforms with two or more QCN9074 devices, the QMI service will run with
>> identical QRTR ids. qmi_add_lookup() is called with same qmi.service_ins_id.
>
> identical QRTR instance ID.

Will fix.

>> Kalle's comments:
>> 
>> Depends on: https://patchwork.kernel.org/project/linux-wireless/list/?series=710862&order=date
>> 
>> It's also possible to do a simple test by just changing the test
>> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" to true, no
>> extra patches should be needed.
>> 
>> I don't have a test setup for this so compile tested only. But I assume Praneesh has tested this.
>> 
>> This is alternative approach to Robert's patchset:
>> 
>> https://patchwork.kernel.org/project/linux-wireless/list/?series=692423&state=*&order=date
>> 
>
> For what devices the compatible firmware is available?

Currently only recent QCN9074 firmware releases support this, but I
don't from which release onwards.

> Any plan to fix the devices with old firmware?

In my opinion all ath11k PCI firmwares should support this, but AFAIK
they do not. I'll push the firmware teams to implement this but it's
another story if I succeed :)

>> +static void ath11k_pci_update_qrtr_node_id(struct ath11k_base *ab)
>
> The function name says update node_id but instance_id is what getting
> updated.

Will fix.

Thanks for the review!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
