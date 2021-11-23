Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46497C433F5
	for <ath11k@archiver.kernel.org>; Tue, 23 Nov 2021 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yzJ80vNCacuoP3BM/G5v384Z9kslV46hqHUeOrm3p8=; b=EdRusG7gaPgbwiDXLgvYyScOCQ
	RNHVV+louI0HE9Q+DPOkJAR8BEtn4kIY60us7TA2q0HvQ9DyidekCYYQxhZ594YwIO/mGc2Ul5h/u
	xI2OSeldFVCqw6cOQ1HeRVPo2bsQs54T4kpBG13TgaqzhO6sdBWSrt/Z0JtGi5QfHIzTEsQ5B/JAZ
	Eru6i7cIxirEtADl/3BZNW06ErrleCaz8uxofSCH0dYPPcou5ZRomACwfmmOMaI0P6XWnDYkaeuyh
	Hbcj+LFDBk2QI60a23Bb/UYonyf/rBs+S/y5wrdDNyG5FByO+1cQzC6vu51pUGqLizoanf58PF1Kj
	ztUTLaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTEl-001kKy-KN; Tue, 23 Nov 2021 10:41:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTDC-001jpq-UQ
 for ath11k@lists.infradead.org; Tue, 23 Nov 2021 10:39:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637663984; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3nwGKStbNyFN0QQbQljMgm6itmwD1QOYjOmKyUbV4GU=;
 b=X89yzDN5oQa4caYdH9zm3iZprxtFjfmJ5N+OBzIoJYhGPgX0vDywgTvqG4/niZrnR4gr0KZZ
 XFsSr/agDYdbsQeXFa4Q84vG30tjCUoNpiVX4qUioic3+HsDcPGFqD47Q+dhW8btQkDLSUBK
 houaWfMAkT7uK1uAsFv2f5nRmgs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 619cc4da4fca5da46dedea9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 10:39:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F166DC43618; Tue, 23 Nov 2021 10:39:21 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7764CC4360C;
 Tue, 23 Nov 2021 10:39:21 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 23 Nov 2021 16:09:21 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
In-Reply-To: <2802525.9g7TWp2vRq@ripper>
References: <1637504521-30997-1-git-send-email-akolli@codeaurora.org>
 <1724585.GBsqGgcNsD@sven-l14>
 <a6f4fd77b1f8729368fee13a435fe652@codeaurora.org>
 <2802525.9g7TWp2vRq@ripper>
Message-ID: <69b243375da1358f39955186fb69a55d@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023944_824713_D74588E1 
X-CRM114-Status: GOOD (  14.21  )
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

On 2021-11-22 13:20, Sven Eckelmann wrote:
> On Monday, 22 November 2021 07:12:27 CET Anilkumar Kolli wrote:
> [...]
>> >> +			start = reg[0] + reg[1];
>> >> +			size = reg[2] + reg[3];
>> >
>> > See my messages for v2 [1] and v3 [2]
>> >
>> >
>> Thanks for the review,
>> 
>> Here addresses are always within 32-bit.
>> so I will change the API to read only 2 integers and update start
>> addresss and size.
> 
> The size of address and size depends on the reserved-memory node - not 
> the
> qcn9074 node. So please don't make such assumptions in your code.
> 

Yes, correct.

of_address_to_resource() returns start/end address properly.
I will update and send next version.

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
