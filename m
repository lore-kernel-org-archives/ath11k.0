Return-Path: <SRS0=S5NU=QD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79086C433F5
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 02:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D61661A58
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 02:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D61661A58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xml0HdL8snSPGCEq8eruEV3FftkWWM9F4lNz+j811w=; b=vs3rTEcV2dQoD9XqjumHEYYxA9
	ssvH4O0e7WY+vSvooGnbsNrAZka5V4rj9FmOiclA5AVMkrCJ5FQPAcrHH2fodO9K00+1xH7eHuSRE
	ycJu15GPX91kiZ/HHdS2HF1IzFaamKEEXXruxipTDrS3Gckn19Y5/HMRXAQE6HgFDRwkVavnlQKsG
	Atjy9vZIUKRoIeJ66PM05Ut1AWLMwF6QKhrI3AWflq78KopSb5nH5wn9YBFnV1ba19peNlA9TfSQj
	Rlrkp9Hkw8ixE9dO28N0OgsvzLBpVlSuoyymUqGuQrp/7TN6xw6qX8F09A2bCktBRIr1md2g06/bo
	XdEW3FPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmoXu-0008cL-80; Tue, 16 Nov 2021 02:50:06 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmoXr-0008am-92
 for ath11k@lists.infradead.org; Tue, 16 Nov 2021 02:50:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637031002; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lvjB3OIOSBhCBlH7980q0leDPyQYRsjyuAGHlxg2r14=;
 b=puCfTUYomR7MKB6zME8yNt9JixP3AFhUHdo9oQK1C2DVE9Sk3Bn+oaYzlmAWD8Y1pS378lBG
 pTHul2soZWD6EilULQgBHB/1EbikjcTPY+M3y2gSnaoLXBFsD+1RuXO0BFsyTtbF1/c/eAhB
 WqglSST+xZf96KvdIiTMT07pGyk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61931c594db423396669f8d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 02:50:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9E76C00910; Tue, 16 Nov 2021 02:50:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7094FC43616;
 Tue, 16 Nov 2021 02:50:00 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 16 Nov 2021 10:50:00 +0800
From: Baochen Qiang <bqiang@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/7] ath11k: support one MSI vector
In-Reply-To: <878rxpiudp.fsf@codeaurora.org>
References: <20211026041616.4956-1-bqiang@codeaurora.org>
 <878rxpiudp.fsf@codeaurora.org>
Message-ID: <72c4443df7de4f6fa4b87d2244766c85@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_185003_434843_FBAB2BA6 
X-CRM114-Status: GOOD (  13.22  )
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

On 2021-11-15 18:30, Kalle Valo wrote:
> Baochen Qiang <bqiang@codeaurora.org> writes:
> 
>> This patch set is to support one MSI vector for QCA6390.
>> 
>> Depends-On:
>>   1. ath11k: Fix crash caused by uninitialized TX ring
>>   
>> https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/
>> 
>> Baochen Qiang (1):
>>   ath11k: Set IRQ affinity to CPU0 in case of one MSI vector
>> 
>> Carl Huang (6):
>>   ath11k: get msi_data again after request_irq is called
>>   ath11k: add CE and ext IRQ flag to indicate irq_handler
>>   ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
>>   ath11k: refactor multiple MSI vector implementation
>>   ath11k: supports one MSI vector
>>   ath11k: do not restore ASPM in case of single MSI vector
> 
> I assume this is v2 of Carl's patchset:
> 
> https://patchwork.kernel.org/project/linux-wireless/cover/20201223030225.2345-1-cjhuang@codeaurora.org/
> 
> Can you provide a changelog? No need to resend because of that, just a
> reply to this thread enough.

Hi Kalle, this is the changelog:

1. changes by Kalle based on Carl's v1:

* add a log message for MSI vector count
* add a log message when disabling ASPM
* patch 1: fix error handling in ath11k_pci_probe()
* patch 1: simplify ath11k_pci_config_msi_data()
* patch 2: convert booleans to set_bit() & co for atomic access
* patch 2:__ath11k_pci_ext_irq_disable(): fix compilation
* patch 4: bool vectors_32_capability to set_bit() for atomic access
* patch 4: ath11k_mhi_get_msi(): don't use ? operator
* improve commits logs a bit

2. changes by Baochen based on Kalle's version:

* add a new patch: "ath11k: Set IRQ affinity to CPU0 in case of one MSI 
vector"
* address Jeff's comments on "ath11k: do not restore ASPM in case of 
single MSI vector":
	change debug info from "disabling PCI ASPM ..." to "leaving PCI ASPM 
disabled ..."
* change error handling in patch "ath11k: get msi_data again after 
request_irq is called"
* address Vasanth's comments on "ath11k: refactor multiple msi vector 
implementation"

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
