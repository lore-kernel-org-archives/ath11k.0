Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C0CC433EF
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 02:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdfCat8PENVpcmqsjc6898rYXWLBdc0uja2ZHjt0yeE=; b=Xlos4lgltRdlkfSC8rHhxc3oAA
	26P5/EoPF6CaUYQ1AOoUtxPyXvze5JhQ7j5AWmRCk9RgVglTUvEnKf4LAmgxvqy0O7aRBN8Q3KE1Z
	n9HC1Oi+pjk9UWumnt8MxBRwzDTDYyh57Ckv9Va8Bar39sx5S7FHyLye5BXyXst1z6Oh/hidM+bgC
	ap2K8ijSGAPhe2EeD2/fjXNT5s5otrSR768n3K5RR5KSZH0ghy/60QOXle3tkcHAwJr2KB66lIhpa
	yMX8E0vz12DCtVUsQQXE88pXVuCuKfqKkCDBuUaMQvAQcJKHk1+apqduxqn8ijN5kCSHDFyr2Mw2G
	5D78m23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moyg4-00EgVk-6e; Mon, 22 Nov 2021 02:03:28 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moyg1-00EgVI-7t
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 02:03:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637546604; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AQFxkZProo07+TWCM6E8Dtsd0v8dLsmpW22oQG9wnu0=;
 b=ubK48l+D9p/XI8k8zCOWmqk20pluN7v6t0kRlmUjbfLrVCLbist+n6L1F8e5mZdQpmBTxI8A
 CL6FkIL9+0H8cKxyYd0A48wfpMxiIeuX/At2NABCYscQ2tZHG/kPk6jcxKXaM66FaO7DG/2Q
 arOJ9bSb4LJFWLBXoFCLa4+TFXQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 619afa6bb920912d57b751e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 02:03:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 941B1C4360C; Mon, 22 Nov 2021 02:03:22 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BADB8C4338F;
 Mon, 22 Nov 2021 02:03:20 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 10:03:20 +0800
From: Baochen Qiang <bqiang@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/7] ath11k: support one MSI vector
In-Reply-To: <87tug8coor.fsf@codeaurora.org>
References: <20211026041616.4956-1-bqiang@codeaurora.org>
 <878rxpiudp.fsf@codeaurora.org>
 <72c4443df7de4f6fa4b87d2244766c85@codeaurora.org>
 <87tug8coor.fsf@codeaurora.org>
Message-ID: <58ccb58c0b1576f121fcf98fecf391d5@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_180325_390479_932B3D8A 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-11-19 20:31, Kalle Valo wrote:
> Baochen Qiang <bqiang@codeaurora.org> writes:
> 
>> On 2021-11-15 18:30, Kalle Valo wrote:
>>> Baochen Qiang <bqiang@codeaurora.org> writes:
>>> 
>>>> This patch set is to support one MSI vector for QCA6390.
>>>> 
>>>> Depends-On:
>>>>   1. ath11k: Fix crash caused by uninitialized TX ring
>>>>   
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/
>>>> 
>>>> Baochen Qiang (1):
>>>>   ath11k: Set IRQ affinity to CPU0 in case of one MSI vector
>>>> 
>>>> Carl Huang (6):
>>>>   ath11k: get msi_data again after request_irq is called
>>>>   ath11k: add CE and ext IRQ flag to indicate irq_handler
>>>>   ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
>>>>   ath11k: refactor multiple MSI vector implementation
>>>>   ath11k: supports one MSI vector
>>>>   ath11k: do not restore ASPM in case of single MSI vector
>>> 
>>> I assume this is v2 of Carl's patchset:
>>> 
>>> https://patchwork.kernel.org/project/linux-wireless/cover/20201223030225.2345-1-cjhuang@codeaurora.org/
>>> 
>>> Can you provide a changelog? No need to resend because of that, just 
>>> a
>>> reply to this thread enough.
>> 
>> Hi Kalle, this is the changelog:
>> 
>> 1. changes by Kalle based on Carl's v1:
>> 
>> * add a log message for MSI vector count
>> * add a log message when disabling ASPM
>> * patch 1: fix error handling in ath11k_pci_probe()
>> * patch 1: simplify ath11k_pci_config_msi_data()
>> * patch 2: convert booleans to set_bit() & co for atomic access
>> * patch 2:__ath11k_pci_ext_irq_disable(): fix compilation
>> * patch 4: bool vectors_32_capability to set_bit() for atomic access
>> * patch 4: ath11k_mhi_get_msi(): don't use ? operator
>> * improve commits logs a bit
>> 
>> 2. changes by Baochen based on Kalle's version:
>> 
>> * add a new patch: "ath11k: Set IRQ affinity to CPU0 in case of one
>> MSI vector"
>> * address Jeff's comments on "ath11k: do not restore ASPM in case of
>> single MSI vector":
>> 	change debug info from "disabling PCI ASPM ..." to "leaving
>> PCI ASPM disabled ..."
>> * change error handling in patch "ath11k: get msi_data again after
>> request_irq is called"
>> * address Vasanth's comments on "ath11k: refactor multiple msi vector
>> implementation"
> 
> Thanks. I shortly tested this patchset (commit 5d9dd5b3db33 in
> master-pending) on a NUC x86 box and Dell XPS 13 9310 laptop using
> QCA6390 hw2.0, both with 32 MSI vectors (VT-d enabled in BIOS) and 1 
> MSI
> vector (VT-d disabled in BIOS). No issues found, and also suspend works
> fine for me. So I think we have solved all the stability issues.

Great to hear that. But one more thing Kalle, have you met the issue 
which is originally reported here 
https://jira-dc.qualcomm.com/jira/browse/LUW-3 ?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
