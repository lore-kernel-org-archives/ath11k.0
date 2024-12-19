Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68A0E7718B
	for <ath11k@archiver.kernel.org>; Thu, 19 Dec 2024 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp2L3uEUm7hSWsN+mutJbLRfBO2anB2NNVaERm/wx2w=; b=Ar7WSiLlEpg4A5f7KxELkAE/+y
	FCQnWSNvAUkTJdyTqD+IJ6UqEfoDHQA7NHHOwbBglZRKB7m03p1orgBMzwDYaVMPLnRwyzB6iy7T5
	tBDNrhqZCcj0up5v2/37NkvvOXiPW+bWodtd7+l9FLQ2zXbvViNu6DI37iVBxaCzSvHOHV6qQybFv
	o5YsepuvFS0gHxZ7xs/YulxXGQ5Uv/0fy79+0z8pvT27ilFytwzlI6baoNYrpTkZuWWVDXxB9KQTh
	6AILEzDKvbJ72n3067d95BGHPgmztCmGC5C80wKTMIL5z+arttOWcy0U4R/sYBKp9IPx7UIlUETGM
	5WsCqvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIb7-00000002BbT-0VmY;
	Thu, 19 Dec 2024 15:37:57 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIb4-00000002BaS-0aDE
	for ath11k@lists.infradead.org;
	Thu, 19 Dec 2024 15:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1734623571; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=Wp2L3uEUm7hSWsN+mutJbLRfBO2anB2NNVaERm/wx2w=; b=ZnrqEffLnDu1GGIdrIYC4BQU/t
	LbNwtnakQfnpIZ9TN8do3heW5HpHiL/JeBpoRto01V+NSK/rGrhcOwTGDOVDfYYThOM0lvSTE3d21
	3l0L57idgXhBuPT8a7RqFvIfJy/7h1tKGHnxCaXv1yNiJw5R1kEThn0n1MXE1hhHWLL5b6JHjqHW9
	AncOHfaeVletOAR9IZhv5r7Pm+U/yl9HJUWdgr8IQVbUyjQcUgQw/Ecj2/WM+JS38EZnc8LNIhUDg
	nG89sMz1Tt2oZ0Nb0YJUhAtICwS+gmLqDiJvvmirAFFfvhvz/8K9YJTFeF8JOPFzZ0CTEQwU6zZ9B
	6Gbm1VoQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1734622671; h=from : subject
 : to : message-id : date;
 bh=Wp2L3uEUm7hSWsN+mutJbLRfBO2anB2NNVaERm/wx2w=;
 b=htsIsm3o8vQaGI6h835OFACaguA9KyGrfSe/wwvhkqt/y6rJUHLutb12V6oqSPr0F5iP7
 c5V60vZyvzN2wvZMCpIfYLeGWGHosKpVaCqCK7pIeS0QCBVrTYDcdKAeM0PROKzXtVciI/a
 3Gaivh2hQUQ74M1U/NjBs5hLQodddnVPUOr7At0dAX1H3SevFF12zxVF1obJ6QNeQMp1UZ7
 a44vpSg7FiUgEmgtVCuR5IbrdWs03VEjJAOCmn97/VWFGpZ/EjUHFWDzH8XJxh16GXMhtiv
 Fv7uqlJkR6KRz4DFucpfZoBESo6zbfJ+q95n8ae+2YGZlNlRdwmTbKAxnrAw==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1tOIam-TRjxRX-Ql; Thu, 19 Dec 2024 15:37:36 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1tOIam-AIkwcC8wN5I-J9DO; Thu, 19 Dec 2024 15:37:36 +0000
Date: Thu, 19 Dec 2024 16:35:24 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Steffen Moser <lists@steffen-moser.de>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k with
 IPQ8072A (QCN5024/QCN5054)
Message-ID: <Z2Q9POuV-6MIdzRf@pilgrim>
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
X-Smtpcorp-Track: sojrnt8ArnXe.us5EpZRlN732.M588ywln-3n
Feedback-ID: 510616m:510616apGKSTK:510616sa-rS1axUN
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_073754_580010_E4E7CC16 
X-CRM114-Status: GOOD (  28.92  )
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

Hi Steffen.

On Thu, Dec 19, 2024 at 04:02:30PM +0100, Steffen Moser wrote:
> Hello everyone,
> 
> I've encountered a possible issue in a DD-WRT [1] setup where broadcast
> packets stop being delivered after a GTK (Group Temporal Key) exchange. This
> issue occurs on a system with the following hardware:
> 
>     Access Point Hardware: DynaLink DL-WRX36
>     Router Software: DD-WRT v3.0-r58819 std (12/13/24)
>     CPU: Qualcomm IPQ8072A
>     WiFi Chips: Qualcomm QCN5024 and Qualcomm QCN5054
>     WiFi Driver: ath11k
>     Firmware: WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
>     NSS FW version: NSS.FW.12.5-210-HK.R
>     Kernel: Linux WL-AP-EG 6.6.64-rt29 #1791 SMP Thu Dec 12 16:41:51 +07
> 2024 aarch64 DD-WRT
> 
> The behavior is such that after a GTK exchange, the AP can get into a "weird
> state". When being there, broadcast frames like ARP or mDNS are no longer
> reliably delivered to connected clients while unicasts come still through.
> In this "weird state", the channel quality (active time vs. busy time) goes
> down and latencies to the still reachable WIFI clients rise.

This looks a lot like an issue we hit a while back. There is this patch
[0] from Qualcomm's wlan-open repository. It is a revert of [1]. Using
that the issue was never reproduced. Maybe this can help.

Also adding ath11k list.

Regards.

-- 
Remi

[0]: https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-keys-properly-when-DISABLE_K.patch
[1]: commit 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")

> 
> I've come across a related bug report on GitHub that describes a similar
> issue:
> https://github.com/openwrt/openwrt/issues/9555#issuecomment-2433857175
> 
> Unfortunately, the GitHub discussion drifted towards various other possible
> bugs.
> 
> In the meantime, I have a done a lot of additional debugging, but I am
> coming to a dead end due to limited knowledge of the ath11k driver and
> firmware internals. Interestingly, the AP can get back from "weird state" to
> "normal state" after another GTK rekey event. I've seen this behavior only
> in the 5 GHz band, yet (using non-DFS-channels).
> 
> My questions to the Linux wireless experts and developers in this community:
> 
>  · Is such a behavior known with ath11k on IPQ8072A or on the mentioned WiFi
> chips (QCN5024/QCN5054)?
> 
>  · Could this be a driver or firmware issue that specifically arises after a
> GTK or even GMK exchange?
> 
>  · What can I do to debug it further? I've switched on debugging in
> "hostapd" in order to see the keying events. Are there more lower-level logs
> I can get from the WiFi chip and match to the latency and key exchange
> observations?
> 
>  · Are there any additional information I can/should deliver to give the
> devs more insight about this issue?
> 
> When exchanging the DynaLink DL-WRX36 AP by a Netgear R7800 AP (CPU: QCA
> IPQ8065), its predecessor, the problem is gone without touching any of the
> clients.
> 
> Thank you in advance for any insights or experiences regarding this issue.
> 
> Best regards,
> Steffen
> 
> [1] https://dd-wrt.com/
> 
> 
> -- 
> ✂-----------------------------------------------------------------------
> Dipl.-Inf. Steffen Moser                  Tel (Office): +49.731.50.32407
> School of Advanced Professional Studies       Ulm University, Room: 1013
> https://wissenschaftliche-weiterbildung.org/    Oberberghof 7, 89081 Ulm
> https://saps.uni-ulm.de/                                         Germany
> 

