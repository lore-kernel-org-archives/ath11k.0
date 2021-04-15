Return-Path: <SRS0=AwSP=JM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842CFC433ED
	for <ath11k@archiver.kernel.org>; Thu, 15 Apr 2021 09:48:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F22661166
	for <ath11k@archiver.kernel.org>; Thu, 15 Apr 2021 09:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F22661166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CBKPJ+r99BXUBAlsTGyhBLJvrdW/ueROdKGu+MHHITY=; b=iM9RvjBoC9Gp+pX0sDYKYtSeo
	EHRwXaQvWWBR4udQu5vbqticTzE+6MmpccgTnbOZfIx4lz/EP1d1bwczqivzS9Zrrv6mau845eNEn
	BkqY1Xr7YtR0AlmvoqTbAkwVicfZa433VxIS1l/Ot52urc3FhgRqtPTgVG7sE2RVOYQUiJNXqQsVz
	9UK9vlGsKbACifYDzuCekMLKyl3E9ulfxE7wVNsXw8NZcsGa4pPEBgPGCAESIxTfCLHBZNtfT23/0
	TJU4ARdonqfAxTzvlAnBkbR2vtOGxA9TQm2cc8wexMvluqQBftt4gTupel4M3DuVjr0fI99mnKnOI
	QdAWYkOPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWycG-00Fc6c-Up; Thu, 15 Apr 2021 09:48:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWybo-00Fc29-3S
 for ath11k@desiato.infradead.org; Thu, 15 Apr 2021 09:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ZcBhov79sfWJvsuSgoDp/0n2L0Kh6LYqF93sTiTF6Tc=; b=gm4tssEteqI/G73/K7Y8UHK7mn
 L33xJ5TOhLWRlnr8QxOvYvfOhtjyHrxKjVxJwZh07DzyzG+dJShrHxiWJju/gNl060RzJq/0Ut3SN
 d/gFNbHDq8t6+RIvPfwYiFSn0cvDg2vHCgyWD8wF/hcnLJGMcL5ZidwpakVvsOYLZ45cF2TX6pIHK
 BHIAc8AERLzQ8cDzZ+hYfNCdEGo+qoXfzwKxK54VCLIypauKdtgDQjd2/l5aIAyXzUaFCpdjOgMNm
 xje6XorXGo4obv2hCOZac3fNfo5Nztw6HWQwYjt1EObK9mXFy4G8ni/74X21LuSa8CnDUEU+FG2X7
 XMwAjeLA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWybj-008RWj-4F
 for ath11k@lists.infradead.org; Thu, 15 Apr 2021 09:48:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618480100; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZcBhov79sfWJvsuSgoDp/0n2L0Kh6LYqF93sTiTF6Tc=;
 b=LUlgz7zlj8qxtBbL6L3/y0FFfT9e+j4SW55J+umiJxPZYNVmURXdWCt/ZJPT8OUmu7dVkb5O
 K3KFSkfj8ODNhcMob7GA+IpiSuW9PwgyYaFJBfWPJIa1sSLFa+F+BfD1NXUwZkTDo83wLeYr
 OCqiCloHSZk44Vylsfpcz2Svd6g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60780bd6febcffa80fe27cbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Apr 2021 09:48:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 959BCC433CA; Thu, 15 Apr 2021 09:48:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bperumal)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B581C433CA;
 Thu, 15 Apr 2021 09:48:06 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 15 Apr 2021 15:18:06 +0530
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
To: =?UTF-8?Q?Andr=C3=A9_Eberle?= <andre.eberle@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k-qca crashing
In-Reply-To: <SN6PR02MB5520E3ADA594F9BA98E64B22E24D9@SN6PR02MB5520.namprd02.prod.outlook.com>
References: <SN6PR02MB5520E3ADA594F9BA98E64B22E24D9@SN6PR02MB5520.namprd02.prod.outlook.com>
Message-ID: <7da530f675a485bb2ccd397b4ad303fa@codeaurora.org>
X-Sender: bperumal@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024820_920979_67CDD3F9 
X-CRM114-Status: GOOD (  17.21  )
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

On 2021-04-15 14:58, Bhagavathi Perumal S wrote:
> Hello,
> 
> I have been using the ath11k wireless driver (qca version ie. QSDK) in
> a IPQ807x router, but I am facing crashes. Ethernet and WAN work fine.
> 
> 
> I can connect to WiFi, and receive an address from DHCP. I can even
> send/receive a number of packets via the wifi nic, but if I try to,
> say, send/recv a larger number of packets at once (like visiting a
> webpage), the kernel crashes. I have been digging into the NSS and
> ath11k drivers trying to isolate the problem, but so far my debugging
> attempts have failed. I have so far failed to set up kgdb on qsdk
> also, so no help on that front.
> 
> What is the best way to debug the ath11k drivers for such problems? Or
> at least try to determine if the crashes are from the driver, or
> elsewhere in the NSS system?

Serial logs and crash dump will help to debug the kernel crashes. Please 
share dmesg logs and serial logs from power on and please share call 
stack details during crash if any.

> 
> --
> 
> ath11k mailing list
> 
> ath11k@lists.infradead.org
> 
> http://lists.infradead.org/mailman/listinfo/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
