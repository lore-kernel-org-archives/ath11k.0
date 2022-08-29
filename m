Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31932ECAAA4
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SU9e2gppKG65mvQujGKyYsFHzT6BQ/V4/Eeha9LHAPk=; b=2809Z0lj3GAY03
	EyFJPQ1lae1izpzZr0ZdW9KzsFkzMfonJ6S0NvOwKKlMHGvMxvs8IUUuZSsl7CN2He8cGpRYSn//J
	BGooEXcjB0g/yMklS3PV2xejLsA/XoMfhbJGA0Yue99MaoheTFrrmIrrCqtE9T3gnxWxreeOFDQkm
	pT9Nr2SL6juP2IjFkJZhc7x1NKNKnNkFG0zVz3l/7L5L1jnXogZrigMfbyvfIpTKXWALZpEyQyhvz
	xr3zIpg6WojVitBVEEHu7CNNCO/Zmd6Q6PZjciBlG3MHWPrBZecc79uIJNVkql51ixPjKAfxQXGcl
	MEyNHrIzXZtrtfdZM5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiXZ-00C2VB-Ei; Mon, 29 Aug 2022 17:27:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiXW-00C2Ub-2Q
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 17:27:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF7B8B8119A;
	Mon, 29 Aug 2022 17:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C3FC433C1;
	Mon, 29 Aug 2022 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661794026;
	bh=LngYf8P+LI6UrANiDYF1odyCTinChzauYVwqE9jZYEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnRPX5hGG/m2kiEPTmqWQY6QvgVVXyPU+eqjZ5agyPQQsKK/io9g7B/AvQtz+lCWz
	 WVq2GV+8lgaASRcL9+bJx3+eLbPu577683lRTJblVXNFKm5HMT3ClCSrLxO8bSsMg/
	 qZ4enOxWahqgcMobW+Wg1Q6JelWe1Fc+bsUMKPC8ikwv4y7RMdAW0cS7gBxVQivfLd
	 TkBudKMcPDibwIOgu0m2d6ccR8x3vxTuTvTWhJjpCqpiI+qDh+/6VfzGzdtUJEjXDq
	 yz4Et2enr5+rLrzo8WH75UqHVmRGgebfu9NXqI+JYY0zBMnYLXtYkVgzbB1PowQSbe
	 yKAdGB86SAeCQ==
Date: Mon, 29 Aug 2022 22:56:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, quic_hemantk@quicinc.com,
	loic.poulain@linaro.org, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in
 mhi_irq_handler
Message-ID: <20220829172654.GA84762@thinkpad>
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
 <20220726080636.GE5522@workstation>
 <87czdrrc95.fsf@kernel.org>
 <20220729142221.GA9937@thinkpad>
 <87h71vc98l.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h71vc98l.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_102710_305361_BB8623C0 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjksIDIwMjIgYXQgMDc6MjA6MTBQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3JpdGVzOgo+IAo+
ID4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMDg6NTM6NThQTSArMDMwMCwgS2FsbGUgVmFsbyB3
cm90ZToKPiA+PiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3JpdGVz
Ogo+ID4+IAo+ID4+ID4gK2F0aDExaywgS2FsbGUKPiA+PiA+Cj4gPj4gPiBPbiBGcmksIEp1bCAy
MiwgMjAyMiBhdCAxMToxNzoxOEFNICswODAwLCBRaWFuZyBZdSB3cm90ZToKPiA+PiA+PiBUaGUg
aXJxIGhhbmRsZXIgZm9yIGEgc2hhcmVkIElSUSBvdWdodCB0byBiZSBwcmVwYXJlZCBmb3IgcnVu
bmluZwo+ID4+ID4+IGV2ZW4gbm93IGl0J3MgYmVpbmcgZnJlZWQuIFNvIGxldCdzIGNoZWNrIHRo
ZSBwb2ludGVyIHVzZWQgYnkKPiA+PiA+PiBtaGlfaXJxX2hhbmRsZXIgdG8gYXZvaWQgbnVsbCBw
b2ludGVyIGFjY2VzcyBzaW5jZSBpdCBpcyBwcm9iYWJseQo+ID4+ID4+IHJlbGVhc2VkIGJlZm9y
ZSBmcmVlaW5nIElSUS4KPiA+PiA+PiAKPiA+PiA+PiBTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8
cXVpY19xaWFueXVAcXVpY2luYy5jb20+Cj4gPj4gPgo+ID4+ID4gUmV2aWV3ZWQtYnk6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+ID4+IAo+ID4+IFRoaXMgZml4ZXMg
dGhlIGNyYXNoIGFuZCBteSByZWdyZXNzaW9uIHRlc3RzIHBhc3Mgbm93LCB0aGFua3MuIEJ1dAo+
ID4+IHBsZWFzZSBzZWUgbXkgcXVlc3Rpb24gYmVsb3cuCj4gPj4gCj4gPj4gVGVzdGVkLWJ5OiBL
YWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgo+ID4+IAo+ID4KPiA+IFRoYW5rcyBLYWxsZSEK
PiAKPiBJIGp1c3QgdGVzdGVkIHY2LjAtcmMzIGFuZCBpdCdzIHN0aWxsIGNyYXNoaW5nLiBXaGF0
J3MgdGhlIHBsYW4gdG8gZ2V0Cj4gdGhpcyBmaXggdG8gTGludXM/CgpTb3JyeSBmb3IgdGhlIGRl
bGF5LiBKdXN0IHNlbnQgdGhlIFBSIHRvIEdyZWcgZm9yIGluY2x1ZGluZyBpdCBhcyBhIGZpeCBm
b3IKdjYuMC4KClRoYW5rcywKTWFuaQoKPiAKPiAtLSAKPiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KPiAKPiBodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3Bh
dGNoZXMKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K61
4K6u4K+NCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
