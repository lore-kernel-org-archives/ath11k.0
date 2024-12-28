Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E11E77188
	for <ath11k@archiver.kernel.org>; Sat, 28 Dec 2024 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS3W6Nm33y8lf/E3f46CoorgvUQmeVLhar9Ww+z/EqE=; b=Fli94mSsJvojqGTmPcmonztL05
	b0gkYRQooHEUfFN5PYRcsSrXUEToOKLaMTaBdU3fcHYb9v6BiQFos/jvHA4+bcVCUNcL07hLlx9Hj
	QqNWI65zswNQZLsGGXN+jHiMqnNeCscbu3fkN3JFgA/o6ky73YkQncO8edI1q7ivHR7ZofKU24Szo
	rFwKa8AJ4dg4bL7PqJmjsAgq+nzsSNp8MYuoc/oPqbbKAapm2tXHW/x6ILbHoae6hgqwEqbHZ0QEu
	8Fj/zED5jCMzfeVpOFdp+zKW8HhdCUkHj3kTy75gJGmPtNtEpFGXhwTJB6khoqTBXsAOfANBAAD/k
	pmv0R0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTpZ-00000001iOk-3krs;
	Sat, 28 Dec 2024 10:14:01 +0000
Received: from dd54106.kasserver.com ([85.13.166.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTpW-00000001iO0-0HsE
	for ath11k@lists.infradead.org;
	Sat, 28 Dec 2024 10:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen-moser.de;
	s=kas202408292216; t=1735380831;
	bh=XS3W6Nm33y8lf/E3f46CoorgvUQmeVLhar9Ww+z/EqE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gzWNowYv4YlvX3VoF4Fql17e30OHgBgj2ZutUcoIIbq+3up32DNEKJA7xlLZEx/kw
	 oTEox7nMrN88SGmuRuj9J+aU4DUlbSSzgejmUmvsapM8K9OJLIAuTfCbIwKQBWi7pe
	 H4sjJ2ymS20JA5GCyLV3ZO1L39UOhRdAfAa9PC2A/qtM9C2ldqOq1ubj8QAx0kYE5y
	 qVKCYMP6hARUJu4i75HU/5BDN8DV5FoxqHnk0Chl9jGfkjCKzae4kQd0qGucpC5L8N
	 Fhvfxah4v+M/nofu1Jgp0Qj2hiwI6T4a/z5WYi4Ui1msGcR+yMjBSNqQeSNGAH3yoP
	 OWaqUKu0KfI2Q==
Received: from [192.168.1.101] (p54a3711d.dip0.t-ipconnect.de [84.163.113.29])
	by dd54106.kasserver.com (Postfix) with ESMTPSA id 39B85E4A034A;
	Sat, 28 Dec 2024 11:13:51 +0100 (CET)
Message-ID: <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
Date: Sat, 28 Dec 2024 11:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k with
 IPQ8072A (QCN5024/QCN5054)
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
 <Z2Q9POuV-6MIdzRf@pilgrim>
Content-Language: de-DE, en-US
From: Steffen Moser <lists@steffen-moser.de>
In-Reply-To: <Z2Q9POuV-6MIdzRf@pilgrim>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_021358_555503_DA0BB441 
X-CRM114-Status: GOOD (  13.77  )
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

Dear Remi,

thank you very much for the pointer to the patch. Sebastian integrated 
it into DD-WRT. Now the DynaLink DL-WRX36 runs absolutely smoothly, the 
WLAN links are stable, the packet loss is gone. No weird states anymore, 
independent from the group key exchange interval:

https://data.saps.uni-ulm.de/index.php/s/NLNpWqjc8iGsaEM

So your idea was a direct hit! Thank you very, very much. Several months 
of debugging have come to an end...

Thank you very much and all the best for 2025!

Kind regards,
Steffen

On 19.12.24 4:35 PM, Remi Pommarel wrote:
> Hi Steffen.
> 
> On Thu, Dec 19, 2024 at 04:02:30PM +0100, Steffen Moser wrote:
>> Hello everyone,
>> 
>> I've encountered a possible issue in a DD-WRT [1] setup where broadcast
>> packets stop being delivered after a GTK (Group Temporal Key) exchange. This
>> issue occurs on a system with the following hardware:
>> 
>>     Access Point Hardware: DynaLink DL-WRX36
>>     Router Software: DD-WRT v3.0-r58819 std (12/13/24)
>>     CPU: Qualcomm IPQ8072A
>>     WiFi Chips: Qualcomm QCN5024 and Qualcomm QCN5054
>>     WiFi Driver: ath11k
>>     Firmware: WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
>>     NSS FW version: NSS.FW.12.5-210-HK.R
>>     Kernel: Linux WL-AP-EG 6.6.64-rt29 #1791 SMP Thu Dec 12 16:41:51 +07
>> 2024 aarch64 DD-WRT
>> 
>> The behavior is such that after a GTK exchange, the AP can get into a "weird
>> state". When being there, broadcast frames like ARP or mDNS are no longer
>> reliably delivered to connected clients while unicasts come still through.
>> In this "weird state", the channel quality (active time vs. busy time) goes
>> down and latencies to the still reachable WIFI clients rise.
> 
> This looks a lot like an issue we hit a while back. There is this patch
> [0] from Qualcomm's wlan-open repository. It is a revert of [1]. Using
> that the issue was never reproduced. Maybe this can help.
> 
> Also adding ath11k list.
> 
> Regards.
> 


