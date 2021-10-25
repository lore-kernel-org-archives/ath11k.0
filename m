Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194C3C433F5
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 20:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D1960C4A
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 20:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9D1960C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZ1CeYWI3EvWfychQC0sq42LxJWLD06sQS+abpXSLZ0=; b=eba2Nk7VrTs0lq
	sIO3eKhHl1RpmwHdZT0GFR6jvMjOkJ//HbFoGE5ZmVDHmQrUdkSRr1ApvVQV1Jgl3KorCo5QdnONV
	UcXy1VaMG20iTo6/KCJbAVJg9rEGOJIWMi/eHsecBuwuKWrHOCektWrES2q2Xci1dBn8TBg2K0Dw+
	Tkq57LHVrUoQIxRttlyJSznBBlX9ghzKzuXfrCninz6F8SLQzHDaDjjuo+M5LTNshmVU1IMn6Of3z
	ZbR6NWLd88f7Sk24pKt+A0OCiMAkwMLYHbDfHVHeNtAB7ke4C5Rxpuv7Xoq9l75YQqFB+x5OWYGNt
	VVlqzYABdQ+GqcfV9MXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf6HZ-00HYSy-Kl; Mon, 25 Oct 2021 20:09:21 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf6HX-00HYSF-Fi
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 20:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=GpkhE+rafTAix/3cb7phz/iDwq5GT627KOA3yMMtjXk=; 
 t=1635192559; x=1636402159; b=vvDdbYoPwLnFqWrb7B3AEv16CWo4zVC5uJjXgcjHHLtwqb1
 OifWtOtlgprcKzJ54l3CdyMm3MjaYOi/YB9xwV/zdINF5gPMnrJku26Uqrdbl11IYck2rexuSi78Q
 X0tLOISm306/N6oqdqY9cwkPqPgZ6jMpbzTzi1SqPQs3SlgUwTjJRgmHuIUPNXDqiI8UhaupB/VHr
 0XaukLE3SDg/eWgZQ0r7EErbKw3L9uEEzk+mHrI7k2y7v6IPIy3gCxumlDm0UEUqNUyQowLethwHk
 BQ+ockQ5S9daQ/kbRofkn4x+MmGbt9/SzhwWZltnVkPhxHSvS8rtZTLM55oXoIEA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mf6HW-006qRd-1F; Mon, 25 Oct 2021 22:09:18 +0200
Message-ID: <18363bc18538ea9b7e8fe28f4c5595c54f3b93d3.camel@sipsolutions.net>
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, Venkateswara Naralasetty
 <vnaralas@qti.qualcomm.com>
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 wgong=codeaurora.org@codeaurora.org
Date: Mon, 25 Oct 2021 22:09:17 +0200
In-Reply-To: <0b05f6e555bcb89c49f56279c077ce63@codeaurora.org>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
 <2ed76cff292dcca18326de0407a93821@codeaurora.org>
 <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
 <562080d7fc3b7568811c47a8e8e79156@codeaurora.org>
 <DM8PR02MB8154258563A4F7C805C84B4BE6B59@DM8PR02MB8154.namprd02.prod.outlook.com>
 <0b05f6e555bcb89c49f56279c077ce63@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_130919_554973_D8434595 
X-CRM114-Status: GOOD (  11.57  )
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

On Mon, 2021-10-11 at 15:48 +0800, Wen Gong wrote:
> 
> > IMO, Only power rules and PSD info might vary for AP and STATION. Rest
> > of the rules will remains same right?
> > 
> The freq_range may also be different for AP and STATION.
> and reg_rules number also may also be different for AP and STATION.
> 
> for example:
> SUBORDINATE CLIENT of STANDARD POWER reg rules number 2
> reg rule 1: (5945 - 6425 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17 
> dB/MHz)
> reg rule 2: (6525 - 6885 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17 
> dB/MHz)
> 
> INDOOR AP reg rules number 1
> reg rule 1: (5945 - 7125 @ 160) (0, 24) (FLAGS 0) (psd flag 0 EIRP 0 
> dB/MHz)

That seems right, but isn't that an orthogonal question?

Here, on this patch, we're discussing what data we should have in the
channel information, and it would seem that if it's different for
AP/client, then we do need both information stored, so that we can cope
with concurrency between AP and client?

If we additionally need to have different data for the regulatory rules
for AP and client, that might mean we need to go back and actually
change the code there *as well*, and then fill in the right fields in
this patch?

Unless somehow we're convinced that for this feature we don't need to
worry about concurrently using AP and client modes?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
