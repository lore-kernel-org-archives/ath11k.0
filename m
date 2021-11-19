Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A11C433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729C561353
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 729C561353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJzoz4knIC26fVK+H/1woKjh/dXFuJzxWwfzljD5e4w=; b=L63StfBbGPm0ux
	vgSSNYIFSWomM7mbYjq2cv1GM3UxheZXfOvB5kXToF3FrxiK2GETr73XTUso1htLX/RCCR6Vd5vyx
	pjxV1ztTtG7Vkn8Bg/NYi5Qxcz4mrU2bkoFXDhCjblW2zUV4lYTpEFuIZA66wZmq0P0SYkNsbaPD3
	3ww5RkbnUqaWaPzWOc/AZ6zjxsDStdUgVcp97kvLC64KxQbNk6v6BCc8hOqLVRR9LdFGL3eIKpmiX
	OM7eTMg5/kAa1BVHly+PER5nL/yVga8GdYBm5zaDC88Vu+DPJjaxNspB6L2upnHXyogbifxATYRQP
	XVddwpJ7QUDbUmZa9YwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo32v-00ANuP-Hk; Fri, 19 Nov 2021 12:31:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo32s-00ANtn-Fq
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 12:31:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637325068; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TFZh9Hncx+RwLUP8/sm4gFsZtAnZ+rgc6Kbset6/D6Q=;
 b=jpnYX3mm5TKrGUIroAvUwZVKZRXdUL9XFuRGyMZiNDoC7CxlyoP65QL2A/CxtegUjsGU7Wfs
 mdMK8lktziwA4sh7NyTTb6Q0lU1G+IRK59Uh2zi28DYmSi8553OLSkpkr3NdAYa/K7FnNGUS
 07II43HiW+JdYfzRgLPGAX0Y7bM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6197990a5bbbed1f70398ce1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 12:31:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EB8F2C4360D; Fri, 19 Nov 2021 12:31:05 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C9EDC43616;
 Fri, 19 Nov 2021 12:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9C9EDC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/7] ath11k: support one MSI vector
References: <20211026041616.4956-1-bqiang@codeaurora.org>
 <878rxpiudp.fsf@codeaurora.org>
 <72c4443df7de4f6fa4b87d2244766c85@codeaurora.org>
Date: Fri, 19 Nov 2021 14:31:00 +0200
In-Reply-To: <72c4443df7de4f6fa4b87d2244766c85@codeaurora.org> (Baochen
 Qiang's message of "Tue, 16 Nov 2021 10:50:00 +0800")
Message-ID: <87tug8coor.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_043110_619414_8D2DF85A 
X-CRM114-Status: GOOD (  19.71  )
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

Baochen Qiang <bqiang@codeaurora.org> writes:

> On 2021-11-15 18:30, Kalle Valo wrote:
>> Baochen Qiang <bqiang@codeaurora.org> writes:
>>
>>> This patch set is to support one MSI vector for QCA6390.
>>>
>>> Depends-On:
>>>   1. ath11k: Fix crash caused by uninitialized TX ring
>>>   https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/
>>>
>>> Baochen Qiang (1):
>>>   ath11k: Set IRQ affinity to CPU0 in case of one MSI vector
>>>
>>> Carl Huang (6):
>>>   ath11k: get msi_data again after request_irq is called
>>>   ath11k: add CE and ext IRQ flag to indicate irq_handler
>>>   ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
>>>   ath11k: refactor multiple MSI vector implementation
>>>   ath11k: supports one MSI vector
>>>   ath11k: do not restore ASPM in case of single MSI vector
>>
>> I assume this is v2 of Carl's patchset:
>>
>> https://patchwork.kernel.org/project/linux-wireless/cover/20201223030225.2345-1-cjhuang@codeaurora.org/
>>
>> Can you provide a changelog? No need to resend because of that, just a
>> reply to this thread enough.
>
> Hi Kalle, this is the changelog:
>
> 1. changes by Kalle based on Carl's v1:
>
> * add a log message for MSI vector count
> * add a log message when disabling ASPM
> * patch 1: fix error handling in ath11k_pci_probe()
> * patch 1: simplify ath11k_pci_config_msi_data()
> * patch 2: convert booleans to set_bit() & co for atomic access
> * patch 2:__ath11k_pci_ext_irq_disable(): fix compilation
> * patch 4: bool vectors_32_capability to set_bit() for atomic access
> * patch 4: ath11k_mhi_get_msi(): don't use ? operator
> * improve commits logs a bit
>
> 2. changes by Baochen based on Kalle's version:
>
> * add a new patch: "ath11k: Set IRQ affinity to CPU0 in case of one
> MSI vector"
> * address Jeff's comments on "ath11k: do not restore ASPM in case of
> single MSI vector":
> 	change debug info from "disabling PCI ASPM ..." to "leaving
> PCI ASPM disabled ..."
> * change error handling in patch "ath11k: get msi_data again after
> request_irq is called"
> * address Vasanth's comments on "ath11k: refactor multiple msi vector
> implementation"

Thanks. I shortly tested this patchset (commit 5d9dd5b3db33 in
master-pending) on a NUC x86 box and Dell XPS 13 9310 laptop using
QCA6390 hw2.0, both with 32 MSI vectors (VT-d enabled in BIOS) and 1 MSI
vector (VT-d disabled in BIOS). No issues found, and also suspend works
fine for me. So I think we have solved all the stability issues.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
