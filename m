Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FD4C4332F
	for <ath11k@archiver.kernel.org>; Tue, 20 Dec 2022 13:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhaQTu9eYyXIv64uhb4effLTzL/hyMjw5GaJwOWwECI=; b=Z4nn0H8CNTPIOu
	gWePrfelb2x8bLE5ZOQPca0Rr4YptX2mhePBf6UM0KlP3MGBz2AO6di4xw23s3pCAkcXL7kBk325x
	fnAnuW4J3/dEWZ42zhJZ7XW7AjKh8QtZjrrnWrQUFMIWX6y5/v/h+yTdmSHz8DEe6yZTuORXzQhUo
	w5Fb3MXoMq7l2MI4ld+WKyuV1A8i+AZleLGlKjkI7UZICrS3vfxHh4dsrNUKUUqh/3OO80+t4V1wK
	eg9kF5HUiaGT9uQwv1CqAG8cbeBCVEXooZ/A9maP2jPaurgmmfXTpVJ6jdco9iqwtb49hAlgUYLVa
	EBHyOW9Gf27c7iogosZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7cKq-00FVAA-3F; Tue, 20 Dec 2022 13:07:08 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7cKN-00FUe1-1N
	for ath11k@lists.infradead.org; Tue, 20 Dec 2022 13:06:41 +0000
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
	by mail.holtmann.org (Postfix) with ESMTPSA id 2BAC7CED05;
	Tue, 20 Dec 2022 14:06:27 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
Date: Tue, 20 Dec 2022 14:06:26 +0100
Cc: ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Message-Id: <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_050639_293370_9643F0BE 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Manikanta,

> Currently, time taken to scan all supported channels on WCN6750
> is ~8 seconds and connection time is almost 10 seconds. WCN6750
> supports three Wi-Fi bands (i.e., 2.4/5/6 GHz) and the numbers of
> channels for scan come around ~100 channels (default case).
> Since the chip doesn't have support for DBS (Dual Band Simultaneous),
> scans cannot be parallelized resulting in longer scan times.
> 
> Among the 100 odd channels, ~60 channels are in 6 GHz band. Therefore,
> optimizing the scan for 6 GHz channels will bring down the overall
> scan time.
> 
> WCN6750 firmware has support to scan a 6 GHz channel based on co-located
> AP information i.e., RNR IE which is found in the legacy 2.4/5 GHz scan
> results. When a scan request with all supported channel list is enqueued
> to the firmware, then based on WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND
> scan channel flag, firmware will scan only those 6 GHz channels for which
> RNR IEs are found in the legacy scan results.
> 
> In the proposed design, based on NL80211_SCAN_FLAG_COLOCATED_6GHZ scan
> flag, driver will set the WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND flag
> for non-PSC channels. Since there is high probability to find 6 GHz APs
> on PSC channels, these channels are always scanned. Only non-PSC channels
> are selectively scanned based on cached RNR information from the legacy
> scan results.
> 
> If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set in the scan flags,
> then scan will happen on all supported channels (default behavior).

is this really a good idea? The interpretation on what scan results will
be reported would be preferable the same no matter what hardware is
present. Why would ath11k now have a different behavior?

And more important, why is this something driver or even Linux kernel
specific. Let userspace select the frequencies to scan.

Looks like that iwd and wpa_supplicant set this flag regardless which
means to me that a driver should respect the requested frequencies to
be scanned.

Anyhow, if you worry about time-to-connect, then fix userspace to be
smart with scanning. I am also confused on how a savings of 1.5 seconds
out of 8 seconds is significant. It still means you spent 6+ seconds
in the 2.4 GHz and 5 GHz bands. I assume that you spent most time in
5 GHz right now.

I highly doubt that a 6+ seconds plus 2 seconds connection time is
anywhere acceptable. Have you tried using iwd and see what the
connection time actually is after initial connection.

Regards

Marcel


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
