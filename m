Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571A5EB64D7
	for <ath11k@archiver.kernel.org>; Mon, 26 Jun 2023 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	To:Subject:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8GrX2qZtq4ldn5crV1Iho8u1Nhgj8kv2VCUkBkpHJY=; b=tZyYPmn8BEfg+d
	RjAoaV3aVC1p6CfTw3V+cCUjt6niGga2FwyHfY+HQAx2P2b3HCRd+k6LHptCgip5miGNZXvVIUH21
	uZHV86hB5nECULLeTtN2sLEFRmmHC/vutJ3lCTvXaqhMQPboPnh1fok1mDAvf20+ADefqaKaGCuTa
	BUlWEVwlSGxsYoQPrQX6KCx1uWaRVUCqnqki/ySdpvT58jiryKAE9P7eutGoymYmNZwnIshJpfTcv
	NzXRXhN/B6cu1u+raAJKozqopAplpVAgq0FP2HewXvX9K/GmGuYr5gwowjscgoXOchX4sZU/ZsSaj
	iq8HPt2PM12kQrwrEVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmcC-00AKKQ-2n;
	Mon, 26 Jun 2023 13:50:48 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmcA-00AKJN-25
	for ath11k@lists.infradead.org;
	Mon, 26 Jun 2023 13:50:48 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qDmc4-0007HL-Tq; Mon, 26 Jun 2023 15:50:40 +0200
Message-ID: <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
Date: Mon, 26 Jun 2023 15:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: ath11k: QCN9074: low HE-MCS index
Content-Language: en-US, de-DE
To: Tanguy Serrat <tanguy@squaremind.io>, ath11k@lists.infradead.org
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687787446;7b25c32e;
X-HE-SMSGID: 1qDmc4-0007HL-Tq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_065046_831845_9ECAAED0 
X-CRM114-Status: GOOD (  17.77  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 26.06.23 14:27, Tanguy Serrat wrote:
>
> In my quest to get 2x QCN9074 paired and achieving high throughput
> data transfers, I am now facing issues with the AP configuration.
> 
> Specifically, I cannot get more than HE-MCS 5 (AP and client 50cm
> apart) although SNR and RSSI are always very strong and supposedly in
> specs (SNR > 40db or RSSI < -48db).

FWIW for anyone seeing this that might wonder: yes, this is the same
issue that is already brought up on the lists here:

https://lore.kernel.org/all/1326a6e4-758d-3344-d90c-8a126748b034@gmail.com/

Sadly nothing much came from it (and coincidentally I tried to revive
that thread a few minutes after Tanguy Serrat sent the quoted mail,
which was an hour before I saw it -- aka: race condition). Well, maybe
one of these mails hopefully will help.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot ^backmonitor: d90c-8a126748b034@gmail.com/

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
> 
> Thank you !
> Tanguy
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
