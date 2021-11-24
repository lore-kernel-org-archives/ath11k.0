Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B8AC433F5
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7XRgJr8a2qy4hc+R0aUQM/YZ/ex0kJRqCnD+xdAvfA=; b=IOB/0/Zis2DO3a
	DMS/3ZloqrxeKLhvZ3KtqnEBpXf/ROQoDcBapFzOkXCSirdQLDZntpFfFrk60GrLG6geCp46tyxpc
	oLxq6EIXjqo7C/3+rBJq5yJjgvV23gRAepArSIwtmpG5RRZ/rtfE6PG9yrmj53ATBiA3429fmmee2
	0gwtWfia3SIsDtVF5Kqc7/1paaFA01VdlJHFGz0Uffa3jkiPzIQk9FrvCkYd5qwFHpbmE4CJvJTT9
	Uaiwk57QVHLe3PJD2NHXopZP05eu5eGlLd1WzpPnaz8S85GeLsk8+AwdzCD/goYdWRLvI8Wcm3zeI
	fC0LMfmqDusVQvlZybZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpodc-004P5N-B6; Wed, 24 Nov 2021 09:32:24 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpodZ-004P4s-ER
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 09:32:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637746341; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=BPZ/PZqqr2eaoRdhc9r6w0KtEvGDFJNe8o53JoBGPLc=;
 b=PtTLYyBUn4yurzX0Oha0Q0dtnLpIkICMMwWem6Sgt+65dN8JxzoZezZ+nMUzGYOwytMMOKKw
 k7+u/4piYmW/WgCb0Om8WPDTnQZYDncAf9tAIIJdrUeVRKTRkdzJyqiEj8CqysFHrSS4vzmT
 Kj5tWv1/QIo5esnYxDNAsQjzWwM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619e06a4465c4a723b45c1dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 09:32:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E442BC43616; Wed, 24 Nov 2021 09:32:19 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A31D1C4338F;
 Wed, 24 Nov 2021 09:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A31D1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Rama McIntosh <face00@gmail.com>
Cc: ath11k@lists.infradead.org,  rama@myutil.com
Subject: Re: [PATCH RFT] ath11k: pci: support platforms with one MSI vector
References: <CAPVWjyNcZuDTRrqCyWJkoU49UzKs8QyZHfKC5PO8JzdMzjQ8rg@mail.gmail.com>
Date: Wed, 24 Nov 2021 11:32:15 +0200
In-Reply-To: <CAPVWjyNcZuDTRrqCyWJkoU49UzKs8QyZHfKC5PO8JzdMzjQ8rg@mail.gmail.com>
 (Rama McIntosh's message of "Fri, 22 Oct 2021 13:16:38 -1000")
Message-ID: <87k0gx6grk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_013221_576290_D9F51ECC 
X-CRM114-Status: GOOD (  16.84  )
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

Rama McIntosh <face00@gmail.com> writes:

> Hi Kalle and Carl,
>
> Nice, I missed this patch.    While my hardware supports multi-vector
> msi and the driver works great on fedora (dell 9700), I run Qubes-os
> and qemu hw/xen currently only supports a single msi vector.   I've
> been looking into fixing qemu to support multi-vector msi...but don't
> have a lot of free time and am still learning how pci and qemu all
> work (should be doable, qemu supports multi vector for msix, just not
> msi).
>
> I applied this patch to the latest Qubes-os 4.1 alpha (kernel
> 5.10.71).      Now instead of the msi initialization error (-28),  I
> get a page fault and kernel panic in my sys-net vm.   I tried
> permissive mode and no-strict-rest mode too, same effect (i.e 'qvm-pci
> attach sys-net-clone-1  dom0:05_00.0 --persistent -o permissive=true
> -o no-strict-reset=true').    However, I'm excited and I will see if I
> can fix this patch to work with xen as soon as I have some time off
> work.

1 MSI vector support is applied now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=ac6e73483f7b

The plan is is that it will be in v5.17.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
