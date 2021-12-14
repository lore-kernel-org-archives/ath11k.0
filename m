Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1CBC433FE
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/utCUMKH/7KdRbUXRMEwrGL3LrB5PwSXyprK9nRux4Y=; b=A5/Hpw6kHTsekd
	5wDAtoRnodRVulHQTL8rT0TeM++QZ54kTpib7y6XFGsJnGoSvSkYm4/3e6I7K66k+yGp/Wl8ANQT0
	8I41vAA7dsHrjQ9brQvDqKIuB4YS1MYB/7yfeLI8h2EQnfqi344TDBPnwaIbZqPJNspt6PvamZR1l
	jNUrvqDjvkHfIL09qVVAqpvzkUo66y6jQbGXtdrqHHptAmBkXTIQd+iSbpTK+yrVqIyX2HXdtU7mm
	ENbdM+Bzmp0VrHhlT2J98jDBNWt+Dwji51vH7YxMc49kqCus4+OPK8BmIWyCRFqIR14xCdr0H7vz9
	NOaBJTJxgd4xmYO5veQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxC4s-00FF5T-2L; Tue, 14 Dec 2021 17:59:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxC4p-00FF4o-55
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 17:59:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4ACF6164C;
 Tue, 14 Dec 2021 17:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA67C34604;
 Tue, 14 Dec 2021 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639504738;
 bh=wd3hEmUp35y38scIqT4w13Xrb9Of8JrKrqMwSHKwESw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=b88EmfD+Ad+teyREWtaWwpwoFBTQRqDpUV78SxkZi36Drf7k8bMSEsjC0mdyaCqAV
 yElDWPkjSmuHiL5MS8rBlq0D+WD+8hgrrXcHBMFJ2m8x59eo7Nw5a6vTXKufM+EdD2
 nqHNawMjWIVQButxljI2QnnnEr48aSWMhSwEMQOgjPZTTb6NaQM3J/+9cWRYLCa1zh
 AyK8SnHF6Ftny90idA265/V1fSZ3ay0v91/76DWCVTnA2DsLMeQ7ZGQ7KKIMaA2xPO
 L8XQIRKA2vS+0K2tHrnckM8UGAwwNT+67tsCxG7YKEl6hh9RZcs061JIMJSjTVj6M/
 tOwdIcumRx8Pg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: report tx bitrate for iw wlan station dump
References: <20211213102723.4857-1-quic_wgong@quicinc.com>
Date: Tue, 14 Dec 2021 19:58:53 +0200
In-Reply-To: <20211213102723.4857-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Mon, 13 Dec 2021 05:27:23 -0500")
Message-ID: <87y24ngjaa.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_095859_284114_8878E5D9 
X-CRM114-Status: GOOD (  12.01  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> HTT_T2H_MSG_TYPE_PPDU_STATS_IND is a message which include the ppdu
> info, currently it is not report from firmware for ath11k, then the
> tx bitrate of "iw wlan0 station dump" always show an invalid value
> "tx bitrate: 6.0 MBit/s".
>
> To address the issue, this is to parse the info of tx complete report
> from firmware and indicate the tx rate to mac80211.
>
> After that, "iw wlan0 station dump" show the correct tx bit rate such
> as "tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0".
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

I briefly tested this and tx rate didn't look correct to me:

$ iw wlan0 link
Connected to xx (on wlan0)
	SSID: <censored>
	freq: 2442
	RX: 8838 bytes (80 packets)
	TX: 1551 bytes (15 packets)
	signal: -104 dBm
	rx bitrate: 39.0 MBit/s MCS 4
	tx bitrate: (unknown) MCS 253

I guess the signal isn't correct either, are you planning to fix it also
at some point?

Also I see new warnings with this patch:

[  174.373905] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.386303] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.388733] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.472723] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.573331] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.838234] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.881577] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  174.985640] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  175.076154] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  175.113921] ath11k_pci 0000:06:00.0: failed to find the peer by id 14
[  180.206378] ath11k_warn: 34 callbacks suppressed
[  180.206396] ath11k_pci 0000:06:00.0: failed to find the peer by id 14

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
