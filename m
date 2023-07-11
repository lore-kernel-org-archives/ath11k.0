Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BECEB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm0YGBxEUgthb2NNKqEsJG12WMM0HDuceVshfWld/Us=; b=NWWI3tm2Inx1+3
	v3rGZRV1NYXrgiBsL5YyMM5Pjqn5QqsKxfeOEkY6fgn8DwaSwgj6DfYf4Rz634zCcmYXVo7WNAt+b
	R3fGzs4M9VjY1Bovg3RPdevWf4gyIEKo8ZDUDWhwuJniB6fUCKu5tIkzkpuLOJHLABKdLgNzTSo4f
	pwFK2OVv4n6JorDQpnBPWAGnj3sMLQsm14EVpvV1MLBairC5Hn6ZecKr04GX7jid5IJf8yE4eYraa
	eIP2is6SD+3s8y0ALlt5uS2PhM++u0SvmCNKMhe8hNETbKUFlQ6/RXqJOh8pJ3vGy55D3LjExAnvc
	lX/wsM1i/P2Gho9Afmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7C7-00Dul0-1N;
	Tue, 11 Jul 2023 06:49:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7C4-00DukZ-2F
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 06:49:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02AB16129E;
	Tue, 11 Jul 2023 06:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C1EC433C8;
	Tue, 11 Jul 2023 06:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689058191;
	bh=kMqc4557kO524fJh538D17lXbwyN05bdTMQspaBTnBk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=m4AYyun+xHcWRh3zx+i+AL0rUx/01TICRittGnHRxVh7cjTWYTdge4ElasA/PfOKd
	 d83VqKZUCRlIwr1b0KiQbzl3p53olXj7/zMcTkhePz7l/D7CwtLwjVw/3+QLvxM+IY
	 XTJ1Fa2tg3bJtNPKybztAIIh7pIpMrd6HrUvJGcKAmsb1Cm8uSEomiJ26cug0F5cgE
	 y1zPA18ggMPiO2HubFqB7LX1lbKnh8HFdhMBeuY/uPdNM1ko2EUXtEHL7O/5iYkb6D
	 a6m2H9Nx821GLR9Q/7QRyOEHsB8O/0Wgn0KrXpr+vf+wgDEUT468y9MEX6lLiRMgCG
	 Xj/DIYZgw96nQ==
From: Kalle Valo <kvalo@kernel.org>
To: Tanguy Serrat <tanguy@squaremind.io>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: low HE-MCS index
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
Date: Tue, 11 Jul 2023 09:49:48 +0300
In-Reply-To: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
	(Tanguy Serrat's message of "Mon, 26 Jun 2023 14:27:25 +0200")
Message-ID: <87sf9v7xir.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_234952_824070_D6284787 
X-CRM114-Status: GOOD (  18.54  )
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

Tanguy Serrat <tanguy@squaremind.io> writes:

> Hi everyone,
>
> In my quest to get 2x QCN9074 paired and achieving high throughput
> data transfers, I am now facing issues with the AP configuration.
>
> Specifically, I cannot get more than HE-MCS 5 (AP and client 50cm
> apart) although SNR and RSSI are always very strong and supposedly in
> specs (SNR > 40db or RSSI < -48db).
>
> iw wlp6s0 link
> Connected to 00:15:61:27:cd:dc (on wlp6s0)
> SSID: Space
> freq: 5745
> RX: 1073584482 bytes (708567 packets)
> TX: 355824214 bytes (256143 packets)
> signal: -40 dBm
> rx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
> tx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
>
> In this case iperf3 shows ~950Mbits/s transfer speed. I am hoping to
> get at least twice as much.
>
> It seems to me that either mac80211, ath11k or hostapd are not
> advertising the available capabilities correctly. I have tried setting
> hostapd he_basic_mcs_set=65530 or others but did not help.
>
> I have added ieee80211_regdom=FR option to cfg80211 module on the AP
> side. Channel selection is done with ACS survey. I also tried other
> channels/frequencies without success eg. 5500Mhz.
>
> iw reg get
> global
> country FR: DFS-ETSI
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> (5725 - 5875 @ 80), (N/A, 13), (N/A)
> (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
> (57000 - 71000 @ 2160), (N/A, 40), (N/A)
>
> phy#0 (self-managed)
> country US: DFS-FCC
> (2402 - 2472 @ 40), (6, 30), (N/A)
> (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
> (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
> (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
> (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
> (5945 - 7125 @ 160), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW
>
> Current setup is:
> - Intel x86
> - Ubuntu 22.04
> - Kernel built from ath 6.4.0-rc6-wt-ath+ (commit:
> c60d15f389ef9832a8da410e438d81b10327751f)
> with commit reverted from the bug ticket I opened
> (https://bugzilla.kernel.org/show_bug.cgi?id=217536).
> - 1x QCN9074 as AP, 1x as managed client 50cm apart
> - Both AP and Client are running with the latest 2.7.0 FW.
>
> I have started from this ticket
> (https://bugzilla.kernel.org/show_bug.cgi?id=217286) hostapd config
> file, and adapted, please find attached.
>
> Anyone seeing what could be my issue / how I could debug further ?

As a start please file this to bugzilla as a new bug. Always one issue
per report, please. Otherwise it's a nightmare to manage the bug
reports.

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

Try to provide as much as information as you can to the report. You said
that you have tested it 50 cm apart but have you tested it, for example,
3 m apart? Please also include your full kernel .config file and dmesg
output.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
