Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB0CCF8855
	for <ath11k@archiver.kernel.org>; Fri,  4 Oct 2024 19:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NR8cdtjLVf6SxCtdUlKwQ/jcTuvblwcyuv2K09YRrQ=; b=HhIYlCkiptzXsF5p0Aqt1AEv23
	7toifS7ijRya7f+QQOLhhvPdTJ7W+ydlAjHW9LCq5CTd3LtO2TFO0STm+566z9Lk3oROvV1HuWpYu
	cxCvAPXnko83oEKIR4oYM1qhy2ZV+7llxjvsJc/sLVRsx4Rd+kWyvNvY9+e1s/L2wngUo//LAtOFT
	zsZpZprmJJkH/IOLQ4ty5FIHaGztXKjTYRQMwNj9tjgwtGUCyI/kp2Uxy8Jyg8GG50Tgd+8OAWvkg
	WIPCid4x+vSzi7RZsf6graPsSQ5GbfaZvJ0DWhLLQYBt3YgxJVesiq4EaS///E3VDXdcySaCxu87D
	OSoQZjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swnpN-0000000Ds77-05Jt;
	Fri, 04 Oct 2024 19:19:01 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnpJ-0000000Ds6R-3AWl
	for ath11k@lists.infradead.org;
	Fri, 04 Oct 2024 19:18:59 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 46AA034006F;
	Fri,  4 Oct 2024 19:18:55 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id AB32913C2B0;
	Fri,  4 Oct 2024 12:18:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com AB32913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1728069534;
	bh=I6dS25FZ6+z7FaVOKobmQQ+yIGb8HYVDKgWBNaLgutk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VI3TTj1uWI/r3iz0u/wzVd3uLGxDghzj5V3Jeq8FbC37fKXL5Sa3U8qikFx/UshbV
	 PhQyGTvcDrd1dXj9J4ycW0RRdd3iergp5YeE+iP7o8sE76/V4IqnJeeec4PI6/oYLZ
	 24p0K90Dy6Mhlvnzx9nlSE3OhhnrCQoyimeiJEs4=
Message-ID: <d1e75a08-047d-7947-d51a-2e486efead77@candelatech.com>
Date: Fri, 4 Oct 2024 12:18:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Missing scan results with SCAN_FLAG_COLOCATED_6GHZ set
 (Ath11k/WCN6855)
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <cfb00919-678f-408d-9fb9-83fc24fee197@gmail.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <cfb00919-678f-408d-9fb9-83fc24fee197@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1728069536-ex0oB6e5GI3J
X-MDID-O: us5;ut7;1728069536;ex0oB6e5GI3J;<greearb@candelatech.com>;aae89045ff394e1bf2215a139f564027
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_121857_865697_6953FFA4 
X-CRM114-Status: GOOD (  26.33  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/4/24 11:46, James Prestwood wrote:
> Hi,
> 
> I've noticed that when setting the colocated flag much of the scan results are not appearing when they should be. This was seen in a large warehouse where our 
> network/SSID was using only the 6ghz band. There were other networks on 2.4/5ghz though, which maybe is having some effect, but those networks are not 
> broadcasting on 6ghz.
> 
> This first came to my attention when the majority of our clients were experiencing horrible signal quality. Upon looking at the logs and nl80211 messages to the 
> kernel IWD was issuing both limited 6ghz scans as well as full spectrum scans and only showing a few 6ghz results, like 1-2 BSS's which should not have been the 
> case. I was able to scan manually using "iw scan" and I saw all the expected BSS's. I isolated it to the fact that IWD was setting the SCAN_FLAG_COLOCATED_6GHZ 
> and removing that flag resulted in all the BSS's showing up in scan results. Note, that with or without the flag all the 2.4/5ghz BSS's were showing up without 
> a problem, it seems completely isolated to the 6ghz band.
> 
> The NEW_SCAN_RESULTS event was indicating the kernel had scanned all the expected frequencies we were asking to scan, but the results were mostly empty for 
> 6ghz. Only ever the connected BSS would show up and _sometimes_ another BSS, but generally not.
> 
> I'm trying to read through the code associated with the COLOCATED flag, but its not exactly intuitive (to me at least). I'm not sure if this is something with 
> mac80211 or at the driver level. I really don't have anything to compare it to as ath11k is the only hardware available at this warehouse with many APs around.
> 
> I'm looking for some guidance on if this is expected behavior with the colocated flag, and if there is any concern with including it unconditionally on every 
> scan. If it has unintended consequences like this, generally, across multiple drivers I'd like to re-think its use in IWD.

I had some similar issues using hostap, and hacked it to do every 4th or so scan with that
flag set differently.  Hopefully that lets the 'fast' scan work when it can, but still lets one
scan the hard way...

Possibly there are driver concerns too, I was using Intel be200 when debugging this.

Thanks,
Ben

> 
> Thanks,
> 
> James
> 
> 

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



